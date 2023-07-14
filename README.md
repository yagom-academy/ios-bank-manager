# 은행창구 매니저</br>
> 은행에는 n명의 은행원이 근무합니다.</br>
> 은행에는 n명의 고객이 업무처리를 위해 대기합니다.</br>
> 모든 고객의 업무가 끝나면 은행업무를 마갑합니다.</br>
> 업무를 마감할 때 "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총XX명이며, 총 업무시간은 XX초입니다."라고 출력합니다.</br>
> 은행원은 고객의 업무를 처리합니다.</br>
> 각 고객의 업무를 처리하는 데 걸리는 시간은 0.7초입니다.</br>
> 은행원이 한 번에 처리할 수 있는 고객은 한 명입니다.</br>

## 📚 목차</br>
- [팀원소개](#-팀원-소개)
- [타임라인](#-타임라인)
- [실행화면](#-실행화면)
- [트러블 슈팅](#-트러블-슈팅)
- [참고자료](#-참고자료)

## 🧑‍💻 팀원 소개</br>
| <img src="https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="200" height="200"/> | <img src="https://github.com/devKobe24/BranchTest/blob/main/IMG_5424.JPG?raw=true" width="200" height="200"/> |
| :-: | :-: |
| [**Hamg**](https://github.com/hemg2) | [**Kobe**](https://github.com/devKobe24) |

## ⏰ 타임라인</br>
프로젝트 진행 기간 | 23.07.10.(월) ~ 23.07.14.(금)

| 날짜 | 진행 사항 |
| -------- | -------- |
| 23.07.10.(월)     | Node 생성<br/> LinkedList 생성.<br/> final 접근제한자 추가.<br/> |
| 23.07.11.(화)     | LinkedList 구현 진행, Type->T 변경<br/> Queue 타입 구현 및 생성.<br/> BankManagerTests 생성 및 구현<br/>|
| 23.07.12.(수)     | testCase추가, Linked-> count,insert 추가|
| 23.07.14.(금)     | Customer 타입 생성 및 구현.<br/>Banker 타입 생성 및 구현<br/>TimeCheck 메서드 생성 및 구현.<br/>InputError 타입 생성<br/>BankService 타입 생성 및 구현.<br/>    |

## 📺 실행화면
- JuiceMaker 실행 화면 </br>
![](https://github.com/devKobe24/images/blob/main/BankManager.gif?raw=true)

## 🔨 트러블 슈팅 
1️⃣ **링크드리스트와 큐의 구현** </br>
🔒 **문제점** </br>
지난 프로젝트 중 계산기 프로젝트에서 단방향 링크드 리스트를 활용하여 큐를 구현한 경험이 있었습니다.
그러나 계산기 프로젝트에서는 큐 내부에 링크드 리스트를 구현하였었습니다.
제약사항에서는 링크드 리스트를 따로 빼서 구현해야 한다는 점을 알게 되었고, 프로젝트의 목적성을 다시알게 되었습니다.
그 관계성에서 큐와 링크드 리스트를 분리하는 과정 속에서 고민을 많이 했습니다.


🔑 **해결방법** </br>
링크드 리스트 파일을 따로 생성하여 링크드 리스트를 새롭게 구현해주었습니다.
```swift!
struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool { return head == nil }
    var first: T? { return head?.value }
    
    mutating func appendNode(_ value: T) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
            tail = head
            count += 1
        } else {
            tail?.next = newNode
            tail = newNode
            count += 1
        }
    }
    
    mutating func removeFirst() -> T? {
        guard let value = head?.value else { return nil }
        
        head = head?.next
        
        if isEmpty {
            head = nil
            tail = nil
        }
        count -= 1
        
        return value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    mutating func insert(value: T, index: Int) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head = newNode
            if tail == nil {
                tail = newNode
            }
            count += 1
        } else {
            var previousNode = head
            for _ in 1..<index {
                if previousNode?.next == nil { break }
                previousNode = previousNode?.next
            }
            
            newNode.next = previousNode?.next
            previousNode?.next = newNode
            
            if newNode.next == nil {
                tail = newNode
            }
            count += 1
        }
    }
}
```


2️⃣ **XCTest 진행이 안되었던점**</br>
🔒 **문제점 2** </br>
XCTest파일을 만들고 테스트를 진행하려고 했는데 알수없는 에러가 발생하여 문제가 되었습니다.

🔑 **해결방법** </br>
테스트를 하려고 진행시에 알수없는 타입이라 생각을 하게 되었고 Model로 만들었던 `Queue`, `LinkedList`, `Node` 등 모두 `Targer Membership`에서 Tests에 대한 체크를 진행하여 테스트 시에 알수있게 하게끔 진행하였고 Model을 알 수 있었기에 테스트가 진행 되었습니다.


3️⃣ **시간 체크** </br>
🔒 **문제점 3** </br>
고객 수의 0.7배를 곱하여 시간을 구하는 방법으로 시간을 구했습니다.
그러나 그 방법은 정확한 시간을 구하는 방법이 아니라고 생각했습니다.

🔑 **해결방법** </br>
`TimeCheck`라는 메서드를 따로 만들게 되었습니다.
```swift!
public func timeCheck(_ block: () -> Void) -> String {
	let numberFormatter = NumberFormatter()
	numberFormatter.maximumFractionDigits = 2
	numberFormatter.roundingMode = .halfUp
	
	let start = Date()
	
	block()
	
	guard let numberFormatted = numberFormatter.string(for: Date().timeIntervalSince(start))
	else {
		return NumberFormattedReturn.empty
	}
	
	return numberFormatted
}

enum NumberFormattedReturn {
	static let empty = "Empty"
}
```


🤔 **고민했던 점** </br>
DispatchQueue를 사용해야 할 지 혹은 자체적으로 구현한 Queue를 활용해야하는지 고민이 많았습니다.
스텝 핵심 경험과 저희가 만든 Queue의 목적성을 곰곰히 생각해보니 Queue를 활용하는 것이 옳다고 생각하여
자체적으로 구현한 Queue를 사용하게 되었습니다.


## 📑 참고자료
- [📃 Date](https://developer.apple.com/documentation/foundation/date)</br>
- [📃 TimeInterval](https://developer.apple.com/documentation/foundation/timeinterval)</br>
- [📃 DateFormatter](https://developer.apple.com/documentation/foundation/dateformatter)</br>
- [📃 TimeZone](https://developer.apple.com/documentation/foundation/timezone)</br>
- [📃 Calendar](https://developer.apple.com/documentation/foundation/calendar)</br>
- [📃 DateComponents](https://developer.apple.com/documentation/foundation/datecomponents)</br>
- [📃 DispatchQueue의 init](https://developer.apple.com/documentation/dispatch/dispatchqueue/2300059-init)</br>
- [📃 DispatchQoS](https://developer.apple.com/documentation/dispatch/dispatchqos)</br>
- [📃 Prioritize Work with Quality of Service Classes](https://developer.apple.com/library/archive/documentation/Performance/Conceptual/EnergyGuide-iOS/PrioritizeWorkWithQoS.html#//apple_ref/doc/uid/TP40015243-CH39-SW1)</br>
- [📃 async](https://developer.apple.com/documentation/dispatch/dispatchqueue/2016098-async)</br>
- [📃 DispatchGroup](https://developer.apple.com/documentation/dispatch/dispatchgroup)</br>
- [📃 DispatchSemaphore](https://developer.apple.com/documentation/dispatch/dispatchsemaphore)</br>
