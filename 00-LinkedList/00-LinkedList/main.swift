/* ----- 1. Single-LinkedList test ----- */
//let node1 = SLLNode(data: 1)
//let node2 = SLLNode(data: 2)
//let node3 = SLLNode(data: 3)
//let mySLL = SinglyLinkedList<Int>()
//
//mySLL.showAll()
//
//mySLL.insertAtFirst(newNode: node1)
//mySLL.showAll()
//
//
//mySLL.insertBefore(targetNodeData: 1, newNode: node2)
//mySLL.showAll()
//
//mySLL.remove(targetNodeData: 2)
//mySLL.showAll()
//
//mySLL.remove(targetNodeData: 1)
//mySLL.showAll()



/* ----- 2. Circular-LinkedList test ----- */
//let myCLL = CircularLinkedList<Int>()

//let node1 = CLLNode(data: 1)
//let node2 = CLLNode(data: 2)
//let node3 = CLLNode(data: 3)

//myCLL.insertAtLast(newNode: node1)
//myCLL.insertAtFirst(newNode: node1)
//myCLL.showAll()

//myCLL.insertAtLast(newNode: node2)
//myCLL.insertAtFirst(newNode: node2)
//myCLL.showAll()

//myCLL.insertAtLast(newNode: node3)
//myCLL.insertAtFirst(newNode: node3)
//myCLL.showAll()

//print(myCLL.searchPrevNode(targetNodeData: 1)?.data)
//print(myCLL.searchNode(targetNodeData: 4)?.data)

//myCLL.removeFirst()
//myCLL.removeLast()
//myCLL.remove(targetNodeData: 1)
//myCLL.showAll()

//myCLL.removeFirst()
//myCLL.removeLast()
//myCLL.remove(targetNodeData: 2)
//myCLL.showAll()


//myCLL.removeFirst()
//myCLL.removeLast()
//myCLL.remove(targetNodeData: 3)
//myCLL.showAll()


/* ----- 3. Double-LinkedList test ----- */
let node1 = DLLNode(data: 1)
let node2 = DLLNode(data: 2)
let node3 = DLLNode(data: 3)
let node4 = DLLNode(data: 4)

let myDLL = DoublyLinkedList<Int>()

myDLL.showAll()

myDLL.insertAtLast(newNode: node1)
myDLL.showAll()

myDLL.insertAtLast(newNode: node2)
myDLL.showAll()

myDLL.insertAtLast(newNode: node3)
myDLL.showAll()

myDLL.insertAfter(targetNodeData: 3, newNode: node4)
myDLL.showAll()

myDLL.removeNode(targetNodeData: 4)
myDLL.showAll()
//
//myDLL.removeNode(targetNodeData: 2)
//myDLL.showAll()
//
//myDLL.removeNode(targetNodeData: 2)
//myDLL.showAll()
//
//myDLL.removeNode(targetNodeData: 3)
//myDLL.showAll()



//myDLL.removeLastNode()
//myDLL.showAll()
//
//myDLL.removeLastNode()
//myDLL.showAll()
//
//myDLL.removeLastNode()
//myDLL.showAll()
//
//myDLL.removeLastNode()
//myDLL.showAll()
//
//myDLL.removeLastNode()
//myDLL.showAll()

//myDLL.removeFirstNode()
//myDLL.showAll()
//
//myDLL.removeFirstNode()
//myDLL.showAll()
//
//myDLL.removeFirstNode()
//myDLL.showAll()
//
//myDLL.removeFirstNode()
//myDLL.showAll()
//
//myDLL.removeFirstNode()
//myDLL.showAll()


//myDLL.swapNode(leftNode: node2, rightNode: node3)
//myDLL.showAll()
