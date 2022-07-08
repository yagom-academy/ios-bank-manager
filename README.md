# 은행창구 프로젝트 

## 소개
- 고객의 은행 업무를 처리하고 알려주는 애플리케이션이다.
- 이 애플리케이션에서는 큐와 동시성 프로그래밍에 대해  자세히 알아볼 수 있다.

## 팀원

|예톤|웡빙|
|:--:|:--:|
|<img src = "https://user-images.githubusercontent.com/99063327/174224341-9ba4e42e-3ff2-4c58-b910-1d0b8d4d87f1.png" width = "50%" height = "50%"> | <img src = "https://user-images.githubusercontent.com/98514397/176106991-e29be177-758d-400a-9f47-9022eaa260fa.png" width = "50%" height = "50%"> |
|[github-yeeton37](https://github.com/yeeton37)|[github-wongbingg](https://github.com/wongbingg)|


## PR 내용
- [STEP 1](https://github.com/yagom-academy/ios-bank-manager/pull/187)
- [STEP 2](https://github.com/yagom-academy/ios-bank-manager/pull/198)
- [STEP 3](https://github.com/yagom-academy/ios-bank-manager/pull/208)
## UML

<img width="762" alt="스크린샷 2022-07-01 오후 3 36 55" src="https://user-images.githubusercontent.com/98514397/176838333-5b21092e-575a-4f45-b695-af374616a94a.png">

### Timeline

<details>
<summary>1주차</summary>
<div markdown="1">

- 월
`그라운드 룰 작성`, `연결리스트 구현`, `연결리스트에 대한 이해`, `CommandLineTool에서 UnitTest작성`
- 화 
 `Unit테스트코드 추가`  `step1 PR제출 ` `README 업데이트`
- 수
 `step2 이해를 위한 UML작성`, `step2 UML기반으로 코드 작성`
- 목
 `코멘트 토대로 step1 리팩토링`, `queue`에 `initializer` 메서드 추가
- 금
 `UML 수정`, `step2 PR 제출`

</div>
</details>

<details>
<summary>2주차</summary>
<div markdown="1">

- 월
`Business 타입 구현`, `업무별 큐 생성` 
- 화 
 `NameSpace, Error 추가`  `README 업데이트`
- 수
 `step3 PR제출`
- 목
 `step4 각자 구현해보기`, `동시성 프로그래밍 공부`
- 금
 `README 업데이트`, `LLDB를 통해 스레드 확인`

</div>
</details>

### **참고한 문서**
- [Command Line Tool에서 Unit Test하기](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-프로젝트에서-유닛-테스트-하기)
- [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Final](https://velog.io/@ryan-son/Swift-final-키워드-왜-사용하는걸까)
- [LinkedList](https://atelier-chez-moi.tistory.com/90)
- [AssociatedType](https://hyunsikwon.github.io/swift/Swift-AssociatedType)
- [Protocol Oriented Programming](https://www.pluralsight.com/guides/protocol-oriented-programming-in-swift)
- [Thread.sleep](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [구조체 내부에 참조가 있을 경우](https://developer.apple.com/videos/play/wwdc2016/416/?time=893)
- [클로저의 캡쳐리스트](https://babbab2.tistory.com/83)
## 규칙
<details>
<summary> 시간 </summary>
<div markdown="1">
  
    

[프로젝트에 집중하는 시간]
- 10: 00 - 22: 00

[연락이 어려운 시간]
- 없음

[휴일]
- 예톤 : 주말
- 웡빙 : 주말

</div>
</details>

## 그 외 
<details>
<summary> 커밋 </summary>
<div markdown="1">
    
- 최소기능 단위 commit
- 카르마 스타일 따르기 ( 한글로 작성 )
- feat = 주로 사용자에게 새로운 기능이 추가되는 경우
- fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- docs = 문서에 변경 사항이 있는 경우
- style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- test = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
    
</div>
</details>

<details>
<summary> 컨벤션 </summary>
<div markdown="1">
    
- Swift API Design Guidelines
- Swift Language Guide
- ios - Human Interface Guidelines
    
</div>
</details>

<details>
<summary> 커뮤니케이션 </summary>
<div markdown="1">
    
- 디스코드 회의실
- 디스코드 다이렉트 메시지
    
</div>
</details>



# Step 1


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
<details>
<summary> 자세히 </summary>
<div markdown="1">
    
### 1. 연결리스트의 종류
- 이번 step2까지의 기능 명세서를 보았을 때는 리스트 중간에 데이터가 추가될 일이 없어보였고, 또 tail 변수를 만들어주어야 할 필요성을 느끼지 못해서 양방향 연결리스트가 아닌 단방향 연결리스트로 구현해주었습니다. 추후 확장성도 고려해봤을 때 양방향 연결리스트로 구현하는 것이 좋았을지 궁금합니다.

[라이언의 코멘트]

> 이런 경우 개발자들 사이에서도 의견이 나뉠 수 있는데, 개인적으로는 향후 반드시 사용되는 기능이 아니라면 구현하지 않는 방향이 좋다고 생각합니다. 좋게 표현하면 확장성, 나쁘게 표현하면 오버엔지니어링이니까요. 사용되지 않는 인터페이스를 유지할 필요는 없을 것이고, 필요하다면 해당 시기에 기능을 확장해나가면 되지 않을까요? 개발자는 불필요하다고 판단된다면 여러분처럼 과감하게 구현하지 않는 결단력도 있어야 한다고 생각합니다.

- 라이언의 코멘트에 따라 insert 작업이나 검색 작업이 필요할 경우 그때 연결리스트의 기능을 확장해주는 것을 선택하기로 했습니다. 따라서 이전과 같이 단방향 연결리스트로 구현해주었습니다.

### 2. Queue와 LinkedList의 차이점
- 큐와 연결리스트의 기능이 같아보이는데 따로 연결리스트와 큐 타입을 만들어서 큐에서 연결리스트의 기능을 가져와서 사용하는 것이 이해가 가지 않았습니다. 그냥 큐에서 바로 연결리스트의 기능을 구현해주면 되지 않나? 라고 생각했었습니다.
    -  찾아보니 큐는 구현 방법이 정의되어 있지 않은 자료형이고 연결리스트는 다음 데이터의 위치를 저장하는 방식인 자료구조기 때문에 따로 구현해줘야 함을 알게되었습니다! 저희가 생각한 것이 맞는지 궁금합니다.

[라이언의 코멘트]
> 물론 그렇게 구현해도 됩니다. 하지만 지금은 기능 명세에서 지정이 되어있으니 최대한 방향에 맞추어 구현해보는 것에 의의가 있다고 생각해요. 이렇게 구현했을 때의 장점은 여러분이 말씀하신 것처럼 큐를 구현하는 방법 (알고리즘)이 여러가지 존재하기 때문에 큐를 구성하는 알고리즘을 단위 테스트를 통해 검증할 수 있다는 것, 그리고 상황에 따라 더 높은 성능을 가지는 알고리즘으로 구현된 타입을 변경하며 사용할 수 있다는 장점이 있겠네요.

### 3. 구조체 내부에서 클래스 인스턴스를 생성하기
- CustomerQueue를 구조체로 만들어 주었는데, 안에 쓰이는 Node 인스턴스는 클래스(참조타입) 입니다. 이렇게 만들어줄 경우 CustomerQueue도 결국 참조타입이 되는 것인지 궁금합니다.

[라이언의 코멘트]
> 내부 프로퍼티 타입의 성질에 따라 그것을 가진 타입의 성질이 결정되지는 않습니다. 하지만 값 타입이 참조타입을 가질 경우 값 타입이 복사될 때마다 값 타입 내부의 참조 타입 인스턴스가 불필요하게 복사되는 경우가 발생할 수 있습니다.

[참고 링크](https://developer.apple.com/videos/play/wwdc2016/416/?time=893)
</div>
</details>




# Step 2

### 1. 작업내용
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
    
### 2. 스텝 핵심 경험
- [x] Protocol Oriented Programming으로 `CustomerQueue`를 구현
- [x] Queue의 활용
- [x] 타입 추상화 및 일반화
- [x] 유닛 테스트의 번들 Target과 Scheme 

### 3. 고민한 점
<details>
<summary> 자세히 </summary>
<div markdown="1">
    
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
</div>
</details>


### 4. 배운 키워드
`code coverage`, `Protocol Oriented Programming`, `scheme`, `target`, `bundle`, `associatedtype`


### 5. Trouble Shooting
- 유닛테스트에서 정확한 검사를 위해 현재 연결 리스트에 쌓여있는 값들을 배열형태로 가져올 수 있도록 currentList 라는 연산 프로퍼티를 만들어 주었습니다. 
- 테스트 시, 타입을 찾을 수 없다는 오류발생, TargetMembership에 테스트파일 체크를 해주니 없어졌습니다![](https://i.imgur.com/2r7w6Ur.png)
- 각 테스트 마다 생성이 되어있던 번들을 하나로 통일 해주었습니다. 

### 6. 질문사항

- 메서드가 하나의 기능만 하도록 하기 위해서 기능을 분리하다 보니 
```swift
 mutating private func updateCustomerQueue() {
        randomNumber = Int.random(in: 10...30)
        let numberList = Array<Int>(1...randomNumber)
        
        numberList.forEach {
            let customer = Customer(number: $0)
            queue.enqueue(data: customer)
        }
     
     // handleCustomer()
    }
```
- 위의 코드와 같이 `updateCustomerQueue` 메서드 내부에서 hanleCustomer 메서드를 실행해주는 것은 기능 분리가 제대로 되지 않은 것이라 생각했습니다.
- 그래서 위처럼 작성해주는 대신 따로 `start` 메서드를 만들어 while문 안에서 조건이 맞을 경우 위의 두 메서드가 반복되도록 작성해주었습니다. 

- 그래서 함수의 중첩을 피하기 위해서 실제로 구현해준 메서드는 아래와 같습니다.
```swift
mutating func start() {
        while true {
            displayMenu()
            let selectedMenu = selectMenu()
            
            if selectedMenu == "1" {
                updateCustomerQueue()
                handleCustomer()
                displayEndMessage()
            } else if selectedMenu == "2" {
                break
            } else {
                print("잘못 입력했습니다.")
            }
        }
    }
```

하나의 함수에 하나의 기능만 하도록 해주기 위해서 최대한 중첩함수를 지양하고 위와 같이 작성해주었는데 이렇게 하는 방법이 맞는 건지 라이언에게 여쭤보고 싶습니다.
    

## Step3 

### 1. 작업 내용
- CustomerQueue에 쌓여있는 손님들을 한명씩 빼서 각 손님마다 원하는 업무에 맞게 해당 업무 줄로 보내주었습니다.
- 각각의 업무 줄은 CustomDispatchQueue로 만들어 주었습니다.
- 대출담당 큐에서는 접근가능 스레드 수의 제한을 1로 설정 해주었습니다.
- 예금담당 큐에서는 접근가능 스레드 수의 제한을 2로 설정 해주었습니다.
---
- Business Enum 타입 선언
    - loan
        - name
        - processTime
    - deposit
        - name
        - processTime
- Business 별 CustomDispatchQueue 상수 생성 
    - loanBusinessQueue
    - depositBusinessQueue 

- Business 별 DispatchWorkItem 생성
    - `makeWorkItem()` 메서드 이용
    - loanWorkItem
    - depositWorkItem
- 작업시간 측정 
    - CFAbsoluteTimeGetCurrent() 를 이용하여 handleCustomer 메서드의 시작과 끝에 선언해주어 메서드 실행 시간을 측정 해주었습니다.

### 2. 스텝 핵심 경험

- [x] 동시성 프로그래밍 개념의 이해
- [x] 동시성 프로그래밍을 위한 기반기술(GCD, Operation) 등의 이해
- [x] 스레드(Thread) 개념에 대한 이해
- [x] GCD를 활용한 동시성 프로그래밍 구현
- [x] 동기(Synchronous)와 비동기(Asynchronous) 동작의 구현 및 적용

### 3. 고민한 점
<details>
<summary> 자세히 </summary>
<div markdown="1">

1. 이번 프로젝트의 조건이 은행원 3명이 동시에 업무를 하기 때문에 큐와 스레드를 어떻게 적절하게 분배해줄지에 대해서 고민했습니다. 첫 번째 생각한 방법은 큐를 1개로 설정해주고 큐에서 스레드 3개로 보내는 것을 은행원 3명이라고 보는 방법이었고, 두 번째는 큐를 2개로 설정해서 하나의 큐는 loan 업무를 하고 하나의 큐는 deposit 업무를 하도록 나누어주는 방법이었고, 세 번째는 큐를 3개로 설정해서 각 큐를 은행원이라고 보는 방법이었습니다.
    - 이 중에서 저희는 큐를 예금 업무를 하는 큐, 대출 업무를 하는 큐 두개로 나누어주어 예금 업무를 하는 큐는 semaphore value를 2로 지정해주어 공유자원에 접근하는 스레드가 2개가 되도록 해주었습니다. 마찬가지로 대출 업무를 하는 큐는 semaphore value를 1로 지정해주어 공유자원에 접근하는 스레드가 1개가 되도록 해주었습니다.
    - 아래 그림과 같이 큐와 스레드의 구조를 작성해봤는데 잘 작성한 것인지 라이언에게 여쭤보고 싶습니다.
    
 ![image](https://user-images.githubusercontent.com/98514397/177487869-9b899ec7-2e62-4801-83df-6561e8bcdc6a.jpeg)
     
- 추후 리팩토링 후 수정 예정
</div>
</details>

### 4. Trouble Shooting
- end message가 출력되는 위치에 대한 오류
- 맨 처음에 group을 사용하지 않고 출력을 했더니 아래와 같은 오류가 발생
    
[오류 발생한 콘솔창]
<img width="663" alt="스크린샷 2022-07-06 오후 4 03 34" src="https://user-images.githubusercontent.com/98514397/177489752-91345ea6-fbe4-4d26-847a-4abca3d3942f.png">

- 큐의 작업들이 모두 끝난 뒤에 업무 그룹으로 묶인 작업들이 언제끝나는지에 대해 시점을 알고, 그 이후에 end message를 `group.wait()`을 사용해주었습니다.
- 결론적으로 아래와 같이 정상적으로 end message가 출력되는 것을 확인할 수 있었습니다.

<img width="638" alt="스크린샷 2022-07-06 오후 4 08 23" src="https://user-images.githubusercontent.com/98514397/177490554-dd3c5182-aa6c-4084-ac39-0495b710ff2e.png">

### 5. 배운 키워드
`CFAbsoluteTimeGetCurrent`, `DispatchGroup`, `DispatchSemaphore`, `DispatchWorkItem`, `CaptureList`
