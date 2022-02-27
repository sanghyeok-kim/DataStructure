//
//  main.swift
//  04-Heap
//
//  Created by 김상혁 on 2022/01/28.
//

import Foundation

//Heap의 pop
    //1. root를 pop
    //2. last node를 root로 이동
    //3. root부터 heapify Down을 반복
        //자신이 child보다 (작을 때/클 때) -> swap
        //더 이상 비교할 child가 없을 때 or 모든 child가 자신보다 (클 때/작을 때) -> heapify Down 종료
    //4. heapify가 종료된 시점에 위치를 확정

//Heap의 push
    //1. 가장 마지막 leaf 자리에 새로운 node를 append
    //2. parent와 비교하며 heapify Up을 반복
        //parent가 자신보다 (클 때/작을 때) -> swap
        //더 이상 비교할 parent가 없을 때(root까지 올라갔을 때) or 부모가 자신보다 (작을 때/클 때) -> heapify Up 종료
    //3. heapify가 종료된 시점에 위치를 확정


/* --------------------------- MinHeap --------------------------- */
let elementA = MinElement(data: 1)
let elementB = MinElement(data: 2)
let elementC = MinElement(data: 3)
let elementD = MinElement(data: 4)
let elementE = MinElement(data: 5)
let elementF = MinElement(data: 6)
let elementG = MinElement(data: 7)

var myMinHeap = MinHeap(dummyRootNode: MinElement(data: -1))
myMinHeap.push(elementF)
myMinHeap.push(elementE)
myMinHeap.push(elementD)
myMinHeap.push(elementC)
myMinHeap.push(elementB)
myMinHeap.push(elementA)

print(myMinHeap)
print("")

print(myMinHeap.pop())
print(myMinHeap)
print("")

print(myMinHeap.pop())
print(myMinHeap)
print("")

print(myMinHeap.pop())
print(myMinHeap)
print("")

print(myMinHeap.pop())
print(myMinHeap)
print("")

print(myMinHeap.pop())
print(myMinHeap)
print("")

print(myMinHeap.pop())
print(myMinHeap)
print("")

print(myMinHeap.pop())
print(myMinHeap)
print("")

print(myMinHeap.pop())
print(myMinHeap)
print("")

/* --------------------------- MaxHeap --------------------------- */
//let elementA = MaxElement(data: 100)
//let elementB = MaxElement(data: 50)
//let elementC = MaxElement(data: 75)
//let elementD = MaxElement(data: 1)
//let elementE = MaxElement(data: 2)
//let elementF = MaxElement(data: 51)
//
//var myMaxHeap = MaxHeap(dummyRootNode: MaxElement(data: -1))
//
//myMaxHeap.push(elementF)
//myMaxHeap.push(elementE)
//myMaxHeap.push(elementD)
//myMaxHeap.push(elementC)
//myMaxHeap.push(elementB)
//myMaxHeap.push(elementA)
//
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop())
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop())
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop())
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop())
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop())
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop())
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop())
//print(myMaxHeap)
//print("")
