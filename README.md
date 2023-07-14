# 🏦 은행창구 매니저

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

</br>

## 🍀 소개
(`EtialMoon`, `idinaloq`)팀이 만든 은행창구 매니저 입니다. 임의의 수의 고객이 방문하고, 은행창구 매니저가 모든 고객들의 업무를 처리합니다.
* 주요 개념: `LinkedList`, `Queue`

</br>

## 👨‍💻 팀원
| idinaloq | EtialMoon |
| :--------: | :--------: |
| <Img src = "https://user-images.githubusercontent.com/109963294/235301015-b81055d2-8618-433c-b680-58b6a38047d9.png" width = "200" height="200"/> |<img src="https://i.imgur.com/hSdYobS.jpg" width="200"> |
|[Github Profile](https://github.com/idinaloq) |[Github Profile](https://github.com/hojun-jo) |

</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.07.10.| Node 타입 추가<br>SingleLinkedList 타입 추가<br> |
|2023.07.12.| SingleLinkedList 메서드 추가 |
|2023.07.13.| Bank 타입 추가<br>Customer 타입 추가<br>코드 리팩토링<br>BankManager 구현 |

</br>

## 👀 시각화된 프로젝트 구조

### ℹ️ File Tree

    ┌── BankManagerConsoleApp
    │   └── BankManagerConsoleApp
    │       ├── main
    │       ├── Node
    │       ├── SingleLinkedList
    │       ├── Bank
    │       ├── BankManager
    │       └── Customer
    │   └── BankManagerConsoleAppTests
    │       └── BankManagerConsoleAppTests
    └── 

### 📐 Class Diagram
<p align="center">
<img width="1000" src="https://github.com/idinaloq/testRep/assets/124647187/88cdf4b9-298d-4e35-8074-a9eb91f0087a">
</p>

</br>

## 💻 실행 화면 
<img width="500"
     src="https://github.com/idinaloq/testRep/assets/124647187/51231ef4-ddad-4fa5-8ff9-00f747972116">

</br>

## 🧨 트러블 슈팅

1️⃣ **Test Double** <br>

🔒 **문제점** <br>
- 유닛 테스트를 진행하는 과정에서 모듈에 접근 시 접근제어자 때문에 접근이 불가능 한 문제가 있었고, 해결 방법을 다음과 같이 고민해 보았습니다.
    1. 접근제어자 수정: 유닛 테스트의 목적은 프로퍼티, 메서드, 클래스 등을 코드 단위로 테스트하기 위해서 진행하지만, 만약 테스트를위해 접근제어자가 변경된다면 코드가 테스트에 종속되고, 캡슐화에도 문제가 있다고 생각해서 다음 방법을 고민했습니다.
    2. `extension` 사용: 접근제어자 수정을 대체할 방법으로 extension으로 테스트할 코드의 기능을 구현하는 것인데, 캡슐화에 문제가 없지만 테스트를 위해 코드를 작성한다는 부분에서 아쉬움이 있었기 때문에 선택하지 않고 다른 방법을 고민했습니다.
    3. 테스트 더블 사용: 테스트를 위한 객체를 만들어 실제 코드에서 접근제어자 때문에 테스트가 불가능하던 부분을 대신하고, 실제로 동작되어야 하는 코드의 변경 없이 테스트를 할 수 있기 때문에 이 방법을 선택했습니다.

- 하지만 `stub` 객체와 `real` 객체 간의 동일성을 보장할 수 없다는 문제가 있었습니다.

🔑 **해결방법** 
- `real` 객체에서 `private`인 프로퍼티를 사용하는 메서드를 통해 테스트를 진행할 수 있도록 했습니다.

2️⃣ **Linked List** <br>

🔒 **문제점** <br>
- `Bank`타입에서 고객들의 수 만큼 인스턴스를 생성해서 `enqueue`하는 `enqueueCustomers()`메서드를 구현했습니다. 하지만 3번 이상 `enqueue`를 하게 되면 `enqueue`가 되지 않는 현상이 있었습니다. 
- `SingleLinkedList`에서 `tail`을 지우는 것으로 수정하며 문제가 있었습니다.

**이전코드**

```swift
mutating func enqueue(_ data: Element) {
    let node: Node<Element> = Node(data: data)

    guard !isEmpty else {
        firstNode = node

        return
    }

    var nextNode: Node<Element>? = firstNode

    while nextNode?.next != nil {
        nextNode = firstNode?.next
    }

    nextNode?.next = node
}
```

🔑 **해결방법** 
- 처음 코드를 보면, 만약 새로운 노드가 추가 되었을 때 항상 첫 번째와 같은 값을 가지는 노드를 추가하고 있습니다. 이 때문에 잘못된 값이 계속 들어갔기 때문에 다음과 같이 수정했고, 두 차이점을 표현하면 다음과 같습니다.

**수정된 코드**

```swift
mutating func enqueue(_ data: Element) {
    ...
    while nextNode?.next != nil {
        nextNode = nextNode?.next
    }
    ...
}
```

**차이점**
|sequence|nextNode = firstNode?.next|nextNode = nextNode?.next|
|:--:|:--:|:--:|
|초기값|nil|nil|
|enqueue(1)|1 -> nil|1 -> nil|
|enqueue(2)|1 -> 2 -> nil|1 -> 2 -> nil|
|enqueue(3)|1 -> 2 -> 3 -> nil |1 -> 2 -> 3 -> nil|
|enqueue(4)|1 -> 2 -> 3 -> 3 -> ...|1 -> 2 -> 3 -> 4 -> nil|

</br>

## 📚 참고 링크
<!-- - [🍎Apple Docs: ]()
- [📘stackOverflow: ]() -->
- [📘blog: Linked List](https://supermemi.tistory.com/entry/Linked-list-연결-리스트-란-무엇인가)
- [🖥️video: Single Linked List](https://www.youtube.com/watch?v=R9PTBwOzceo)

</br>

## 👥 팀 회고
