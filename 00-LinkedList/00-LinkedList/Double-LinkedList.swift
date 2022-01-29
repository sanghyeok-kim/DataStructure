import Foundation

class Node<T> {
    var data: T
    var next: Node?
    var prev: Node?
    
    init(data: T, next: Node? = nil, prev: Node? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}

class DoubleLinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    func isEmpty() -> Bool {
        return (head == nil && tail == nil)
    }
    
    func searchNodeFromHead(data: T) -> Node<T>? {
        if isEmpty() {
            print("Empty List")
            return nil
        }
        
        var current = head
        while(current != nil) {
            if current?.data == data {
                return current
            }
            current = current?.next
        }
        print("Cannot Find Node")
        return nil
    }
    
    func searchNodeFromTail(data: Int) -> Node? {
        if isEmpty() {
            print("Empty List")
            return nil
        }
        
        var current = tail
        while(current != nil) {
            if current?.data == data {
                return current
            }
            current = current?.prev
        }
        print("Cannot Find Node")
        return nil
    }
    
    func insertLast(newNode: Node) {
        if isEmpty() {
            head = newNode
            tail = newNode
        }
        else {
            let exTail = tail
            
            tail = newNode
            tail?.prev = exTail
            exTail?.next = newNode
        }
    }
    
    func insertFirst(newNode: Node) {
        if isEmpty() {
            head = newNode
            tail = newNode
        }
        else {
            let exHead = head
            
            head = newNode
            head?.next = exHead
            exHead?.prev = newNode
        }
    }
    
    func insertAfter(targetNodeData: Int, newNode: Node) {
        guard let targetNode = searchNodeFromHead(data: targetNodeData) else { return }
        
        if targetNode.next == nil {
            insertLast(newNode: newNode)
        }
        else {
            //newNode의 rlink 연결
            targetNode.next?.prev = newNode
            newNode.next = targetNode.next
            
            //newNode의 llink 연결
            targetNode.next = newNode
            newNode.prev = targetNode
        }
        
    }
    
    func insertBefore(targetNodeData: Int, newNode: Node) {
        guard let targetNode = searchNodeFromHead(data: targetNodeData) else { return }
        
        if targetNode.prev == nil {
            insertFirst(newNode: newNode)
        }
        else {
            //newNode의 llink 연결
            targetNode.prev?.next = newNode
            newNode.prev = targetNode.prev
            
            //newNode의 rlink 연결
            newNode.next = targetNode
            targetNode.prev = newNode
        }
    }
    
//    func deleteNode(targetNodeData: Int) {
//        guard let targetNode = searchNodeFromHead(data: targetNodeData) else { return }
//
//        if targetNode.prev == nil { //target이 head일 때
//            print(targetNode)
//            head = head?.next
//
//            //new head의 llink 끊기
//            head?.prev?.next = nil
//            head?.prev = nil
//            print(targetNode)
//        }
//        else if targetNode.next == nil { //target이 tail일 때
//            tail = targetNode.prev
//
//            targetNode.next = nil
//
//
//        }
//        else {
//
//        }
//
//    }


    func deleteFirstNode() {
        
    }
    
    func deleteLastNode() {
        
    }
    
    
    func showAll() {
        if isEmpty() {
            print("Empty List")
            return
        }
        
        print("(head) ", terminator: "")
        var current = head
        while(current != nil) {
            current?.next == nil ?
            print("|\(current?.data)|", terminator: " ") :
            print("|\(current?.data)|", terminator: " ⇄ ")
            current = current?.next
        }
        print("(tail)")
    }
}

