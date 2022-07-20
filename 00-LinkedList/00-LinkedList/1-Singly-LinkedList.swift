import Foundation

//Equatable을 따르는 <T>자료형의 data를 가진 Node class
class SLLNode<T: Equatable> {
    var data: T
    var next: SLLNode<T>?
    
    init(data: T, next: SLLNode<T>? = nil) {
        self.data = data
        self.next = next
    }
}

//Equatable을 따르는 <T>자료형의 data를 가진 Node를 연결하는 SLL class
class SinglyLinkedList<T: Equatable> {
    var head: SLLNode<T>?
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func searchNode(targetNodeData: T) -> SLLNode<T>? {
        if isEmpty() {
            print("Empty List")
            return nil
        }
        
        var current = head
        
        while(current != nil) {
            if current?.data == targetNodeData {
                return current
            }
            current = current?.next
        }
        
        print("Cannot Find Node")
        return nil
    }
    
//    func searchPrevNode(targetNodeData: T) -> SLLNode<T>? {
//        
//    }
    
    func insertAtFirst(newNode: SLLNode<T>) {
        if isEmpty() {
            head = newNode
        }
        else {
            newNode.next = head
            head = newNode
        }
    }
    
    func insertAtLast(newNode: SLLNode<T>) {
        if isEmpty() {
            head = newNode
        }
        else {
            var current = head
            while(current?.next != nil) {
                current = current?.next
            }
            current?.next = newNode
        }
    }
    
    func insertAfter(targetNodeData: T, newNode: SLLNode<T>) {
        guard let targetNode = searchNode(targetNodeData: targetNodeData) else { return }
        
        targetNode.next?.next = newNode.next
        targetNode.next = newNode
    }
    
    func insertBefore(targetNodeData: T, newNode: SLLNode<T>) {
        if isEmpty() { return }
        
        if head?.data == targetNodeData {
            insertAtFirst(newNode: newNode)
            return
        }
        
        var current = head
        while(current != nil) {
            if (current?.next?.data == targetNodeData) { break }
            else { current = current?.next }
        }
        newNode.next = current?.next
        current?.next = newNode
    }
    
    func removeLast() {
        if isEmpty() { return } //리스트에 노드가 0개인 경우
        
        if head?.next == nil { //리스트에 노드가 1개인 경우
            head = nil
            return
        }
        
        //리스트에 노드가 2개 이상인 경우
        var current = head
        while(current?.next?.next != nil) {
            current = current?.next
        }
        current?.next = nil
    }
    
    func removeFirst() {
        if isEmpty() { return }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        head = head?.next
    }
    
    func remove(targetNodeData: T) {
        if isEmpty() { return }
        
        if head?.data == targetNodeData {
            removeFirst()
            return
        }
        
        var current = head
        while(current?.next != nil) { //체인의 끝까지 탐색
            if current?.next?.data == targetNodeData { //target 발견 -> target의 prev Node를 가리키는 상태에서 break
                break
            }
            current = current?.next
        }
        current?.next = current?.next?.next //target의 prev가 targer의 next를 가리킴
    }
    
    func showAll() {
        if isEmpty() {
            print("Empty List")
            return
        }
        
        print("[head] →", terminator: "")
        var current = head
        while (current != nil) {
            current?.next == nil
            ? print(" \(current?.data) ")
            : print(" \(current?.data) ", terminator: "→")
            current = current?.next
        }
    }
}
