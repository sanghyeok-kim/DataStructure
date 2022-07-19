//
//  2-MaxHeap.swift
//  04-Heap
//
//  Created by 김상혁 on 2022/02/05.
//

import Foundation

struct MaxHeap<T: Comparable> {
    var heap: [T] = []
    let rootNodeIndex = 1
    var lastNodeIndex: Int {
        return heap.count - 1
    }
    
    init() {}
    init(dummyRootNode: T) {
        heap.append(dummyRootNode) //0번 index 채우기용
    }
    init(root: T) {
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
    
    func getParentIndex(of childIndex: Int) -> Int? { //(rootNodeIndex(1)...lastNodeIndex)
        if childIndex <= 1 || childIndex >= heap.count {
            return nil
        }
        else {
            return childIndex / 2
        }
    }
        
    mutating func push(_ newNode: T) {
        if heap.count == 0 {
            heap.append(newNode)
            heap.append(newNode)
            return
        }
        else {
            heap.append(newNode)
        }
        
        //(insertIndex가 root가 아님 && insert의 data가 parent의 보다 작음) -> true
        func shoudMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {
                return false
            }
            else {
                guard let parentIndex = getParentIndex(of: insertIndex) else { return false }
                return heap[parentIndex] < heap[insertIndex]
            }
        }
        
        var insertIndex = lastNodeIndex
        while shoudMoveUp(insertIndex) {
            guard let parentIndex = getParentIndex(of: insertIndex) else { return }
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
            //shoudMoveUp이 false일 때 까지 parent와 swap하며 올라감
        }
    }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let returnElement =  heap[rootNodeIndex]
        
        heap.swapAt(rootNodeIndex, lastNodeIndex)
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
                
                //왼쪽 자식이 나보다 작거나 같다면 -> heapify 종료
                if heap[leftIndex] <= heap[startIndex] {
                    return
                }
                
                //왼쪽 자식이 나보다 크면 -> swap 후 다시 heapify
                else {
                    heap.swapAt(leftIndex, startIndex)
                    heapifyDown(from: leftIndex)
                }
                
            //왼쪽 & 오른쪽 자식 노드 모두 있는 경우
            case .haveLeftRightChild:
                guard let leftIndex = getLeftChildIndex(of: startIndex) else { return }
                guard let rightIndex = getRightChildIndex(of: startIndex) else { return }
                
                //두 자식 모두 나보다 작거나 같다면 -> heapify 종료
                if heap[leftIndex] <= heap[startIndex] && heap[rightIndex] <= heap[startIndex] {
                    return
                }
                
                //둘 다 자신보다 크다면, 둘 중에 더 큰 자식과 swap 후 다시 heapify
                else if heap[leftIndex] >= heap[startIndex] && heap[rightIndex] < heap[startIndex] {
                    heap.swapAt(leftIndex, startIndex)
                    heapifyDown(from: leftIndex)
                }
                
                else if heap[leftIndex] < heap[startIndex] && heap[rightIndex] >= heap[startIndex] {
                    heap.swapAt(rightIndex, startIndex)
                    heapifyDown(from: rightIndex)
                }
                
                //둘 중 하나만 자신보다 크다면, 그 하나와 자신을 swap 후 다시 heapify
                else {
                    let biggerChildIndex = heap[leftIndex] > heap[rightIndex] ? leftIndex : rightIndex
                    heap.swapAt(biggerChildIndex, startIndex)
                    heapifyDown(from: biggerChildIndex)
                }
            }
        }
        
        heapifyDown(from: rootNodeIndex)
        return returnElement
    }
    
    func peek() -> T? {
        if heap.count <= 1 {
            return nil
        }
        else {
            return heap[rootNodeIndex]
        }
    }
}

