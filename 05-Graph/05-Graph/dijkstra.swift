//
//  dijkstra.swift
//  05-Graph
//
//  Created by 김상혁 on 2022/07/22.
//

import Foundation

//다익스트라 최단경로
//1. 가장 먼저 시작 정점을 방문한다.
//2. 현재 정점에서 방문할 수 있는 정점들에 대한 거리를 갱신한다.
//3. 방문할 수 있는 정점들 중 가중치가 가장 작은 정점을 방문한다.
//4. 해당 정점을 거쳐서 갈 수 있는 방문하지 않은 정점들에 대한 거리를 갱신한다.
//5. 더 이상 방문할 정점이 없을 때 까지 3과 4를 반복한다.

//https://school.programmers.co.kr/tryouts/45256/challenges

struct Node {
    var index: Int
    var cost: Int
}

class Heap {
    var elements: [Node] = [Node(index: 0, cost: -999)] //0번째 채우기용
    
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

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    
    let heap = Heap()
    heap.push(Node(index: 1, cost: 0))
    
    var dist = [Int](repeating: Int.max, count: N + 1)
    dist[1] = 0 //1번째 노드 -> 자기 자신 -> 자기 자신에게 가는 dist는 0으로 처리하고 push
    
    while !heap.isEmpty {
        let currentNode = heap.pop() //minHeap에서 pop함 -> 비용이 가장 작은 노드를 우선으로 방문해서 탐색
        
        for roadInfo in road {
            let (src, dest, cost) = (roadInfo[0], roadInfo[1], roadInfo[2])
            
            let totalCost = currentNode.cost + cost
            //totalCost = 현재 노드까지 오는 cost + 현재 노드에서 dest까지 가는 cost
            //(최초 출발 노드에서 현재 노드를 거쳐 dest노드까지 가는 cost의 총합)
            
            //[현재 노드에서 출발 or 현재 노드로 도착]하면서
            //현재 노드를 거쳐서 도착하는 총 비용이 기존에 적혀있는 비용보다 싼 경우
            
            
            switch currentNode.index { //현재 노드가
            case src: //src에 해당하는 경우
                if totalCost < dist[dest] { // '현재노드를 거쳐 dest까지 가는 비용 < 기존 dest까지 가는 비용'인 경우
                    dist[dest] = totalCost //dest까지 가는 비용을 현재노드를 거쳐가는 총 비용으로 갱신
                    heap.push(Node(index: dest, cost: totalCost))
                }
            case dest: //dest에 해당하는 경우 -> src와 dest를 반대로 생각
                if totalCost < dist[src] { //'현재노드를 거쳐 dest(여기선 src)까지 가는 비용 < 기존 dest(여기선 src)까지 가는 비용'인 경우
                    dist[src] = totalCost //dest(여기선 src)까지 가는 비용을 현재노드를 거쳐가는 총 비용으로 갱신
                    heap.push(Node(index: src, cost: totalCost))
                }
            default:
                break
            }
        }
    }
            
            
//            /* --- 예를 들어 --- */
//            //[3, 5, 1]이나 [5, 3, 1]이나 3 ~ 5 사이의 비용을 나타내는 것은 똑같음 -> 두 경우를 똑같은 로직으로 처리함
//            //만약 현재 노드가 3일 경우,
//            switch currentNode.index {
//
//            //[src: '3', dest: 5, cost: 1]
//            case src:
//                if totalCost < dist[dest] { //[1 -> 3 -> 5 비용] < [1 -> 5 비용] 인 경우
//                    dist[dest] = totalCost //dest까지 가는 비용을 현재노드를 거쳐가는 총 비용으로 갱신
//                    heap.push(Node(index: dest, cost: totalCost))
//                }
//
//            //[src: 5, dest: '3', cost: 1] -> src와 dest를 바꿔서 위 경우와 똑같이 처리
//            case dest:
//                if totalCost < dist[src] { //[1 -> 3 -> 5 비용] < [1 -> 5 비용] 인 경우
//                    dist[src] = totalCost //dest(여기선 src)까지 가는 비용을 현재노드를 거쳐가는 총 비용으로 갱신
//                    heap.push(Node(index: src, cost: totalCost))
//                }
//            default:
//                break
//            }
//        }
//    }
    return dist.filter { $0 <= k }.count
}

//solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4)
//solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3)
