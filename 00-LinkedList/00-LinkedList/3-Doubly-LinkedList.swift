import Foundation

//Equatable을 따르는 <T>자료형의 data를 가진 Node class
class DLLNode<T: Equatable> {
    var data: T
    var next: DLLNode<T>?
    var prev: DLLNode<T>?
    
    init(data: T, next: DLLNode<T>? = nil, prev: DLLNode<T>? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}

//Equatable을 따르는 <T>자료형의 data를 가진 Node를 연결하는 DLL class
class DoublyLinkedList<T: Equatable> {
    var head: DLLNode<T>?
    var tail: DLLNode<T>?
    
    func isEmpty() -> Bool {
        return (head == nil && tail == nil)
    }
    
    func searchNodeFromHead(targetNodeData: T) -> DLLNode<T>? {
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
    
    func searchNodeFromTail(targetNodeData: T) -> DLLNode<T>? {
        if isEmpty() {
            print("Empty List")
            return nil
        }
        
        var current = tail
        while(current != nil) {
            if current?.data == targetNodeData {
                return current
            }
            current = current?.prev
        }
        print("Cannot Find Node")
        return nil
    }
    
    func insertAtLast(newNode: DLLNode<T>) {
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
    
    func insertAtFirst(newNode: DLLNode<T>) {
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
    
    func insertAfter(targetNodeData: T, newNode: DLLNode<T>) {
        guard let targetNode = searchNodeFromHead(targetNodeData: targetNodeData) else { return }
        
        if targetNode.next == nil {
            insertAtLast(newNode: newNode)
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
    
    func insertBefore(targetNodeData: T, newNode: DLLNode<T>) {
        guard let targetNode = searchNodeFromHead(targetNodeData: targetNodeData) else { return }
        
        if targetNode.prev == nil {
            insertAtFirst(newNode: newNode)
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
    
    func removeFirstNode() {
        if isEmpty() {
            print("Cannot Delete Node - Empty List")
        }
        else if (head?.next == nil && tail?.next == nil ) { //Node가 1개
            head = nil
            tail = nil
        }
        else { //Node가 2개 이상
            head = head?.next
    
            //새로운 head의 llink(기존 head) 끊기
            head?.prev?.next = nil
            head?.prev = nil
        }
    }
    
    func removeLastNode() {
        if isEmpty() {
            print("Cannot Delete Node - Empty List")
        }
        else if (head?.next == nil && tail?.next == nil ) { //Node가 1개
            head = nil
            tail = nil
        }
        else { //Node가 2개 이상
            tail = tail?.prev
        
            //새로운 tail의 rlink(기존 tail) 끊기
            tail?.next?.prev = nil
            tail?.next = nil
        }
    }
    
    func removeNode(targetNodeData: T) {
        if isEmpty() {
            print("Cannot Delete Node - Empty List")
            return
        }
        
        guard let targetNode = searchNodeFromHead(targetNodeData: targetNodeData) else
        {
            return
        }
        
        if targetNode.prev == nil { //target이 head일 때
            removeFirstNode()
        }
        else if targetNode.next == nil { //target이 tail일 때
            removeLastNode()
        }
        else { //target이 head도 아니고 tail도 아니다 -> 2개의 Node 사이에 있다
            targetNode.prev?.next = targetNode.next
            targetNode.next?.prev = targetNode.prev
        }
    }
    
    func swapNode(leftNode: DLLNode<T>, rightNode: DLLNode<T>) { //인접한 두 노드 간에만 사용 가능
        leftNode.next = rightNode.next
        rightNode.prev = rightNode.prev?.prev
        
        rightNode.next = leftNode
        rightNode.prev?.next = rightNode
        
        leftNode.prev = rightNode
        leftNode.next?.prev = leftNode
    }
    
    func showAll() {
        if isEmpty() {
            print("[head] |Empty List| [tail]")
            return
        }
        
        print("[head] ", terminator: "")
        var current = head
        while(current != nil) {
            current?.next == nil
            ? print("|\(current?.data)|", terminator: " ")
            : print("|\(current?.data)|", terminator: " ⇄ ")
            current = current?.next
        }
        print("[tail]")
    }
}


//참조
//https://jeonyeohun.tistory.com/324
//https://babbab2.tistory.com/87
