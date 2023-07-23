# 🏦 은행창구 매니저

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

</br>

## 🍀 소개

minsup, hoon 팀이 만든 은행창구 매니저 콘솔 앱입니다. 업무를 수행하는 은행원의 수를 정하여 동시에 고객의 요청을 수행합니다.

* 주요 개념: `Concurrent Programming`, `GCD`, `Queue`, `LinkedList`, `Unit Test`

</br>

## 👨‍💻 팀원
|  minsup | hoon |
| :--------: | :--------: |
| <Img src = "https://avatars.githubusercontent.com/u/79740398?v=4" width="200"> |<Img src="https://i.imgur.com/zXoi5OC.jpg" width="200" height="200"> |
|[Github Profile](https://github.com/agilestarskim) |[Github Profile](https://github.com/Hoon94) |

</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.07.10.| Node, LinkedList, Queue 타입 생성 | 
|2023.07.11.| Node, LinkedList, Queue 테스트 작성 |
|2023.07.14.| Customer, BankManger, Bank 타입 생성 |

</br>

## 👀 시각화된 프로젝트 구조

### ℹ️ File Tree

    BankManagerConsoleApp
    ├── BankManagerConsoleApp
    |    ├── main
    |    ├── Node
    |    ├── LinkedList
    |    ├── Queue
    |    ├── Bank
    |    ├── BankManager
    |    └── Customer
    └── BankManagerConsoleAppTests
         ├── NodeTests
         ├── LinkedListTests
         └── QueueTests


### 📐 Diagram
<p align="center">
<img width="500" src="https://hackmd.io/_uploads/rkeCWUCY3.jpg">
</p>


## 💻 실행 화면 

| 은행 개점|
|:--------:|
|<img src="https://hackmd.io/_uploads/HyEHINCYn.gif"  width="480">|


</br>

## 🧨 트러블 슈팅

1️⃣ **`removeAll()` 할 때 `Node deinit` 시점** <br>
-
🔒 **문제점** <br>
- `LinkedList`의 `removeAll()` 메소드를 구현하던 중 의문이 들었습니다.

    > * 모든 노드를 순회하며 `nil`을 할당해서 메모리에서 해제시켜야 하는가?
    > * 첫 노드만 `nil`을 할당하면 연결된 모든 노드들이 메모리에서 자동으로 해제되는가?

🔑 **해결방법** <br>
- 질문의 해답을 찾기 위해 직접 실험을 해보았습니다. head에 nil을 할당하면 연쇄적으로 연결된 모든 노드들이 메모리에서 해제되는 것을 확인했습니다.

    ```swift
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    ```

    ![](https://hackmd.io/_uploads/H15KcIKY3.png)

    `LinkedList`를 사용하여 새로운 `Node`가 추가되면 기존에 있던 `Node`의 `next` 프로퍼티를 통해 다음 `Node`를 참조합니다. 이렇게 각각의 `Node`는 다음에 오는 `Node`를 참조하고 있고 참조하는 `Node`가 없는 경우 `nil`을 가지고 있습니다. 첫 `Node`는 `head`가 참조하고 있습니다. `removeAll()` 메소드를 사용하여 각각 노드를 참조하고 있는 `head`와 `tail`에 `nil`을 할당하면 앞의 `Node`를 참조하고 있던 다음 `Node` 객체의 `reference count`는 0이 되어 메모리에서 해제됩니다. 그러므로 앞에 있던 `Node`부터 순차적으로 `deinit`이 실행됩니다.

<br>

2️⃣ **`commandline tool`에서 테스트하는 법** <br>
-
🔒 **문제점** <br>
- `commandline tool`에서 `Unit Test`를 진행하려고 했을 때 `iOS App` 과는 다른 문제점이 있었습니다. 아래의 설정처럼 `Target to be Tested`를 설정하는 것이 불가능했습니다.
 
    ![](https://hackmd.io/_uploads/SyxjXj9F3.png)

🔑 **해결방법** <br>
- 이를 해결하기 위해 몇 가지 추가적인 설정이 필요했습니다. 테스트하고자 하는 파일의 `Target MemberShip`에 Test 타겟을 설정해야 했습니다. Test 타겟을 설정하면 `compile source`에 포함시켜 실행시킬 때 함께 빌드 할 수 있도록 합니다.

    - [참고 링크](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%97%90%EC%84%9C-%EC%9C%A0%EB%8B%9B-%ED%85%8C%EC%8A%A4%ED%8A%B8-%ED%95%98%EA%B8%B0)

<br>

3️⃣ **객체의 `private` 프로퍼티를 테스트 환경에서 접근하기** <br>
-
🔒 **문제점** <br>
- `Unit Test`를 하기 위해 아래와 같은 객체가 있을 때 테스트 코드에서 `head`와 `tail`을 어떻게 사용할지 고민을 했습니다. 프로퍼티에 대한 테스트와 노출된 메소드를 검증하기 위한 비교 대상으로 사용하기에는 `private`으로 은닉화가 되어 있어 외부에서 사용하기가 불가능했습니다. 

    ```swift
    struct LinkedList<Value> {
        private var head: Node<Value>?
        private var tail: Node<Value>?
        ...
    }
    ```

🔑 **해결방법** <br>
- 전처리문을 사용하여 테스트 코드에서만 적용되는 `extension`을 만들 수 있었습니다.

    ![](https://hackmd.io/_uploads/rkdUyoqFn.png)

    ```swift
    //MARK: - Extension for Unit Test
    #if canImport(XCTest)
    extension LinkedList {
        var exposedHead: Node<Value>? {
            return head
        }

        var exposedTail: Node<Value>? {
            return tail
        }
        ...
    }
    #endif
    ```

<br>

## 📚 참고 링크
- [🍎Apple Docs: Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/)
- [🍎Apple Docs: Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [🍏Apple Archive: Concurrency Programming Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)
- [📼Apple WWDC: Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)
- [📙Swift forums: 테스트를 위한 전처리문](https://forums.swift.org/t/how-do-you-know-if-youre-running-unit-tests-when-calling-swift-test/49711/4)

</br>
