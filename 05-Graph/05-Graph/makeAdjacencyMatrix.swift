//
//  makeAdjacencyMatrix.swift
//  05-Graph
//
//  Created by 김상혁 on 2022/07/21.
//

import Foundation

func makeAdjacencyMatrix(with edges: [[Int]]) -> [Int: [Int]] {
    var matrix: [Int: [Int]] = [:]
    
    for i in edges {
        let srcNode = i.first!
        let destNode = i.last!

        switch matrix[srcNode] {
        case .none:
            matrix[srcNode] = [destNode]
        case .some:
            matrix[srcNode]! += [destNode]
        }

        switch matrix[destNode] {
        case .none:
            matrix[destNode] = [srcNode]
        case .some:
            matrix[destNode]! += [srcNode]
        }
    }
    
    return matrix
}

//simplified version
func makeAdjacencyMatrix_simpleVer(with edges: [[Int]]) -> [Int: [Int]] {
    var matrix: [Int: [Int]] = [:]
    
    edges.forEach {
        matrix[$0[0]] = (matrix[$0[0]] ?? []) + [$0[1]]
        matrix[$0[1]] = (matrix[$0[1]] ?? []) + [$0[0]]
    }
    
    return matrix
}
