

class Node {
  String data;
  Node? next;

  Node({required this.data});
}

class LinkedListStack {
  Node? top;

  // Push a new element onto the stack
  void push(String data) {
    Node newNode = Node(data:data);
    newNode.next = top;
    top = newNode;
  }

  // Delete the middle element from the stack
  void deleteMiddle() {
    if (top == null || top!.next == null) {
      print('Stack is empty or has only one element. Cannot delete middle.');
      return;
    }

    Node slowPointer = top!;
    Node fastPointer = top!;
    Node prevNode = top!;

    while (fastPointer.next != null && fastPointer.next!.next != null) {
      fastPointer = fastPointer.next!.next!;
      prevNode = slowPointer;
      slowPointer = slowPointer.next!;
    }

    // Delete the middle element
    prevNode.next = slowPointer.next;
  }

  // Print the elements in the stack
  void printStack() {
    Node? current = top;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}
void main() {
  // Create a stack
  LinkedListStack stack = LinkedListStack();

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
