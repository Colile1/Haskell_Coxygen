# Q3a_Boids_Swarm.py : Boids swarm simulation
# Real-time boids simulation with adjustable radii and strengths for separation, alignment, and cohesion.

import pygame
import random
import math
from dataclasses import dataclass


def clamp(x, lo, hi):
    return max(lo, min(hi, x))

# Pure function: limit vector magnitude.
def limit_vector(vx, vy, max_speed):
    speed = math.hypot(vx, vy)
    if speed == 0:
        return 0.0, 0.0
    if speed > max_speed:
        scale = max_speed / speed
        return vx * scale, vy * scale
    return vx, vy

# Pure function: compute wrapped delta for toroidal space.
def toroidal_delta(ax, ay, bx, by, width, height, wrap=True):
    dx = bx - ax
    dy = by - ay
    if wrap:
        if abs(dx) > width / 2:
            dx -= math.copysign(width, dx)
        if abs(dy) > height / 2:
            dy -= math.copysign(height, dy)
    return dx, dy

@dataclass
class BoidParams:
    width: int = 900
    height: int = 600
    n: int = 120
    max_speed: float = 3.0
    max_force: float = 0.06
    wrap_edges: bool = True

    # Radii
    separation_radius: float = 20.0
    alignment_radius: float = 50.0
    cohesion_radius: float = 50.0

    # Weights
    separation_weight: float = 1.5
    alignment_weight: float = 1.0
    cohesion_weight: float = 1.0

    # Visual scale
    boid_size: int = 6

# Pure function: steering limited by max_force.
def steer_towards(desired_x, desired_y, vx, vy, max_speed, max_force):
    d = math.hypot(desired_x, desired_y)
    if d == 0:
        return 0.0, 0.0
    des_x = desired_x / d * max_speed
    des_y = desired_y / d * max_speed
    steer_x = des_x - vx
    steer_y = des_y - vy
    steer_x, steer_y = limit_vector(steer_x, steer_y, max_force)
    return steer_x, steer_y

class Boid:
    # Simple agent with position, velocity, and acceleration.
    def __init__(self, x, y, vx, vy):
        self.x = x
        self.y = y
        self.vx = vx
        self.vy = vy
        self.ax = 0.0
        self.ay = 0.0

    # Compute and accumulate acceleration from rules.
    def apply_rules(self, neighbours, params: BoidParams):
        sep_x = sep_y = 0.0
        ali_x = ali_y = 0.0
        coh_x = coh_y = 0.0
        count_sep = count_ali = count_coh = 0

        for nx, ny, nvx, nvy, ndx, ndy, dist in neighbours:
            if dist < 1e-8:
                continue

            if dist < params.separation_radius:
                inv = 1.0 / dist
                sep_x += -ndx * inv
                sep_y += -ndy * inv
                count_sep += 1

            if dist < params.alignment_radius:
                ali_x += nvx
                ali_y += nvy
                count_ali += 1

            if dist < params.cohesion_radius:
                coh_x += ndx
                coh_y += ndy
                count_coh += 1

        if count_sep > 0:
            sep_x /= count_sep
            sep_y /= count_sep
            sx, sy = steer_towards(sep_x, sep_y, self.vx, self.vy, params.max_speed, params.max_force)
            self.ax += sx * params.separation_weight
            self.ay += sy * params.separation_weight

        if count_ali > 0:
            ali_x /= count_ali
            ali_y /= count_ali
            ax, ay = steer_towards(ali_x, ali_y, self.vx, self.vy, params.max_speed, params.max_force)
            self.ax += ax * params.alignment_weight
            self.ay += ay * params.alignment_weight

        if count_coh > 0:
            coh_x /= count_coh
            coh_y /= count_coh
            cx, cy = steer_towards(coh_x, coh_y, self.vx, self.vy, params.max_speed, params.max_force)
            self.ax += cx * params.cohesion_weight
            self.ay += cy * params.cohesion_weight

    # Update motion and handle edges.
    def update(self, params: BoidParams):
        self.vx += self.ax
        self.vy += self.ay
        self.vx, self.vy = limit_vector(self.vx, self.vy, params.max_speed)
        self.x += self.vx
        self.y += self.vy
        self.ax = 0.0
        self.ay = 0.0

        if params.wrap_edges:
            self.x %= params.width
            self.y %= params.height
        else:
            if self.x < 0 or self.x > params.width:
                self.vx = -self.vx
            if self.y < 0 or self.y > params.height:
                self.vy = -self.vy
            self.x = clamp(self.x, 0, params.width)
            self.y = clamp(self.y, 0, params.height)

