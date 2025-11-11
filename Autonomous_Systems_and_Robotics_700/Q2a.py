# Q2a_PID_Circular_Trajectory.py
# This file simulates a kinematic vehicle model following a circular trajectory using a PID controller.

import numpy as np
import matplotlib.pyplot as plt

# Generates circular path coordinates
def generate_circular_path(radius, num_points):
    theta = np.linspace(0, 2 * np.pi, num_points)
    x = radius * np.cos(theta)
    y = radius * np.sin(theta)
    return x, y

# PID controller update for heading error
def pid_controller(error, prev_error, integral, Kp, Ki, Kd, dt):
    integral += error * dt
    derivative = (error - prev_error) / dt
    output = Kp * error + Ki * integral + Kd * derivative
    return output, integral, error

# Updates vehicle state with simple kinematic model
def update_vehicle_state(x, y, theta, v, omega, dt):
    x += v * np.cos(theta) * dt
    y += v * np.sin(theta) * dt
    theta += omega * dt
    return x, y, theta

# Pure function: calculate tracking error for position (Euclidean distance)
def calculate_error(x_actual, y_actual, x_desired, y_desired):
    return np.sqrt((x_desired - x_actual)**2 + (y_desired - y_actual)**2)

# Gets simulation parameters from user
def get_simulation_params():
    # Default parameters
    defaults = {
        'radius': 10.0,
        'num_points': 1000,
        'total_time': 20.0,
        'Kp': 2.0,
        'Ki': 0.1,
        'Kd': 0.4,
        'v': 1.0,
    }

    print("\nSimulation parameter configuration:")
    for k, v in defaults.items():
        print(f"  {k}: {v}")

    choice = input('\nUse default parameters? [Y/n]: ').strip().lower()
    if choice in ('', 'y', 'yes'):
        radius = defaults['radius']
        num_points = int(defaults['num_points'])
        total_time = float(defaults['total_time'])
        dt = total_time / num_points
        Kp = float(defaults['Kp'])
        Ki = float(defaults['Ki'])
        Kd = float(defaults['Kd'])
        v = float(defaults['v'])
        print('Using default parameters.\n')
        return radius, num_points, dt, Kp, Ki, Kd, v

    # Helper to ask with validation and default
    def ask(prompt, cast, default, validator=None):
        while True:
            s = input(f"{prompt} [{default}]: ").strip()
            if s == '':
                return default
            try:
                val = cast(s)
                if validator and not validator(val):
                    print('Value out of allowed range, try again.')
                    continue
                return val
            except ValueError:
                print('Invalid input, please enter a value of the correct type.')

    radius = ask('Radius (m)', float, defaults['radius'], lambda x: x > 0)
    num_points = ask('Number of points (integer)', int, defaults['num_points'], lambda x: x > 10)
    total_time = ask('Total simulation time (s)', float, defaults['total_time'], lambda x: x > 0)
    dt = total_time / num_points
    Kp = ask('Kp (proportional gain)', float, defaults['Kp'])
    Ki = ask('Ki (integral gain)', float, defaults['Ki'])
    Kd = ask('Kd (derivative gain)', float, defaults['Kd'])
    v = ask('Linear velocity v (m/s)', float, defaults['v'])

    print('\nParameters set:\n')
    print(
        f"  radius={radius}, num_points={num_points}, dt={dt:.6f},"
        f" Kp={Kp}, Ki={Ki}, Kd={Kd}, v={v}\n"
    )
    return radius, int(num_points), dt, float(Kp), float(Ki), float(Kd), float(v)

# Utility: wrap angle to [-pi, pi]
def wrap_angle(angle):
    return (angle + np.pi) % (2 * np.pi) - np.pi


def run_single_simulation(radius, num_points, dt, Kp, Ki, Kd, v):
    x_desired, y_desired = generate_circular_path(radius, num_points)
    x, y, theta = radius, 0, np.pi/2

    prev_error = 0.0
    integral = 0.0

    x_actual = []
    y_actual = []
    errors = []

    for i in range(num_points):
        # Desired point
        xd = x_desired[i]
        yd = y_desired[i]

        error_dist = calculate_error(x, y, xd, yd)

        desired_heading = np.arctan2(yd - y, xd - x)
        heading_error = wrap_angle(desired_heading - theta)

        omega, integral, prev_error = pid_controller(heading_error, prev_error, integral, Kp, Ki, Kd, dt)

        # Updates vehicle state
        x, y, theta = update_vehicle_state(x, y, theta, v, omega, dt)

        # Stores
        x_actual.append(x)
        y_actual.append(y)
        errors.append(error_dist)

    return x_desired, y_desired, x_actual, y_actual, np.array(errors)

# runs simulations for multiple tunings and plot results
def run_simulation():
    radius, num_points, dt, Kp_def, Ki_def, Kd_def, v = get_simulation_params()

    # Define multiple tunings to compare (label, Kp, Ki, Kd, color)
    tunings = [
        (f"Default (Kp={Kp_def},Ki={Ki_def},Kd={Kd_def})", Kp_def, Ki_def, Kd_def, 'b'),
        ("Aggressive (Kp=4.0,Ki=0.0,Kd=0.5)", 4.0, 0.0, 0.5, 'r'),
        ("Damped (Kp=1.0,Ki=0.05,Kd=1.0)", 1.0, 0.05, 1.0, 'g'),
    ]

    results = []

    plt.figure(figsize=(14, 6))

    # Left: trajectories
    plt.subplot(1, 2, 1)

    x_desired, y_desired = generate_circular_path(radius, num_points)
    plt.plot(x_desired, y_desired, color='gray', linestyle='--', label='Desired Path')

    for label, Kp, Ki, Kd, color in tunings:
        xd, yd, xa, ya, errors = run_single_simulation(radius, num_points, dt, Kp, Ki, Kd, v)
        plt.plot(xa, ya, color=color, label=label)
        results.append((label, errors))

    plt.xlabel('X position')
    plt.ylabel('Y position')
    plt.title('Desired vs Actual Trajectories (multiple tunings)')
    plt.legend()
    plt.axis('equal')

    # Right: tracking errors over time for each tuning
    plt.subplot(1, 2, 2)
    time = np.linspace(0, num_points * dt, num_points)

    for label, errors in results:
        plt.plot(time, errors, label=label)

        overshoot = np.max(errors)
        steady_state_error = errors[-1]
        
        plt.scatter(time[-1], steady_state_error, marker='o')
        plt.text(
            time[-1],
            steady_state_error,
            f"  SSE={steady_state_error:.3f},OS={overshoot:.3f}",
            verticalalignment='center'
        )

        # Printing summary to console
        print(
            f"{label}: Overshoot (max error) = {overshoot:.4f},"
            f"Steady-state error = {steady_state_error:.4f}"
        )

    plt.xlabel('Time (s)')
    plt.ylabel('Tracking Error (m)')
    plt.title('Tracking Error Over Time (comparison)')
    plt.legend()

    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    run_simulation()
