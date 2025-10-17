import re

def parse_time(time_str):
    # Parse time like "2 hours 30 minutes" or "3 hours" or "1 hour"
    hours = 0
    minutes = 0
    parts = time_str.split()
    i = 0
    while i < len(parts):
        if parts[i].isdigit():
            num = int(parts[i])
            if i + 1 < len(parts):
                unit = parts[i + 1].lower()
                if 'hour' in unit:
                    hours += num
                elif 'minute' in unit:
                    minutes += num
            i += 2
        else:
            i += 1
    return hours * 60 + minutes

def main():
    total_minutes = 0
    with open('log/log.md', 'r') as f:
        for line in f:
            if line.startswith('Time Spent:'):
                time_str = line.split(':', 1)[1].strip()
                total_minutes += parse_time(time_str)

    total_hours = total_minutes // 60
    remaining_minutes = total_minutes % 60
    print(f"Total time spent: {total_hours} hours {remaining_minutes} minutes")

if __name__ == "__main__":
    main()
