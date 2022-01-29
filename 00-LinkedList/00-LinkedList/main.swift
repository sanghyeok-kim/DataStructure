/* ----- Single-LinkedList test ----- */










/* ----- Double-LinkedList test ----- */
let node1 = Node(data: 1)
let node2 = Node(data: 2)
let node3 = Node(data: 3)

let myDLL = DoubleLinkedList()

myDLL.showAll()

myDLL.insertLast(newNode: node1)
myDLL.showAll()

myDLL.insertLast(newNode: node2)
myDLL.showAll()

myDLL.insertLast(newNode: node3)
myDLL.showAll()

let node4 = Node(data: 4)
myDLL.insertAfter(targetNodeData: 3, newNode: node4)
myDLL.showAll()

//let node5 = Node(data: 5)
//myDLL.insertAfter(targetNodeData: 4, newNode: node5)
//myDLL.showAll()

//myDLL.searchNodeFromHead(by: <#T##Int#>)

myDLL.deleteNode(targetNodeData: 1)
myDLL.showAll()

