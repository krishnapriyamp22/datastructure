

class TwoStacks {
  List<String> beforeMiddle = [];
  List<String> afterMiddle = [];

  // Push a new element onto the stack
  void push(String data) {
    beforeMiddle.add(data);
  }

  // Delete the middle element from the stack
  void deleteMiddle() {
    if (beforeMiddle.isEmpty) {
      print('Stack is empty. Cannot delete middle.');
      return;
    }

    int middleIndex = (beforeMiddle.length - 1) ~/ 2;

    // Move elements before middle to afterMiddle
    for (int i = 0; i < middleIndex; i++) {
      afterMiddle.add(beforeMiddle.removeLast());
    }

    // Skip the middle element
    beforeMiddle.removeLast();

    // Move elements back to beforeMiddle
    while (afterMiddle.isNotEmpty) {
      beforeMiddle.add(afterMiddle.removeLast());
    }
  }

  // Print the elements in the stack
  void printStack() {
    for (var element in beforeMiddle) {
      print(element);
    }
  }
}
void main() {
  // Create a stack
  TwoStacks stack = TwoStacks();

  // Add elements to the stack
  stack.push('Item 1');
  stack.push('Item 2');
  stack.push('Item 3');
  stack.push('Item 4');
  stack.push('Item 5');

  // Print the initial stack
  print('Initial Stack:');
  stack.printStack();

  // Delete the middle element
  stack.deleteMiddle();

  // Print the stack after deletion
  print('\nStack after deleting the middle element:');
  stack.printStack();
}