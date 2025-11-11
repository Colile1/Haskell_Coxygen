# Q1a_AStar_Grid.py : A* pathfinding in grid
# This file implements A* search for shortest path in a 2D grid with visual display.

import random
import matplotlib.pyplot as plt
import heapq

# Generates grid with obstacles.
def create_grid(n_rows, n_cols, obstacle_density):
    grid = [[0 for _ in range(n_cols)] for _ in range(n_rows)]
    n_obstacles = int(obstacle_density * n_rows * n_cols)
    placed = 0
    while placed < n_obstacles:
        r, c = random.randint(0, n_rows - 1), random.randint(0, n_cols - 1)
        if grid[r][c] == 0:
            grid[r][c] = 1
            placed += 1
    return grid

def manhattan_distance(a, b):
    return abs(a[0] - b[0]) + abs(a[1] - b[1])

# A* algorithm.
def a_star_search(grid, start, goal):
    n_rows, n_cols = len(grid), len(grid[0])
    open_set = []
    heapq.heappush(open_set, (0 + manhattan_distance(start, goal), 0, start, [start]))
    visited = set()
    nodes_explored = 0

    while open_set:
        est_total_cost, cost_so_far, current, path = heapq.heappop(open_set)
        nodes_explored += 1
        if current == goal:
            return path, cost_so_far, nodes_explored
        if current in visited:
            continue
        visited.add(current)

        for dr, dc in [(0,1), (1,0), (0,-1), (-1,0)]:
            nr, nc = current[0] + dr, current[1] + dc
            neighbour = (nr, nc)
            if 0 <= nr < n_rows and 0 <= nc < n_cols and grid[nr][nc] == 0 and neighbour not in visited:
                new_cost = cost_so_far + 1
                priority = new_cost + manhattan_distance(neighbour, goal)
                heapq.heappush(open_set, (priority, new_cost, neighbour, path + [neighbour]))
    return None, None, nodes_explored

# Prompts user for grid size and obstacle density with validation and clamping.
def get_create_grid():
    while True:
        try:
            n_rows = int(input("Enter grid rows (e.g. 10): "))
            n_cols = int(input("Enter grid cols (e.g. 10): "))
            if n_rows <= 0 or n_cols <= 0:
                print("Rows and cols must be positive integers.")
                continue
            density = float(input("Enter obstacle density (0 to 0.5): "))
        except ValueError:
            print("Invalid input. Please enter numeric values.")
            continue

        if density < 0.0:
            print("Density < 0. Setting to 0.0")
            density = 0.0
        if density > 0.9:
            print("Density > 0.9. Setting to 0.9")
            density = 0.9

        return create_grid(n_rows, n_cols, density)
    
# Prompts user for start and goal positions
def get_a_star_search(grid):
    print("Set start and goal positions (row col):")
    n_rows, n_cols = len(grid), len(grid[0])
    while True:
        try:
            start_row = int(input("Start row: "))
            start_col = int(input("Start col: "))
            goal_row = int(input("Goal row: "))
            goal_col = int(input("Goal col: "))
        except ValueError:
            print("Invalid input. Please enter integer coordinates.")
            continue

        start = (start_row, start_col)
        goal = (goal_row, goal_col)

        # Validates bounds
        if not (0 <= start_row < n_rows and 0 <= start_col < n_cols):
            print("Start out of bounds. Please enter values within grid size.")
            continue
        if not (0 <= goal_row < n_rows and 0 <= goal_col < n_cols):
            print("Goal out of bounds. Please enter values within grid size.")
            continue

        # Validates not on obstacle
        if grid[start_row][start_col] == 1:
            print("Start is on an obstacle. Choose a free cell.")
            continue
        if grid[goal_row][goal_col] == 1:
            print("Goal is on an obstacle. Choose a free cell.")
            continue

        break

    return a_star_search(grid, start, goal), start, goal

def display_grid_path(grid, path, start, goal):
    n_rows, n_cols = len(grid), len(grid[0])
    img = [[1 if cell == 1 else 0 for cell in row] for row in grid]
    plt.figure(figsize=(n_cols/2, n_rows/2))
    plt.imshow(img, cmap='Greys', interpolation='none')
    if path:
        px, py = zip(*path)
        plt.plot(py, px, color='blue', linewidth=2, label="Path")
    plt.scatter([start[1]], [start[0]], color='green', s=100, label="Start")
    plt.scatter([goal[1]], [goal[0]], color='red', s=100, label="Goal")
    plt.legend()
    plt.title("A* Optimal Path")
    plt.show()

if __name__ == "__main__":
    grid = get_create_grid()
    result, start, goal = get_a_star_search(grid)
    path, cost, nodes = result
    print("\nGrid (" + str(len(grid)) + "x" + str(len(grid[0])) + ") - Obstacles shown in black.")
    if path:
        print("Path found. Total cost:", cost)
        print("Nodes explored:", nodes)
    else:
        print("No path exists. Nodes explored:", nodes)
    display_grid_path(grid, path, start, goal)
