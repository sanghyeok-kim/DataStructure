//
//  main.swift
//  01-Stack
//
//  Created by 김상혁 on 2022/01/28.
//

import Foundation

/*-------------------- Stack Test --------------------*/
struct Element {
    var data: Int
}

var myStack = Stack<Element>(maxSize: 3)
let myE = Element(data: 10)
myStack.push(element: myE)
myStack.showAll()
print(myE.data > myE.data)

//let elementA = Element(data: 1)
//let elementB = Element(data: 2)
//let elementC = Element(data: 3)
//
//myStack.push(element: elementA)
//myStack.push(element: elementB)
//myStack.push(element: elementC)
//
//myStack.showAll()
//
//print(myStack.pop())
//myStack.showAll()
//
//print(myStack.pop())
//myStack.showAll()
//
//print(myStack.pop())
//myStack.showAll()
//
//myStack.push(element: elementC)
//myStack.showAll()
//
//myStack.push(element: elementB)
//myStack.showAll()
//
//myStack.push(element: elementA)
//myStack.showAll()
