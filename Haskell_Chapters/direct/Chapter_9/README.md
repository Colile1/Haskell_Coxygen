Haskell Chapter 9 Practical Tasks: Parametric Types and Recursion

# HC9T1: Define a Parametric Type Synonym
Create a parametric type synonym called Entity a to represent various types of entities with addresses.

# HC9T2: Implement a Parametric Data Type
Create a data type Box a with two constructors, Empty and Has a, to represent a box that may or may not contain a value.

# HC9T3: Function to Add Values in a Box
Create a function addN that takes a number and a Box a. If the box contains a number, add the given number to it.

# HC9T4: Extract a Value from a Box
Create a function extract that takes a default value and a Box a. It returns the value inside the box or the default if the box is empty.

# HC9T5: Parametric Data Type with Record Syntax
Define a parametric data type Shape a with constructors Circle and Rectangle, both containing a color field of type a.

# HC9T6: Recursive Data Type for Tweets
Define a recursive data type Tweet that represents a tweet with content, likes, and comments, which are themselves tweets.

# HC9T7: Engagement Function for Tweets
Create a function engagement that calculates the engagement of a Tweet by summing its likes and the engagement of its comments.

# HC9T8: Recursive Sequence Data Type
Define a recursive data type Sequence a representing a linear sequence of nodes, each containing a value and pointing to the next node.

# HC9T9: Check for Element in a Sequence
Create a function elemSeq that checks if a given element is inside a Sequence.

# HC9T10: Binary Search Tree Data Type
Define a binary search tree type BST a with constructors for an empty tree and a node containing a value and two subtrees.
