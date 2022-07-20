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


// --------------------------- MinHeap ---------------------------
////var myMinHeap = MinHeap(dummyRootNode: -1)
//var myMinHeap = MinHeap<Int>()
//myMinHeap.push(3)
//myMinHeap.push(9)
//myMinHeap.push(4)
//myMinHeap.push(2)
//myMinHeap.push(6)
//myMinHeap.push(5)
//myMinHeap.push(7)
//
//
//print(myMinHeap.heap)
//print("")
//
//print(myMinHeap.pop()) //1
//print(myMinHeap)
//print("")
//
//print(myMinHeap.pop()) //2
//print(myMinHeap)
//print("")
//
//print(myMinHeap.pop()) //3
//print(myMinHeap)
//print("")
//
//print(myMinHeap.pop()) //4
//print(myMinHeap)
//print("")
//
//print(myMinHeap.pop()) //5
//print(myMinHeap)
//print("")
//
//print(myMinHeap.pop()) //6
//print(myMinHeap)
//print("")
//
//print(myMinHeap.pop()) //7
//print(myMinHeap)
//print("")
//
//print(myMinHeap.pop()) //nil
//print(myMinHeap)
//print("")

//--------------------------- MaxHeap ---------------------------
//var myMaxHeap = MaxHeap<Int>()
//myMaxHeap.push(100)
//myMaxHeap.push(50)
//myMaxHeap.push(75)
//myMaxHeap.push(1)
//myMaxHeap.push(2)
//myMaxHeap.push(51)
//
//print(myMaxHeap.heap)
//print("")
//
//print(myMaxHeap.pop()) //1
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop()) //2
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop()) //3
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop()) //4
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop()) //5
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop()) //6
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop()) //7
//print(myMaxHeap)
//print("")
//
//print(myMaxHeap.pop()) //nil
//print(myMaxHeap)
//print("")



// --------------------------- DoublyHeap ---------------------------
var doublyHeap = DoublyHeap<Int>()

doublyHeap.push(3)
//doublyHeap.heapifyUpToMaxHeap()
doublyHeap.push(9)
//doublyHeap.heapifyUpToMaxHeap()
doublyHeap.push(4)
//doublyHeap.heapifyUpToMaxHeap()
doublyHeap.push(2)
//doublyHeap.heapifyUpToMaxHeap()
doublyHeap.push(6)
//doublyHeap.heapifyUpToMaxHeap()
doublyHeap.push(5)
//doublyHeap.heapifyUpToMaxHeap()
doublyHeap.push(7)
//doublyHeap.heapifyUpToMaxHeap()

//print(doublyHeap.heap)
//doublyHeap.sortToMinHeap()
//print(doublyHeap.heap)
//print(doublyHeap.pop())

//doublyHeap.sortToMinHeap()
//print(doublyHeap.pop())


doublyHeap.heapifyUpToMaxHeap()
print(doublyHeap.pop())
doublyHeap.sortToMaxHeap()

//print(doublyHeap.pop())
//doublyHeap.sortToMaxHeap()
//
//print(doublyHeap.pop())
//doublyHeap.sortToMaxHeap()
//
//print(doublyHeap.pop())
//doublyHeap.sortToMaxHeap()
//
//print(doublyHeap.pop())
//doublyHeap.sortToMaxHeap()
//
//print(doublyHeap.pop())
//doublyHeap.sortToMaxHeap()
//
//print(doublyHeap.pop())
//doublyHeap.sortToMaxHeap()
//
//print(doublyHeap.pop())
//doublyHeap.sortToMaxHeap()
//
