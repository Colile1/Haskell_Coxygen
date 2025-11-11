# Python rules

- Use n as representation for number. If there are multiple numbers n1, n2, n3, ...etc.
- print output that result in just numbers with a very short description of what the number is should be printed before the number.

- If names are required use South African names. the default name for a male person be Colile, the default name for a place should be Johannesburg.

file name example Q{Question number}_{Less 3 word descriptive name}.py (e.g Q8a_Tax_Calculator.py )

- All files must have a main function or if __name__ == "__main__": block, the main must call the other functions but must itself have minimal logic (only the bare necessary).

## Function and Commenting Rules

When writing Python code, follow these rules:

1. **File-Level Commenting**

    * The very first line of the file must be a heading comment that contains the full name of the file, and a very short description.
    * The Second line of the file must be a single comment that briefly describes what the file contains.

2. **Function-Level Commenting**

    * Every function must have a maximum of 1 short descriptive comment directly above it. Do not add this comment for simple functions whose purpose is easily visible.

3. **Naming Conventions**

    * Pure functions use descriptive snake_case names (e.g. make_message).
    * Input wrappers must reuse the exact pure function name with a get_ prefix (e.g. get_make_message).
    * Output-handling functions should have names that clearly describe their purpose.
4. **Separation of Concerns**

   * Pure functions must not contain any IO or side effects.
   * Input wrappers must only collect input, then return the result of applying the pure function. They should not print or produce output.
   * Only the main block (or designated output logic functions) may print to the console.
5. **Example Structure**

   ```python
   # [file name] : [less than 4 word descriptive heading of file]
   # This file demonstrates [brief description].

   # Pure function: [short description].
   def pure_function_name(args):
       ...

   # Input wrapper: [short description].
   def get_pure_function_name():
       ...
       return pure_function_name(args)

   if __name__ == "__main__":
       result = get_pure_function_name()
       print("Result: " + str(result))
   ```