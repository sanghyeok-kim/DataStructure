//
//  1-MinHeap.swift
//  04-Heap
//
//  Created by 김상혁 on 2022/02/05.
//

import Foundation

struct MinHeap<T: Comparable> {
    var heap: [T] = []
    let rootNodeIndex = 1
    var lastNodeIndex: Int {
        return heap.count - 1
    }
    
    func getLeftChildIndex(of parentIndex: Int) -> Int? {
        if parentIndex < 1 || parentIndex * 2 >= heap.count {
            return nil
        } else {
            return parentIndex * 2
        }
    }
    
    func getRightChildIndex(of parentIndex: Int) -> Int? {
        if parentIndex < 1 || parentIndex * 2 + 1 >= heap.count {
            return nil
        } else {
            return parentIndex * 2 + 1
        }
    }
    
    func getParentIndex(of childIndex: Int) -> Int? { //(rootNodeIndex(1)...lastNodeIndex)
        if childIndex <= 1 || childIndex >= heap.count {
            return nil
        } else {
            return childIndex / 2
        }
    }
    
    mutating func push(_ newNode: T) {
        if heap.isEmpty {
            heap.append(newNode) //0번째 인덱스 채우기용 dummyNode
            heap.append(newNode)
            return
        } else {
            heap.append(newNode)
        }
        
        //(currentNode의 Index가 root가 아님 && currentNode의 값이 parent의 값 보다 큼) -> true
        func shouldMoveUp(from currentNodeIndex: Int) -> Bool {
            guard let parentIndex = getParentIndex(of: currentNodeIndex) else { return false }
            return heap[parentIndex] > heap[currentNodeIndex]
        }
        
        var currentNodeIndex = lastNodeIndex
        while shouldMoveUp(from: currentNodeIndex) {  //shouldMoveUp이 false일 때 까지 parent와 swap하며 올라감
            guard let parentIndex = getParentIndex(of: currentNodeIndex) else { return }
            heap.swapAt(currentNodeIndex, parentIndex)
            currentNodeIndex = parentIndex
        }
    }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let returnElement =  heap[rootNodeIndex] //pop할 root node의 값을 미리 저장
        
        //root 삭제, 마지막 node가 root자리로 이동
        heap.swapAt(rootNodeIndex, lastNodeIndex)
        heap.removeLast()
        
        func checkChildState(of targetIndex: Int) -> ChildState {
            let leftChild = getLeftChildIndex(of: targetIndex)
            let rightChild = getRightChildIndex(of: targetIndex)
            
            switch (leftChild, rightChild) {
            case (nil, _):
                return .haveNoChild
            case (.some, nil):
                return .haveLeftChild
            case (.some, .some):
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
                if heap[leftIndex] >= heap[startIndex] {
                    return
                }
                
                //왼쪽 자식이 나보다 작으면 -> swap 후 다시 heapify
                else {
                    heap.swapAt(leftIndex, startIndex)
                    heapifyDown(from: leftIndex)
                }
                
            //왼쪽 & 오른쪽 자식 노드 모두 있는 경우
            case .haveLeftRightChild:
                guard let leftIndex = getLeftChildIndex(of: startIndex),
                      let rightIndex = getRightChildIndex(of: startIndex) else { return }
                
                //두 자식 모두 나보다 크거나 같다면 -> heapify 종료
                if heap[leftIndex] >= heap[startIndex] && heap[rightIndex] >= heap[startIndex] {
                    return
                }
                
                //둘 다 자신보다 작다면, 둘 중에 더 작은 자식과 swap 후 다시 heapify
                else if heap[leftIndex] < heap[startIndex] && heap[rightIndex] >= heap[startIndex] {
                    heap.swapAt(leftIndex, startIndex)
                    heapifyDown(from: leftIndex)
                }
                else if heap[leftIndex] >= heap[startIndex] && heap[rightIndex] < heap[startIndex] {
                    heap.swapAt(rightIndex, startIndex)
                    heapifyDown(from: rightIndex)
                }
                
                //둘 중 하나만 자신보다 작다면, 그 하나와 자신을 swap 후 다시 heapify
                else {
                    let smallerChildIndex = heap[leftIndex] < heap[rightIndex] ? leftIndex : rightIndex
                    heap.swapAt(smallerChildIndex, startIndex)
                    heapifyDown(from: smallerChildIndex)
                }
            }
        }
        
        heapifyDown(from: rootNodeIndex)
        return returnElement
    }
    
//    func peek() -> T? {
//        return heap.count <= 1 ? nil : heap[rootNodeIndex]
//    }
}
