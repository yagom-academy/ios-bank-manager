# 은행 창구 매니저 프로젝트

1. 프로젝트 기간: 2021.12.20 - 2021.12.31
2. Grounds Rules
    - 시간
        - 시작시간 10시
        - 점심시간 12시~2시
        - 저녁시간 6시~7시 사이부터 2시간
    - 진행 계획
        - 프로젝트가 중심이 아닌 학습과 이유에 초점을 맞추기
        - 의문점을 그냥 넘어가지 않기
    - 스크럼
        - 10시에 스크럼 시작
3. 커밋 규칙
    - 단위
        - 기능 단위
    - 메세지
        - 카르마 스타일

# 키워드

- `struct` `class`
- `Queue`
    - `LinkedList`
- `Generic`

# STEP 1 : 큐 타입 구현

은행에 도착한 고객이 임시로 대기할 대기열 타입을 구현합니다.

## 1-1 고민했던 것

- 양방향 LinkedList vs 단방향 LinkedList
    - 서로 이야기를 나누면서 단방향으로도 충분히 큐를 구현할 수 있다는 생각이 듦.
    - 노드를 클래스로 만들고 참조를 활용하여 모든 노드를 연결할 수 있게 구현하였다.
- 테스트를 위한 Mock 타입 생성
    - 테스트 진행시 `Node`, LinkedList의 `head`, `tail`의 요소를 접근하여 테스트 결과를 확인했다.
    - 해당 요소들은 외부에서 접근하면 안된다는 판단이 들어서 따로 MockLinkedList를 만들어주어 원활한 테스트를 할 수 있도록 구현하였다.
- attribute를 활용
    - 반환 값을 유의미하게 사용하지 않고 버려도되는 remove 관련 메소드에 속성 **`@discardableResult`**을 부여하여 컴파일러 경고가 발생하지 않도록 하였다.

## 1-2 의문점

- if vs guard
    
    ```swift
    // 1. if 구문
    func removeFirst() -> Element? {
        if isEmpty {
            return nil
        }
        let result = head?.value
        head = head?.next
        
        return result
    }
    ```
    
    ```swift
    // 2. guard 구문
    func removeFirst() -> Element? {
        guard isEmpty == false else {
            return nil
        }
        let result = head?.value
        head = head?.next
        
        return result
    }
    ```
    
- if문으로 구현 시 조건문이 깔끔하게 isEmpty로 맞아떨어지기 때문에 코드의 가독성이 좋다고 생각했다.
    - guard문이든 if문이든 메소드 시작부문에서 return을 활용하여 메소드를 탈출하는건 동일하기 때문에 어떤 구문을 사용하든 상관없다는 생각이 들었다.
- guard문
    - guard 구문의 기능은 코드 블럭의 빠른 종료 기능을 가지고 있어 함수 전체 흐름을 봤을 때 guard 구문이 가독성이 더 좋다고 생각했다. guard문만 보더라도 함수를 탈출하는 구문이라고 읽혀지기 때문이다.
    - if문 처럼 조건문이 깔끔하지는 못하게 되었지만, 함수를 탈출하는 부분을 guard문으로 일관성 있게 구성할 수 있게 되었다.

## 1-3 Trouble Shooting

### [1] 참조타입을 활용한 연결리스트

- `상황` append를 할때 연결된 리스트들의 가장 마지막 부분에 새로운 데이터를 넣어줘야하는데, 요소를 탐색하기 위해 반복적으로 포인터를 추적하는 작업을 해야하는 점을 깔끔하게 해결해보고 싶었다.
- `이유` Queue를 위한 LinkedList인 점도 있고, 또 각 요소를 탐색하기 위해 반복적으로 포인터를 추적하게 된다면 시간복잡도가 O(n)이기 때문에 데이터 접근 방식이 매우 비효율적인 점을 해결하고 싶었다.
- `해결`  클래스의 참조를 활용하여 연결리스트를 연결하도록 구현하였다.
    
    ```swift
    func append(_ value: Element) {
        let newNode = Node(value: value)
            
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    ```

![](https://i.imgur.com/C3uId1Z.png)
    

## 1-4 배운 개념

- Linked-list 자료구조의 이해
- Queue 자료구조의 이해

[![top](https://img.shields.io/badge/top-%23000000.svg?&amp;style=for-the-badge&amp;logo=Acclaim&amp;logoColor=white&amp;)](#은행-창구-매니저-프로젝트)
