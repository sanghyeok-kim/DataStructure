import Foundation

//Equatable을 따르는 <T>자료형의 data를 가진 Node class
class CLLNode<T: Equatable> {
    var data: T
    var next: CLLNode<T>?
    
    init(data: T, next: CLLNode<T>? = nil) {
        self.data = data
        self.next = next
    }
}

//Equatable을 따르는 <T>자료형의 data를 가진 Node를 연결하는 CLL class
class CircularLinkedList<T: Equatable> {
    var tail: CLLNode<T>? //CLL은 tail 다음 Node가 haed이므로, head는 tail.next로 알 수 있다. 따라서 tail만 사용해도 된다.
    var size: Int = 0 //Circular형 자료구조는 끝나는 지점을 알 수 없으므로 size 정보가 필요
    
    func isEmpty() -> Bool {
        return tail == nil
    }
    
    func searchPrevNode(targetNodeData: T) -> CLLNode<T>? {
        var current = tail?.next
        for _ in 0..<size {
            if current?.next?.data == targetNodeData { return current }
            current = current?.next
        }
        return nil
    }
    
    func searchNode(targetNodeData: T) -> CLLNode<T>? {
        var current = tail
        for _ in 0..<size {
            if current?.next?.data == targetNodeData { return current?.next }
            current = current?.next
        }
        return nil
    }
    
    func insertAtFirst(newNode: CLLNode<T>) {
        if isEmpty() {
            tail = newNode
            newNode.next = newNode //노드가 1개일 경우 -> 그 노드 자체로서 head이자 tail
            
        }
        else {
            newNode.next = tail?.next
            tail?.next = newNode
        }
        size += 1
    }
    
    func insertAtLast(newNode: CLLNode<T>) {
        if isEmpty() {
            tail = newNode
            newNode.next = newNode
        }
        else {
            newNode.next = tail?.next
            tail?.next = newNode
            tail = newNode //기존 tail이 새로운 tail을 가리킴
        }
        size += 1
    }
    
    func removeLast() {
        if isEmpty() { return } //리스트에 노드가 0개인 경우

        if size == 1 {
            tail = nil
            return
        }
        
        var current = tail
        for _ in 0..<size - 1 {
            current = current?.next //current를 tail 바로 전 node로 설정
        }
        
        current?.next = current?.next?.next //tail 바로 전 node의 next를 next.next로 설정
        tail = current //새로운 tail을 tail 바로 전 node로 설정
        
        size -= 1
    }

    func removeFirst() {
        if isEmpty() { return }

        if size == 1 {
            tail = nil
            return
        }
        
        tail?.next = tail?.next?.next //head를 head.next로 설정
        size -= 1
    }

    func remove(targetNodeData: T) { //삭제할 노드가 tail이냐 아니냐가 중요하다
        if isEmpty() { return }
    
        
        if tail?.data == targetNodeData { //삭제할 노드가 tail이고
            if tail?.next?.data == targetNodeData { //그 노드가 유일한 노드라면(tail.data == targetNodeData == head.data)
                tail = nil
                size -= 1
            }
            else { //삭제할 노드가 tail이지만, 유일한 노드는 아니라면(tail.data == targetNodeData != head.data)
                let prevNode = searchPrevNode(targetNodeData: targetNodeData)
                tail = prevNode
                tail?.next = tail?.next?.next
                size -= 1
            }
        }
        
        else { //삭제할 노드가 tail이 아니라면
            let prevNode = searchPrevNode(targetNodeData: targetNodeData)
            prevNode?.next = prevNode?.next?.next
            size -= 1
        }
    }
    
    func showAll() {
        if isEmpty() {
            print("|Empty List (tail)|")
            return
        }
        
        var current = tail?.next
        for i in 0..<size - 1 {
            print("|\(current?.data)| →", terminator: " ")
            current = current?.next
        }
        print("|\(current?.data) (tail)|")
        
//        print("head: \(tail?.next?.data) tail: \(tail?.data)\n") //참조 잘 끊겼는지 확인
    }
}

//참조
//https://velog.io/@mmindoong/%EC%9E%90%EB%A3%8C%EA%B5%AC%EC%A1%B0-%EC%9B%90%ED%98%95-%EC%97%B0%EA%B2%B0-%EB%A6%AC%EC%8A%A4%ED%8A%B8-Circular-Linked-List
//https://jwlee010523.tistory.com/entry/%EC%9B%90%ED%98%95-%EC%97%B0%EA%B2%B0-%EB%A6%AC%EC%8A%A4%ED%8A%B8Circular-Linked-List
//https://seongkyun.github.io/data_structure/2019/03/20/data_structure/
