//
//  1-Stack.swift
//  01-Stack
//
//  Created by 김상혁 on 2022/02/11.
//

import Foundation

struct Stack<T> {
    var stack: [T] = []
    let maxSize: Int

    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func isFull() -> Bool {
        return self.stack.count == self.maxSize
    }
    
    mutating func push(element: T) {
        self.stack.append(element)
    }
    
    mutating func pop() -> T? {
        if isEmpty() {
            return nil
        }
        
        return stack.popLast()
    }
    
    func showAll() {
        print("--- Stack Top ---")
        for i in stride(from: stack.count - 1, through: 0, by: -1) {
            print(stack[i])
        }
        print("--- Stack Botton ---")
    }
}
