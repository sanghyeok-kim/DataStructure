//
//  bfs.swift
//  05-Graph
//
//  Created by 김상혁 on 2022/07/21.
//

import Foundation

struct CursorQueue<T> {
    var queue: [T] = []
    var headIndex = 0
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(node: T) {
        queue.append(node)
    }
    
    mutating func enqueue(contentsOf nodes: [T]) {
        queue.append(contentsOf: nodes)
    }
    
    mutating func dequeue() -> T? {
        if headIndex >= queue.count { return nil }
        
        if headIndex > 100 {
            queue.removeFirst(100)
            headIndex = 1
        }
        
        defer { headIndex += 1 }
        return queue[headIndex]
    }
}

func bfs(with matrix: [Int: [Int]], from startNode: Int) -> [Int] {
    var isVisited = [Bool](repeating: false, count: matrix.count + 1)

    var visitedArray: [Int] = []
    var needToVisitQueue = CursorQueue<Int>()
    needToVisitQueue.enqueue(node: startNode)

    while !needToVisitQueue.isEmpty() {
        let node = needToVisitQueue.dequeue()!
        
        if isVisited[node] { continue }
        visitedArray.append(node)
        isVisited[node] = true

        needToVisitQueue.enqueue(contentsOf: matrix[node]!)
    }

    return visitedArray
}
