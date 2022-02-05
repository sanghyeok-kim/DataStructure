////
////  1-MinHeap.swift
////  04-Heap
////
////  Created by 김상혁 on 2022/02/05.
////
//
//import Foundation
//
////enum ChildState {
////    case none   //child가 없음
////    case left   //left child만 있음
////    case right  //left, right child 둘 다 있음
////}
//
//struct Element<T: Comparable> {
//    let data: T
//}
//
//struct MinHeap<T: Comparable> {
//    var heap: [Element<T>] = []
//
//    init() {}
//    init(root: Element<T>) {
//        heap.append(root) //0번 index 채우기용
//        heap.append(root) //실제 Root Node 채우기
//    }
//
//    //Get Index
//    func getLeftChildIndex(of parentIndex: Int) -> Int {
//        return 2 * parentIndex
//    }
//    func getRightChildIndex(of parentIndex: Int) -> Int {
//        return 2 * parentIndex + 1
//    }
//
//    func getParentIndex(of childIndex: Int) -> Int {
//        return childIndex / 2
//    }
//
//    //Get Element
//    func getLeftChild(of parentIndex: Int) -> Element<T> {
//        return heap[getLeftChildIndex(of: parentIndex)]
//    }
//
//    func getRightChild(of parentIndex: Int) -> Element<T> {
//        return heap[getRightChildIndex(of: parentIndex)]
//    }
//
//    func getParent(of childIndex: Int) -> Element<T> {
//        return heap[getParentIndex(of: childIndex)]
//    }
//
//
//    //Boolean Check
//    func hasLeftChild(of index: Int) -> Bool {
//        return getLeftChildIndex(of: index) < heap.count
//    }
//
//    func hasRightChild(of index: Int) -> Bool {
//        return getRightChildIndex(of: index) < heap.count
//    }
//
//    func hasParent(of index: Int) -> Bool {
//        return getParentIndex(of: index) > 1
//    }
//
//
//    //swap
//    mutating func swap(indexOne: Int, indexTwo: Int) {
//        let placeholder = self.heap[indexOne]
//        self.heap[indexOne] = self.heap[indexTwo]
//        self.heap[indexTwo] = placeholder
//    }
//
//
//    mutating func push(_ data: Element<T>) {
//        if heap.count == 0 {
//            heap.append(data)
//            heap.append(data)
//            return
//        }
//
//        heap.append(data)
//    }
//
//    mutating func pop() -> Element<T>? {
//        if heap.count > 1 {
//            let returnElement =  heap[1]
//
//            //heapifyDown()
//
//
//            return returnElement
//        }
//        else {
//            return nil
//        }
//    }
//
//    mutating func peek() -> Element<T>? {
//        if heap.count > 1 {
//            let returnElement =  heap[1]
//
//
//
//            return returnElement
//        }
//        else {
//            return nil
//        }
//    }
//}
//
////    func heapifyDown(from startIndex: T) -> ChildState {
////        let leftChildIndex = (startIndex * 2)
////        let rightChildIndex = leftChildIndex + 1
////
////
////        if hasLeftChild(of: startIndex) == false {
////            return .none
////        }
////
////
////        if hasLeftChild(of: startIndex) {
////            return getLeftChild(of: startIndex) > heap[startIndex] ? .left : .none
////        }
////
////
////        if hasRightChild(of: startIndex) {
////            if getLeftChildIndex(of: startIndex) > heap[startIndex] &&
////                getRightChildIndex(of: startIndex) > heap[startIndex]
////            return .none
////        }
////
////
////        if (heap[leftChildIndex] > heap[startIndex]) && (heap[rightChildIndex] > heap[startIndex]) {
////            return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
////        }
////
////
////        return heap[leftChildIndex] > heap[startIndex] ? .left : .right
////    }
////}
//
//let elementA = Element(data: 1)
//let elementB = Element(data: 2)
//let elementC = Element(data: 3)
//
//
//var heap = MinHeap(root: elementA)
//print(heap)
////print("")
//
////h.push(elementB)
////print(h.heap)
////print("")
////
////h.push(elementC)
////print(h.heap)
////print("")
//
////print(h.hasRightChild(of: 1))
////print(h.getLeftChildElement(of: 2))
