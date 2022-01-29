/* ----- Single-LinkedList test ----- */










/* ----- Double-LinkedList test ----- */
let node1 = Node(data: 1)
let node2 = Node(data: 2)
let node3 = Node(data: 3)

let myDLL = DoublyLinkedList<Int>()

myDLL.showAll()

myDLL.insertAtLast(newNode: node1)
myDLL.showAll()

myDLL.insertAtLast(newNode: node2)
myDLL.showAll()

myDLL.insertAtLast(newNode: node3)
myDLL.showAll()

let node4 = Node(data: 4)
myDLL.insertAfter(targetNodeData: 3, newNode: node4)
myDLL.showAll()


//myDLL.deleteNode(targetNodeData: 4)
//myDLL.showAll()

//myDLL.deleteNode(targetNodeData: 2)
//myDLL.showAll()

//myDLL.deleteNode(targetNodeData: 2)
//myDLL.showAll()

//myDLL.deleteNode(targetNodeData: 3)
//myDLL.showAll()

//myDLL.deleteLastNode()
//myDLL.showAll()

myDLL.swapNode(leftNode: node2, rightNode: node3)
myDLL.showAll()
