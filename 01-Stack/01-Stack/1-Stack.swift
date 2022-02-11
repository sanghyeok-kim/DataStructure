//
//  1-Stack.swift
//  01-Stack
//
//  Created by 김상혁 on 2022/02/11.
//

import Foundation

struct Element<T: Comparable> {
    var data: T
}

struct Stack<T: Comparable> {
    var stack: [Element<T>] = []
    let size: Int

    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func isFull() -> Bool {
        return self.stack.count == self.size
    }
    
    mutating func push(element: Element<T>) {
        self.stack.append(element)
    }
    
    mutating func pop() -> Element<T>? {
        if isEmpty() {
            return nil
        }
        
        return stack.removeFirst()
    }
    
    func showAll() {
        print("--- Stack Top ---")
        for element in stack {
            print(element.data)
        }
        print("--- Stack Botton ---")
    }
}
