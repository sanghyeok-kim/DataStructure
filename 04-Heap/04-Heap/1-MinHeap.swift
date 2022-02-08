
//
//  1-MinHeap.swift
//  04-Heap
//
//  Created by 김상혁 on 2022/02/05.
//

import Foundation

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
        else {
            heap.append(newNode)
        }
        
        
        func isMoveUp(_ insertIndex: Int) -> Bool { //(insertIndex가 root가 아님 && insert의 data가 parent의 data 보다 큼) -> true
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
        //isMoveUp이 false일 때 까지 parent와 swap하며 올라감
    }
    
    mutating func pop() -> Element<T>? {
        if heap.count <= 1 { return nil }
        
        let returnElement =  heap[rootIndex]
        
        heap.swapAt(rootIndex, heap.count - 1)
        heap.removeLast()
        
        func checkChildState(of targetIndex: Int) -> ChildState {
            if getLeftChildIndex(of: targetIndex) == nil {
                return .haveNoChild
            }
            else if getLeftChildIndex(of: targetIndex) != nil && getRightChildIndex(of: targetIndex) == nil {
                return .haveLeftChild
            }
            else {
                return .haveLeftRightChild
            }
        }
        
        func heapifyDown(from startIndex: Int) {
            switch checkChildState(of: startIndex) {
                
            //왼쪽 자식 노드가 없는 경우(== 자식 노드가 없는 경우 == leaf 노드인 경우) -> heapify 종료
            case .haveNoChild:
                return
                
            //왼쪽 자식 노드만 있는 경우
            case .haveLeftChild:
                guard let leftIndex = getLeftChildIndex(of: startIndex) else { return }
                
                //왼쪽 자식이 나보다 크거나 같다면 -> heapify 종료
                if heap[leftIndex].data >= heap[startIndex].data {
                    return
                }
                
                //왼쪽 자식이 나보다 작으면 -> swap 후 다시 heapify
                else {
                    swap(indexOne: leftIndex, indexTwo: startIndex)
                    heapifyDown(from: leftIndex)
                }
                
            //왼쪽 & 오른쪽 자식 노드 모두 있는 경우
            case .haveLeftRightChild:
                guard let leftIndex = getLeftChildIndex(of: startIndex) else { return }
                guard let rightIndex = getRightChildIndex(of: startIndex) else { return }
                
                //두 자식 모두 나보다 크거나 같다면 -> heapify 종료
                if heap[leftIndex].data >= heap[startIndex].data && heap[rightIndex].data >= heap[startIndex].data {
                    return
                }
                
                //둘 다 자신보다 작다면, 둘 중에 더 작은 자식과 swap 후 다시 heapify
                else if heap[leftIndex].data < heap[startIndex].data && heap[rightIndex].data >= heap[startIndex].data {
                    swap(indexOne: leftIndex, indexTwo: startIndex)
                    heapifyDown(from: leftIndex)
                }
                else if heap[leftIndex].data >= heap[startIndex].data && heap[rightIndex].data < heap[startIndex].data {
                    swap(indexOne: rightIndex, indexTwo: startIndex)
                    heapifyDown(from: rightIndex)
                }
                
                //둘 중 하나만 자신보다 작다면, 그 하나와 자신을 swap 후 다시 heapify
                else {
                    let smallerChildIndex = heap[leftIndex].data < heap[rightIndex].data ? leftIndex : rightIndex
                    swap(indexOne: smallerChildIndex, indexTwo: startIndex)
                    heapifyDown(from: smallerChildIndex)
                }
            }
        }
        
        heapifyDown(from: rootIndex)
        return returnElement
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
}
