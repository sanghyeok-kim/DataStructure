//
//  CursorQueue.swift
//  02-Queue
//
//  Created by 김상혁 on 2022/07/21.
//

import Foundation

struct Queue<T> {
    var queue: [T] = []
    var headIndex = 0
    
    mutating func enqueue(node: T) {
        queue.append(node)
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
