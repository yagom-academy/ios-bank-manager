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