# Pure function: spatial hash cell.
def cell_index(x, y, cell_size):
    return int(x // cell_size), int(y // cell_size)

# Pure function: build spatial grid.
def build_spatial_grid(boids, cell_size):
    grid = {}
    for i, b in enumerate(boids):
        cx, cy = cell_index(b.x, b.y, cell_size)
        grid.setdefault((cx, cy), []).append(i)
    return grid

# Pure function: neighbour candidate indices from adjacent cells.
def get_nearby_indices(b, grid, cell_size):
    cx, cy = cell_index(b.x, b.y, cell_size)
    nearby = []
    for dx in (-1, 0, 1):
        for dy in (-1, 0, 1):
            nearby.extend(grid.get((cx + dx, cy + dy), []))
    return nearby

# Pure function: computes neighbours within the max radius.
def compute_neighbours(i, boids, grid, params: BoidParams, cell_size):
    b = boids[i]
    indices = get_nearby_indices(b, grid, cell_size)
    neighbours = []
    max_r = max(params.separation_radius, params.alignment_radius, params.cohesion_radius)
    for j in indices:
        if j == i:
            continue
        nb = boids[j]
        dx, dy = toroidal_delta(b.x, b.y, nb.x, nb.y, params.width, params.height, params.wrap_edges)
        dist = math.hypot(dx, dy)
        if dist <= max_r:
            neighbours.append((nb.x, nb.y, nb.vx, nb.vy, dx, dy, dist))
    return neighbours

# Output-handling: draw one boid as a triangle.
def draw_boid(screen, b: Boid, params: BoidParams, color):
    angle = math.atan2(b.vy, b.vx)
    size = params.boid_size
    p1 = (b.x + math.cos(angle) * (size * 2), b.y + math.sin(angle) * (size * 2))
    p2 = (b.x + math.cos(angle + 2.5) * size, b.y + math.sin(angle + 2.5) * size)
    p3 = (b.x + math.cos(angle - 2.5) * size, b.y + math.sin(angle - 2.5) * size)
    pygame.draw.polygon(screen, color, [p1, p2, p3])

# Output-handling: draw HUD text.
def draw_hud(screen, params: BoidParams, font):
    lines = [
        f"n: {params.n}  max_speed: {params.max_speed:.2f}  max_force: {params.max_force:.2f}",
        f"Sep R: {params.separation_radius:.1f} W: {params.separation_weight:.2f}",
        f"Ali R: {params.alignment_radius:.1f} W: {params.alignment_weight:.2f}",
        f"Coh R: {params.cohesion_radius:.1f} W: {params.cohesion_weight:.2f}",
        "Keys: 1/2 SepR  q/w SepW | 3/4 AliR  e/r AliW | 5/6 CohR  t/y CohW",
        "      a/z speed  s/x force | +/- add/rem | SPACE wrap | ESC quit",
    ]
    y = 5
    for txt in lines:
        surf = font.render(txt, True, (230, 230, 230))
        screen.blit(surf, (8, y))
        y += 18

# Input wrapper: keyboard to adjust parameters and manage boids.
def get_adjust_params(params: BoidParams):
    keys = pygame.key.get_pressed()

    if keys[pygame.K_1]:
        params.separation_radius = max(5.0, params.separation_radius - 0.5)
    if keys[pygame.K_2]:
        params.separation_radius = min(200.0, params.separation_radius + 0.5)

    if keys[pygame.K_3]:
        params.alignment_radius = max(5.0, params.alignment_radius - 0.5)
    if keys[pygame.K_4]:
        params.alignment_radius = min(250.0, params.alignment_radius + 0.5)

    if keys[pygame.K_5]:
        params.cohesion_radius = max(5.0, params.cohesion_radius - 0.5)
    if keys[pygame.K_6]:
        params.cohesion_radius = min(250.0, params.cohesion_radius + 0.5)

    if keys[pygame.K_q]:
        params.separation_weight = max(0.0, params.separation_weight - 0.02)
    if keys[pygame.K_w]:
        params.separation_weight = min(5.0, params.separation_weight + 0.02)

    if keys[pygame.K_e]:
        params.alignment_weight = max(0.0, params.alignment_weight - 0.02)
    if keys[pygame.K_r]:
        params.alignment_weight = min(5.0, params.alignment_weight + 0.02)

    if keys[pygame.K_t]:
        params.cohesion_weight = max(0.0, params.cohesion_weight - 0.02)
    if keys[pygame.K_y]:
        params.cohesion_weight = min(5.0, params.cohesion_weight + 0.02)

    if keys[pygame.K_a]:
        params.max_speed = max(0.5, params.max_speed - 0.05)
    if keys[pygame.K_z]:
        params.max_speed = min(8.0, params.max_speed + 0.05)

    if keys[pygame.K_s]:
        params.max_force = max(0.01, params.max_force - 0.002)
    if keys[pygame.K_x]:
        params.max_force = min(0.5, params.max_force + 0.002)

# Output-handling: add boids.
def add_boids(boids, count, params: BoidParams):
    for _ in range(count):
        x = random.uniform(0, params.width)
        y = random.uniform(0, params.height)
        angle = random.uniform(0, 2 * math.pi)
        speed = random.uniform(0.5 * params.max_speed, params.max_speed)
        vx = math.cos(angle) * speed
        vy = math.sin(angle) * speed
        boids.append(Boid(x, y, vx, vy))

# Output-handling: remove boids.
def remove_boids(boids, count):
    for _ in range(min(count, len(boids))):
        boids.pop()

def main():
    pygame.init()
    params = BoidParams()
    screen = pygame.display.set_mode((params.width, params.height))
    pygame.display.set_caption("Boids Swarm - Separation | Alignment | Cohesion")
    clock = pygame.time.Clock()
    font = pygame.font.SysFont("consolas", 16)

    boids = []
    add_boids(boids, params.n, params)

    running = True
    while running:
        _dt = clock.tick(60)
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE:
                    running = False
                if event.key in (pygame.K_EQUALS, pygame.K_PLUS):
                    add_boids(boids, 5, params)
                    params.n = len(boids)
                if event.key in (pygame.K_MINUS, pygame.K_UNDERSCORE):
                    remove_boids(boids, 5)
                    params.n = len(boids)
                if event.key == pygame.K_SPACE:
                    params.wrap_edges = not params.wrap_edges

        get_adjust_params(params)

        cell_size = max(8, int(max(
            params.separation_radius,
            params.alignment_radius,
            params.cohesion_radius
        )))
        grid = build_spatial_grid(boids, cell_size)

        for i, b in enumerate(boids):
            neighbours = compute_neighbours(i, boids, grid, params, cell_size)
            b.apply_rules(neighbours, params)

        for b in boids:
            b.update(params)

        screen.fill((18, 20, 24))
        for b in boids:
            draw_boid(screen, b, params, (90, 200, 255))
        draw_hud(screen, params, font)
        pygame.display.flip()

    pygame.quit()

if __name__ == "__main__":
    main()