class Node {
  int data;
  Node? next;

  Node({required this.data});
}

class TwoStacksLinkedList {
  Node? top1; // Stack 1
  Node? top2; // Stack 2

  // Push a new element onto Stack 1
  void pushStack1(int data) {
    Node newNode = Node(data: data);
    newNode.next = top1;
    top1 = newNode;
  }

  // Push a new element onto Stack 2
  void pushStack2(int data) {
    Node newNode = Node(data: data);
    newNode.next = top2;
    top2 = newNode;
  }

  // Delete the middle element from the two stacks
  void deleteMiddle() {
    if (top1 == null || top2 == null) {
      print('One or both of the stacks are empty. Cannot delete middle.');
      return;
    }

    while (top1 != null && top2 != null && top2!.next != null) {
      pushStack1(top2!.data);
      top2 = top2!.next!.next;
    }
  }

  // Print the elements in the two stacks
  void printStacks() {
    print('Stack 1:');
    printStack(top1);
    print('\nStack 2:');
    printStack(top2);
  }

  // Helper method to print the elements in a stack
  void printStack(Node? top) {
    Node? current = top;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  // Create two stacks
  TwoStacksLinkedList twoStacks = TwoStacksLinkedList();

  // Add elements to Stack 2
  twoStacks.pushStack2(1);
  twoStacks.pushStack2(2);
  twoStacks.pushStack2(3);
  twoStacks.pushStack2(4);
  twoStacks.pushStack2(5);

  // Print the initial stacks
  print('Initial Stacks:');
  twoStacks.printStacks();

  // Delete the middle element
  twoStacks.deleteMiddle();

  // Print the stacks after deletion
  print('\nStacks after deleting the middle element:');
  twoStacks.printStacks();
}
