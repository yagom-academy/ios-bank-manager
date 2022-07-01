# 은행창구 프로젝트 

## 소개
- 고객의 은행 업무를 처리하고 알려주는 애플리케이션이다.
- 이 애플리케이션에서는 큐와 동시성 프로그래밍에 대해  자세히 알아볼 수 있다.

## 팀원

1. 예톤
- <img src = "https://user-images.githubusercontent.com/99063327/174224341-9ba4e42e-3ff2-4c58-b910-1d0b8d4d87f1.png" width = "10%" height = "10%"> 
- 예톤 [@yeeton37](https://github.com/yeeton37)
- iOS Career Starter 6th Camper

2. 웡빙
- <img src = "https://user-images.githubusercontent.com/98514397/176106991-e29be177-758d-400a-9f47-9022eaa260fa.png" width = "10%" height = "10%"> 
- 웡빙 [@wongbingg](https://github.com/wongbingg)
- iOS Career Starter 6th Camper

### UML

<img width="813" alt="스크린샷 2022-07-01 오후 5 00 53" src="https://user-images.githubusercontent.com/98514397/176851733-4ea2ff97-1645-415c-abe7-b1c2f1783216.png">

### Timeline

### 1주차

- 월
`그라운드 룰 작성`, `연결리스트 구현`, `연결리스트에 대한 이해`, `CommandLineTool에서 UnitTest작성`, 
    
- 화 
 `Unit테스트코드 추가`  `step1 PR제출 ` `README 업데이트`

- 수
 `step2 이해를 위한 UML작성`, `step2 UML기반으로 코드 작성`
- 목
 `코멘트 토대로 step1 리팩토링`, `queue`에 `initializer` 메서드 추가
- 금
 `UML 수정`, `step2 PR 제출`

### **참고한 문서**
- [command line tool에서 unit test하기](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-프로젝트에서-유닛-테스트-하기)
- [generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [final](https://velog.io/@ryan-son/Swift-final-키워드-왜-사용하는걸까)
- [linkedList](https://atelier-chez-moi.tistory.com/90)
- [associatedType](https://hyunsikwon.github.io/swift/Swift-AssociatedType)
- [Protocol Oriented Programming](https://www.pluralsight.com/guides/protocol-oriented-programming-in-swift)
- [Thread.sleep](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [구조체 내부에 참조가 있을 경우](https://developer.apple.com/videos/play/wwdc2016/416/?time=893)

### 시간

[프로젝트에 집중하는 시간]
- 10: 00 - 22: 00

[연락이 어려운 시간]
없음

[휴일]
- 예톤 : 주말
- 웡빙 : 주말

### 규칙

[커밋]

- 최소기능 단위 commit
- 카르마 스타일 따르기 ( 한글로 작성 )
- feat = 주로 사용자에게 새로운 기능이 추가되는 경우
- fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- docs = 문서에 변경 사항이 있는 경우
- style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- test = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

[컨벤션]

- Swift API Design Guidelines
- Swift Language Guide
- ios - Human Interface Guidelines

[커뮤니케이션]

- 디스코드 회의실
- 디스코드 다이렉트 메시지

# Step


## Step 1


### 1. 작업 내용

- 단방향 연결리스트 구현 
    - 프로퍼티 `head`를 만들어서 리스트의 첫번째 노드를 가리키도록 해주었습니다.
    - `isEmpty`, `peek`은 리스트를 확인하는 용도로만 사용되어 연산 프로퍼티로 선언해주었고, `append`, `removeFirst`, `clear`는 실제 동작을 하기 때문에 메서드로 선언해주었습니다.
- 큐 구현
    - 단방향 연결리스트로 큐를 구현해주었습니다. 

### 2. 테스트 방법

- CommandLineTool 에서 Unit테스트를 추가해주는 방법은 달랐습니다! 

1. unitTest를 추가해준 뒤에 unit test를 할 각 파일에 Target Menbership 창에서 해당 Test에 체크를 해준다.

<img src="https://i.imgur.com/aaKWsyY.png" width="250" height="140"/>

2. Test Scheme 을 추가해준다 

<img src="https://i.imgur.com/XJrNhAS.png" width="300" height="350"/>

3. 유닛 테스트 프로덕트를 추가해준다.


<img src="https://i.imgur.com/4Qy6EyN.png" width="600" height="350"/>


### 3. UnitTest
- NodeTests
- LinkedListTests
- CustomerQueueTests

[참고 링크](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-프로젝트에서-유닛-테스트-하기)

### 4. 스텝 핵심 경험

- [x] Linked-list 자료구조의 이해 및 구현
- [x] Queue 자료구조의 이해 및 구현
- [x] Generics 개념이해 및 적용

### 5. 고민한 점

- 저희가 step2까지의 기능 명세서를 보았을 때는 리스트 중간에 데이터가 추가될 일이 없어보였고, 또 tail 변수를 만들어주어야 할 필요성을 느끼지 못해서 양방향 연결리스트가 아닌 단방향 연결리스트로 구현해주었습니다. 추후 확장성도 고려해봤을 때 양방향 연결리스트로 구현하는 것이 좋았을지 여쭤보고 싶습니다.

- 큐와 연결리스트의 기능이 같아보이는데 따로 연결리스트와 큐 타입을 만들어서 큐에서 연결리스트의 기능을 가져와서 사용하는 것이 이해가 가지 않았습니다. 그냥 큐에서 바로 연결리스트의 기능을 구현해주면 되지 않나? 라고 생각했었습니다.
    -  찾아보니 큐는 구현 방법이 정의되어 있지 않은 자료형이고 연결리스트는 다음 데이터의 위치를 저장하는 방식인 자료구조기 때문에 따로 구현해줘야 함을 알게되었습니다! 저희가 생각한 것이 맞는지 궁금합니다.

- CustomerQueue를 구조체로 만들어 주었는데, 안에 쓰이는 Node 인스턴스는 클래스(참조타입) 입니다. 이렇게 만들어줄 경우 CustomerQueue도 결국 참조타입이 되는 것인지 궁금합니다.

## Step 2

### 작업내용
- **[타입 구현]**
    - **Bank** : 은행의 전반적인 기능을 작성 해주었습니다 
    - **BankManager** : 은행원의 수행역할을 작성 해주었습니다
    - **Customer**: 고객의 번호를 저장할 수 있는 타입을 작성 하였습니다
- **[랜덤한 고객의 수]**
    - 10~30사이 숫자의 고객이 방문한다고 가정했습니다
    - `Int.random(in range: ClosedRange<Int>)`를 이용하여 무작위 수를 생성 해주었습니다. 
- **[하나의 작업 당 0.7초씩 부여]**
    - BankManager가 고객을 응대하는 시간을 명당 0.7초로 정의 해주었습니다.
    - 작업의 시작과 끝 사이에 시간을 멈춰주었습니다.
    - `Thread.sleep(forTimeInterval: TimeInterval)`을 이용했습니다.
- **[전체 작업을 실행하는 메서드 구현]**
    - Bank의 각 작업을 시작하는 `start()` 메인 메서드를 구현했습니다
    
### 스텝 핵심 경험
- [x] Protocol Oriented Programming으로 `CustomerQueue`를 구현
- [x] Queue의 활용
- [x] 타입 추상화 및 일반화
- [x] 유닛 테스트의 번들 Target과 Scheme 

### 고민한 점들

### 1. private(set)
- 클래스 Queue에서 내부 프로퍼티를 private(set)으로 설정해주었습니다.
- 저희는 private(set)은 외부에서는 읽기만 가능하고 쓰기는 안되기 때문에 내부 프로퍼티를 외부에서 초기화해주는 것 또한 불가능할 것이라고 생각했습니다. 
- 하지만 초기화는 프로퍼티의 처음 상태를 설정해주는 것이기 때문에 private(set)으로 설정된 프로퍼티에 초기값을 할당하는 것은 가능하고, 할당된 프로퍼티에 접근해서 새로 할당을 하는 것은 불가능하다는 것을 알게되었습니다.

[코드]
```swift
struct CustomerQueue<T> {
    private(set) var queue: LinkedList<T>
}
```
```swift
class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue(queue: LinkedList())
    }
} // 정상 실행
```

### 2. 큐의 초기 조건을 설정해줄 수 있도록 이니셜라이저 추가
[라이언의 코멘트 1]

> 타입에서 큐의 초기 조건을 설정해줄 수 있도록 이니셜라이저를 추가해주면 좋을 것 같아요. 
현재 유닛테스트할 때 큐에 미리 아이템이 들어간 상황을 연출하려면 enqueue(data:) 메서드를 사용할 수밖에 없는데, 
그렇게 되면 enqueue(data:)의 실행 결과에 다른 테스트들이 영향을 받아 테스트의 신뢰성을 떨어뜨릴 수 있을 것 같아요

[라이언의 코멘트 2]
> peek의 기능을 검증하기 위한 테스트인데, enqueue의 로직과 성공 여부에 테스트 성공 여부가 달려있어 테스트의 독립성이 떨어진다는 의견이 나올 수 있을 것 같네요. 이니셜라이저를 통해 queue의 초기상태를 지정할 수 있는 기능을 추가해보는건 어떨까요?
[변경한 코드]
```swift
struct CustomerQueue: Queue {
    private(set) var queue: LinkedList<Customer>
    
    init(elements: [Customer] = []) {
        queue = LinkedList()
        elements.forEach {
            self.enqueue(data: $0)
        }
    }
}
```
- 라이언의 코멘트에 따라 CustomerQueue에 initializer를 추가해주었습니다.
    -  elements에 아무것도 담기지 않았을 경우 빈 배열로 설정되도록 default initializer로 만들어 주었습니다.
    -  배열인 elements 안의 요소를 foreach로 돌면서 빈 배열에 데이터를 넣어주었습니다.
    
### 3. 테스트 코드 네이밍 수정 
[라이언의 코멘트]
> 우리가 제공하는 Queue의 기능 범위는 무엇인가?
- isEmpty, peek, enqueue, dequeue, ...
    - 어떤 기능인가?
        - isEmpty: Queue가 비어있는지 판단할 수 있음 -> 검증할 것: 비어있을 때/비어있지 않을 때 -> queue가 빈 상태인지 판단할 수 있다.
        - peek: Queue의 첫번째 요소를 알 수 있음, 없으면 nil -> 검증 할 것: 첫 요소 있을 때/없을 때 -> queue의 첫번째 요소를 확인할 수 있다. (없는 경우는 별도의 테스트케이스로 구성 - 첫 요소가 없으면..~)
        - ...

[변경 코드]
- `test_3과7과5를넣었을때_dequeue의반환값이3인지` 
    -> `test_큐에값을3개넣어줄때_dequeue를하면_첫번째값이_제거되고반환된다`

### 배운 키워드
`code coverage`, `Protocol Oriented Programming`, `scheme`, `target`, `bundle`, `associatedtype`


## 트러블 슈팅
- 유닛테스트에서 정확한 검사를 위해 현재 연결 리스트에 쌓여있는 값들을 배열형태로 가져올 수 있도록 currentList 라는 연산 프로퍼티를 만들어 주었습니다. 
- 테스트 시, 타입을 찾을 수 없다는 오류발생, TargetMembership에 테스트파일 체크를 해주니 없어졌습니다![](https://i.imgur.com/2r7w6Ur.png)
- 각 테스트 마다 생성이 되어있던 번들을 하나로 통일 해주었습니다.
