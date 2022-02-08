//
//  main.swift
//  04-Heap
//
//  Created by 김상혁 on 2022/01/28.
//

//
//  1-MinHeap.swift
//  04-Heap
//
//  Created by 김상혁 on 2022/02/05.
//

import Foundation

//enum ChildState {
//    case none   //child가 없음
//    case left   //left child만 있음
//    case right  //left, right child 둘 다 있음
//}

struct Element<T: Comparable> {
    let data: T
}

struct MinHeap<T: Comparable> {
    var heap: [Element<T>] = []
    let rootIndex = 1
    
    init() {}
    init(root: Element<T>) {
        heap.append(root) //0번 index 채우기용
        heap.append(root) //실제 Root Node 채우기
    }
    
    //Get Index
    func getLeftChildIndex(of parentIndex: Int) -> Int? {
        if parentIndex < 1 || parentIndex * 2 >= heap.count {
            return nil
        }
        else {
            return parentIndex * 2
        }
    }
    func getRightChildIndex(of parentIndex: Int) -> Int? {
        if parentIndex < 1 || parentIndex * 2 + 1 >= heap.count {
            return nil
        }
        else {
            return parentIndex * 2 + 1
        }
    }
    
    func getParentIndex(of childIndex: Int) -> Int? { //(2...heap.count - 1)
        if childIndex <= 1 || childIndex >= heap.count {
            return nil
        }
        else {
            return childIndex / 2
        }
    }
    
//
//    //Get Element
//    func getLeftChild(of parentIndex: Int) -> Element<T>? {
//        guard let leftChildIdx = getLeftChildIndex(of: parentIndex) else { return nil }
//        return heap[leftChildIdx]
//    }
//
//    func getRightChild(of parentIndex: Int) -> Element<T>? {
//        guard let rightChildIdx = getRightChildIndex(of: parentIndex) else { return nil }
//        return heap[rightChildIdx]
//    }
//
//    func getParent(of childIndex: Int) -> Element<T>? {
//        guard let parentIdx = getParentIndex(of: childIndex) else { return nil }
//        return heap[parentIdx]
//    }

    
    mutating func swap(indexOne: Int, indexTwo: Int) {
        let placeholder = self.heap[indexOne]
        self.heap[indexOne] = self.heap[indexTwo]
        self.heap[indexTwo] = placeholder
    }
    
    
    mutating func push(_ newNode: Element<T>) {
        if heap.count == 0 {
            heap.append(newNode)
            heap.append(newNode)
            return
        }
        
        //heapifyUp(from: heap[])
            //newNode의 index가 1이 아니면서(루트가 아니면서)
            //newNode의 data가 그 노드의 부모보다 크지 않을 때 까지 heapify를 반복
        heap.append(newNode)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {
                return false
            }
            else {
                guard let parentIndex = getParentIndex(of: insertIndex) else { return false }
                return heap[parentIndex].data > heap[insertIndex].data
            }
        }
        
        var insertIndex = heap.count - 1
        while isMoveUp(insertIndex) {
            guard let parentIndex = getParentIndex(of: insertIndex) else { return }
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    mutating func pop() -> Element<T>? {
        if heap.count <= 1 {
            return nil
        }
        else {
            let returnElement =  heap[rootIndex]
            
            heap.swapAt(rootIndex, heap.count - 1)
            heap.removeLast()
            
            func heapifyDown(from startIndex: Int) {
                
            }
            
            heapifyDown(from: rootIndex)
            
            return returnElement
        }
    }
    
    func peek() -> Element<T>? {
        if heap.count <= 1 {
            return nil
        }
        else {
            let returnElement =  heap[rootIndex]
            return returnElement
        }
    }
    
    //1. root를 pop
    //2. last node를 root로
    //3. root부터 다시 heapify
    func heapifyDown(from startIndex: Int) {
//        let leftChildIndex = getLeftChild(of: startIndex)
//        let rightChildIndex = getRightChild(of: startIndex)
//
//        if hasLeftChild(of: startIndex) == false {
//            return .none
//        }
//
//
//        if hasLeftChild(of: startIndex) {
//            return getLeftChild(of: startIndex) > heap[startIndex] ? .left : .none
//        }
//
//
//        if hasRightChild(of: startIndex) {
//            if getLeftChildIndex(of: startIndex) > heap[startIndex] &&
//                getRightChildIndex(of: startIndex) > heap[startIndex]
//            return .none
//        }
//
//
//        if (heap[leftChildIndex] > heap[startIndex]) && (heap[rightChildIndex] > heap[startIndex]) {
//            return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
//        };
//
//
//        return heap[leftChildIndex] > heap[startIndex] ? .left : .right
//    }
//
//
//    //맨 마지막 자리에 추가된 node가 자신의 부모와 비교해가면서 자리를 찾아가는 과정
//    func heapifyUp(from newNode: Element<T>) {

    }
}

let elementA = Element(data: 1)
let elementB = Element(data: 2)
let elementC = Element(data: 3)


var heap = MinHeap(root: elementA)
heap.push(elementB)
heap.push(elementC)
//print(heap)
print("")
print(heap)

//print(heap.getLeftChild(of: 1))
//print(heap.getRightChild(of: 1))
//print(heap.getParent(of: 1))

//print(h.hasRightChild(of: 1))
//print(h.getLeftChildElement(of: 2))
