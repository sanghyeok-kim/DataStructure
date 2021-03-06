# BFS
## 너비우선탐색(Breadth First Search)
<img src="https://user-images.githubusercontent.com/57667738/155842440-f5d4259c-8a6e-412d-bd4f-ea8b424b5f3b.gif" width="50%">

너비 우선탐색은 큐를 사용하며,<br>어떤 정점을 방문한 후 그 정점에 연결된 다른 정점들을 큐에 줄을 세워가면서 순차적으로 방문하는데,<br>방문하지 않은 정점이 없을 때(더이상 큐에 남아있는 정점이 없어질 때)까지<br>다른 모든 정점들에 대해서 똑같은 방식으로 탐색을 한다.

<br>

<img src="https://user-images.githubusercontent.com/57667738/155842754-5cbf6b3a-6de1-4d33-8067-c606e1238dc3.gif" width="40%">

*큐에 먼저 들어온 정점이 먼저 디큐되고, 그 정점과 연결된 정점들이 큐에 인큐 되는 FIFO 방식*
 
- 두 노드사이의 최단 경로 혹은 임의의 경로를 찾고 싶을 때 이 방법을 선택한다.
- 큐를 이용하므로 선입선출(FIFO)의 방식으로 탐색한다.

<br>
<br>

# DFS
## 깊이우선탐색(Depth First Search)
<img src="https://user-images.githubusercontent.com/57667738/155842439-66526d60-c4eb-4855-bc82-488450cc5b86.gif" width="50%">

깊이 우선탐색은 스택이나 재귀를 사용하며,<br>어떤 정점에서 그 정점과 연결된 정점까지 계속해서 나아가다가<br>목표 정점을 찾지 못하면 다시 가장 가까운 정점으로 돌아와서 다른 경로를 택해서 다시 탐색을 한다.<br>여기서 다시 되돌아 오는 과정을 백트래킹(Backtracking)이라고 한다.

예를 들어 미로를 탐색할때 한 방향으로 갈 수 있는 곳 까지 계속해서 나아가다가,<br>막힌 곳이 나타나면 다시 가장 가까운 갈림길이 있는 곳으로 되돌아와서<br>다른 길로 탐색을 진행하는 방법과 유사하다.

<br>

<img src="https://user-images.githubusercontent.com/57667738/155842768-aec553ed-4c50-4cd5-b49e-e8ac68aae9a8.gif" width="50%">

*다른 경로를 찾기 위해 백트래킹을 하는 과정에서 LIFO 방식*
 
- DFS는 현재 탐색하고 있는 경로 상의 노드들만 기억하면 되기 때문에 BFS에 비해 저장공간의 수요가 비교적 적다.

- 스택을 이용하기 때문에 후입선출(LIFO)의 방식으로 탐색한다.
- 목표 노드가 깊은 단계에 있을 경우 해를 빨리 구할 수 있다.
- 해가 없는 경로에 깊이 빠질 가능성이 있기 때문에 미리 지정한 임의 깊이까지만 탐색하고
  목표 노드를 발견하지 못하면 빠져나와서 다음 경로를 탐색하게 할수도 있다.
- 목표에 이를 수 있는 경로가 다수일 때, DFS는 목표에 다다르면 탐색을 끝내버리기 때문에 얻어진 해가 최단 경로라는 보장이 없다.
