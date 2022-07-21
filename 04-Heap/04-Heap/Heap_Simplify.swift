//
//  Heap_Simplify.swift
//  04-Heap
//
//  Created by 김상혁 on 2022/07/21.
//

import Foundation

struct Node {
    var index: Int
    var cost: Int
}

class MinHeap_Simp {
    var elements: [Node] = [Node(index: 0, cost: 0)]
    
    var isEmpty: Bool {
        return self.elements.count == 1
    }
    
    func push(_ value: Node) {
        self.elements.append(value)
        var currentIndex = self.elements.count - 1
        var parentIndex = Int(currentIndex / 2)
        
        while parentIndex != 0 && value.cost < self.elements[parentIndex].cost {
            self.elements.swapAt(currentIndex, parentIndex)
            currentIndex = parentIndex
            parentIndex = Int(currentIndex / 2)
        }
    }
    
    func pop() -> Node {
        if self.elements.count == 2 {
            return self.elements.removeLast()
        }
        
        let returnValue = self.elements[1]
        self.elements[1] = self.elements.removeLast()
        
        let count = self.elements.count
        var currentIndex = 1
        var leftIndex = 2
        var rightIndex = 3
        
        while leftIndex < count && self.elements[currentIndex].cost > self.elements[leftIndex].cost ||
              rightIndex < count && self.elements[currentIndex].cost > self.elements[rightIndex].cost {
            if rightIndex >= count || self.elements[leftIndex].cost < self.elements[rightIndex].cost {
                self.elements.swapAt(currentIndex, leftIndex)
                currentIndex = leftIndex
            } else {
                self.elements.swapAt(currentIndex, rightIndex)
                currentIndex = rightIndex
            }
            leftIndex = currentIndex * 2
            rightIndex = currentIndex * 2 + 1
        }
        
        return returnValue
    }
}

//MaxHeap -> push할 때 '-'붙여서 넣기, pop할 때 다시 '-' 빼서 쓰기
