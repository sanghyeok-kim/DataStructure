//
//  BFS_DFS.swift
//  05-Graph
//
//  Created by 김상혁 on 2022/03/06.
//

import Foundation

func makeAdjacencyMatrix(with input: [[Int]]) -> [Int: [Int]] {
    var matrix: [Int: [Int]] = [:]
    
    for i in input {
        let srcNode = i.first!
        let destNode = i.last!
        
        switch matrix[srcNode] {
        case .none:
            matrix[srcNode] = [destNode]
        case .some:
            matrix[srcNode]!.append(destNode)
        }
        
        switch matrix[destNode] {
        case .none:
            matrix[destNode] = [srcNode]
        case .some:
            matrix[destNode]!.append(srcNode)
        }
    }
    
    return matrix
}

func bfs(with matrix: [Int: [Int]], from startNode: Int) -> [Int] {
    var visitedArray: [Int] = []
    var needToVisitQueue: [Int] = [startNode]
    
    while !needToVisitQueue.isEmpty {
        let node = needToVisitQueue.removeFirst() //removeFirst

        if visitedArray.contains(node) { continue }
        visitedArray.append(node)

        needToVisitQueue.append(contentsOf: matrix[node]!)
    }
    
    return visitedArray
}

func dfs(with matrix: [Int: [Int]], from startNode: Int) -> [Int] {
    var visitedArray: [Int] = []
    var needToVisitStack: [Int] = [startNode]
    
    while !needToVisitStack.isEmpty {
        let node = needToVisitStack.removeLast() //removeLast
        
        if visitedArray.contains(node) { continue }
        visitedArray.append(node)
        
        needToVisitStack.append(contentsOf: matrix[node]!)
    }
    
    return visitedArray
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    let matrix = makeAdjacencyMatrix(with: edge)
    print(matrix)
    let bfsResult = bfs(with: matrix, from: 1) //1번노드부터 시작한다고 설정
    print(bfsResult)
    
    let dfsResult = dfs(with: matrix, from: 1) //1번노드부터 시작한다고 설정
    print(dfsResult)
    return 0
}
