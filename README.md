# 🧮 은행 창구 매니저
> 프로젝트 기간 2022.04.25 ~ 2022.04.  
팀원 : [malrang](https://github.com/kinggoguma), [mmim](https://github.com/JoSH0318) / 리뷰어 : ❤️ [Hyunable](https://github.com/hyunable)

- [실행화면](#실행화면)
- [UML](#uml)
- [STEP 1 기능 구현](#step-1-기능-구현)
    + [고민한 점(트러블 슈팅)](#고민한-점트러블-슈팅)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)
- [Ground Rules](#ground-rules)

---

## 실행화면

---

## UML
<img width="600" src="https://i.imgur.com/faRXdIs.jpg"/>

---

## STEP 1 기능 구현
### 고민한 점(트러블 슈팅)
1️⃣ Node와 DoubleLinkedList의 의존도를 낮출순 없을까?
- protocol 을 활용해 의존도를 낮춰보려고 고민했다.
- 아래의 예시 코드처럼 Node 가 Connectable 프로토콜을 채택한후
- DoubleLinkedList 에서 head 와 tail 이 Node 타입이 아닌 Connectable 프로토콜 타입으로 정의해 사용할순 없을까 고민했다.
```swift
protocol Connectable {
    associatedType T
    func getValue() -> T {}
    func getPrevious() -> Node<T> {}
}

class Node<T>: Connectable {
    var value: T
    weak var previous: Node?
    var next: Node?
    
    init(value: T, previous: Node? = nil, next: Node? = nil) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}

struct DoubleLinkedList<T> {
    private var head: Connectable?
    private var tail: Connectable?
    
    var isEmpty: Bool {
        if head == nil {
            return true
        }
        return false
    }
    
    var peek: T? {
        let head = head as? Node<T>
        return head?.value
    }
    
    mutating func enqueue(value: T) {
        if isEmpty {
            head = Node(value: value)
            tail = head
            return
        }
        let oldTail = tail as? Node<T>
        let newNode = Node(value: value, previous: oldTail)
        oldTail?.next = newNode
        tail = newNode
    }
}
```
- 하지만 위 코드의 문제점은 다운캐스팅을 하는 과정에서 다시 의존도가 높아진다는 것이다.
- 그렇다면 head 혹은 tail 이 Node 로 다운캐스팅 성공해야만 enqueue, dequeue 등의 기능을 사용할 수 있게 된다.

2️⃣ DoubleLinkedList의 타입은? class vs struct
- 🤔 DoubleLinkedList는 상속도 참조도 필요없다. 때문에 class를 사용할 이유가 없다.
- struct를 사용하기 때문에 프로퍼티 값의 변경을 주는 메서드에는 필연적으로 mutating이 쓰인다.
- mutating을 사용한 메서드는 COW 방식으로 메모리에서 값이 변하고 때문에 전체값을 복사하는 비용이 발생한다. 
- 이때, 과연 class의 RC보다 비용이 더 적게 들지, 많이 들지 예상할 수 없다.


3️⃣ 순환 참조
- Node 의 next 와 previous 가 var 로 선언된다면 Node 가 여러개 있을때 next 의 Node 와 previous의 Node 가 서로 강한 순한 참조를 하게되어 Node 를 제거해도 메모리에서 해제되지 않는다.
- 이를 해결하기 위해 previous 에 weak 키워드를 사용하여 RC 카운트가 올라가지 않도록 하여 강한 순환 참조를 해결했다.

### 질문사항
- 

### 배운 개념
- LinkedList
- associatedtype 

### PR 후 개선사항
---

## Ground Rules
### 스크럼
- 🌈  10시 시작 
- 스크럼 시간은 30분이 넘지 않기
- 오늘의 목표 / 공유할 이슈 / 컨디션 공유
- 자신의 부족한 부분 / 우리 팀이 아쉬운 부분 토론
- 상황에 따라 조정 가능

### 주간 활동 시간
- 월, 화, 목, 금 : 10시 ~ 22시
- 수요일 : 개인공부
- 점심시간 : 13시 ~ 14시
- 저녁시간 : 18시 ~ 20시
- 상황에 따라 조정 가능

###  🪧 코딩 컨벤션
#### Swift 코드 스타일
- 코드 스타일은 [스타일쉐어 가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88) 에 따라 진행한다.

#### Commit 규칙
- 커밋 제목은 최대 50자 입력
- 본문은 한 줄 최대 72자 입력

#### Commit 메세지
🪛[chore]: 코드 수정, 내부 파일 수정.  
✨[feat]: 새로운 기능 구현.  
🎨[style]: 스타일 관련 기능.(코드의 구조/형태 개선)  
➕[add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가  
🔧[file]: 새로운 파일 생성, 삭제 시  
🐛[fix]: 버그, 오류 해결.  
🔥[del]: 쓸모없는 코드/파일 삭제.  
📝[docs]: README나 WIKI 등의 문서 개정.  
💄[mod]: storyboard 파일,UI 수정한 경우.  
✏️[correct]: 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.  
🚚[move]: 프로젝트 내 파일이나 코드(리소스)의 이동.  
⏪️[rename]: 파일 이름 변경이 있을 때 사용합니다.  
⚡️[improve]: 향상이 있을 때 사용합니다.  
♻️[refactor]: 전면 수정이 있을 때 사용합니다.  
🔀[merge]: 다른브렌치를 merge 할 때 사용합니다.  
✅ [test]: 테스트 코드를 작성할 때 사용합니다.  

#### Commit Body 규칙
- 제목 끝에 마침표(.) 금지
- 한글로 작성

#### 브랜치 이름 규칙
- `STEP1`, `STEP2`, `STEP3`
