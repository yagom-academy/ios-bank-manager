## 🍀 소개
`maxhyunm`와 `kyungmin`이 만든 `은행창구 매니저`입니다. 
> 1. 한 명의 은행원이 10명~30명 사이의 고객의 업무를 처리하는 은행창구 매니저 콘솔앱
>
> 2. 업무가 다른 10명의 고객을 추가해서 업무를 처리하는 은행창구 UI앱

## 목차📌</br>
1. [팀원소개 🧑‍💻](#1.)
2. [타임라인 📆](#2.)
3. [ClassDiagram 🌟](#3.)
4. [File Tree 🗂](#4.)
5. [실행화면 🖥️](#5.)
6. [핵심경험](#6.)
7. [트러블슈팅 🧨](#7.)
8. [참고자료 📚](#8.)
9. [팀 회고](#9.)

</br>

<a id="1."></a>
<br>
## 팀원소개 🧑‍💻
|<Img src="https://cdn.discordapp.com/attachments/1100965172086046891/1108927085713563708/admin.jpeg" width="200">|<img src="https://hackmd.io/_uploads/rk62zRiun.png" width="200"/>|
|:-:|:-:|
|[**kyungmin**](https://github.com/YaRkyungmin)|[**maxhyunm**](https://github.com/maxhyunm)|

<a id="2."></a>
<br>
## 타임라인 📆
<table>
    <tr>
        <td align="center"><b>날짜</b></td>
        <td align="center"><b>작업내용</b></td>
    </tr>
    <tr>
        <td align="center">7/10(월)</td>
        <td>
            ✓ QueueType, CustomerQueue 구현<br/>
            <font size="2">
                : isEmpty(), enqueue(), dequeue(), clear(), peek() 메서드 추가
            </font><br/>
            ✓ Node 구현<br/>
            ✓ MockCustomerQueue 및 Int 테스트 구현</td>
    </tr>
    <tr>
        <td align="center">7/11(화)</td>
        <td>
            ✓ LinkedList 구현하여 Queue 분리<br/>
            <font size="2">
                : isEmpty(), append(), pop(), removeAll(), peek() 메서드 추가
            </font><br/>
            ✓ String 테스트 구현<br/>
            ✓ 테스트 타겟 설정 및 code coverage 오류 수정<br/>
        </td>
    </tr>
    <tr>
        <td align="center">7/12(수)</td>
        <td>
            ✓ Node의 Element에 Equatable 추가<br/>
            ✓ isEmpty() 연산 프로퍼티로 변경<br/>
            ✓ Customer, Bank, Menu, BankManager 타입 구현<br/>
            ✓ Bank 기능 구현<br/>
            ✓ Namespace, Configuration 분리<br/>
            <font size="2">
                : BankNamespace, BankConfiguration, CustomerConfiguration 타입 생성
            </font><br/>
        </td>
    </tr>
    <tr>
        <td align="center">7/13(목)</td>
        <td>
            ✓ Namespace, Configuration Nested 처리<br/>
        </td>
    </tr>
    <tr>
        <td align="center">7/14(금)</td>
        <td>
            ✓ Bank.Work 타입 추가<br/>
            ✓ 업무 종류에 따라 은행원 Queue 분리<br/>
            ✓ <b>README 작성</b>
        </td>
    </tr>
    <tr>
        <td align="center">7/17(월)</td>
        <td>
            ✓ Customer의 purpose와 duration을 Raw타입으로 수정<br/>
            ✓ Thread.sleep() 추가하여 duration 측정 방식 변경
        </td>
    </tr>
    <tr>
        <td align="center">7/20(목)</td>
        <td>
            ✓ 파일 그룹 분리<br/>
            ✓ BankViewController 생성 및 UI 구현<br/>
            ✓ CustomerView 타입 추가<br/>
            ✓ Bank와 BankViewController를 Delegate 패턴으로 연결<br/>
            ✓ 타이머 구현<br/>
            ✓ UI용 Namespace 분리<br/>
        </td>
    </tr>
    <tr>
        <td align="center">7/21(금)</td>
        <td>
            ✓ 접근제한 수정<br/>
            ✓ <b>README 작성</b>
        </td>
    </tr>
</table>

<a id="3."></a>
<br>
## ClassDiagram 🌟
<img src="https://hackmd.io/_uploads/HyqHsDw9h.png" width="1000">

<a id="4."></a>
<br>
## File Tree 🗂
    ├── BankManagerConsoleApp
    │   ├── BankManagerConsoleApp
    │   │   ├── Bank
    │   │   │   ├── Bank.swift
    │   │   │   ├── BankManager.swift
    │   │   │   └── Menu.swift
    │   │   ├── Customer
    │   │   │   └── Customer.swift
    │   │   ├── LinkedList
    │   │   │   ├── LinkedList.swift
    │   │   │   └── Node.swift
    │   │   ├── Queue
    │   │   │   ├── CustomerQueue.swift
    │   │   │   └── QueueType.swift
    │   │   └── main.swift
    │   └── BankManagerConsoleTest
    │       ├── BankManagerConsoleIntTest.swift
    │       ├── BankManagerConsoleStringTest.swift
    │       └── MockCustomerQueue.swift
    └── README.md

<a id="5."></a>
<br>
## 실행화면 🖥️
1️⃣ **콘솔앱**</br>
<img src="https://hackmd.io/_uploads/SkDH-dDq2.gif" width="500">
<br/>

2️⃣ **UI앱**</br>
<img src="https://hackmd.io/_uploads/HkzwlODqn.gif" width="200">

<a id="6."></a>
## 핵심경험
#### 🌟 Test를 위한 Mock 타입 활용
CustomerQueue 내부 프로퍼티의 접근제어가 private인 상태로 Test를 진행하기 위해 QueueType Protocol을 생성하여 Mock 타입을 생성하였습니다.
#### 🌟 OperationQueue를 활용한 비동기 처리
OperationQueue의 maxConcurrentOperationCount 프로퍼티를 통해 필요한 만큼 스레드 개수를 설정하여 비동기 처리를 진행하였습니다.
#### 🌟 TimeInterval 활용
UI앱의 업무시간 타이머를 생성하기 위하여 TimeInterval과 Date()를 활용하였습니다.
#### 🌟 Nested Enum 활용
매직리터럴과 매직넘버를 제거하기 위하여 각 타입별로 내부에 Namespace, Configuration과 같은 Nested Enum을 생성하였습니다.
#### 🌟 String Format Specifiers 활용
변수가 포함된 출력문 String을 관리하기 위해 String Format Specifiers를 활용하여 유연한 처리가 가능하도록 했습니다.

<a id="7."></a>
## 트러블슈팅 🧨
### 1️⃣ **delegate**패턴을 적용하여 대기중인 고객과 처리중인 고객 분리
🚨 처음에는 `OperationQueue` 자체에 접근하여 해당 내용을 처리하려고 생각했습니다. `OperationQueue`에는 다음과 같은 프로퍼티가 있고, 각각 `KVO`로 업데이트 알림을 받을 수 있습니다.
- `operationCount` : 큐에 추가된 모든 작업의 수
- `operations` : 큐에 추가된 작업 리스트(각 작업별로 상태값 등 확인 가능)

하지만 위의 두 항목은 모두 `deprecated` 예정으로 되어 있어, 이 내용을 활용하는 것은 그다지 좋은 방법이 아닌 것 같았습니다. 또한 각 작업의 상세 내용(고객번호와 작업내용)을 가져오도록 만드는 부분에서도 어려움이 있었습니다.

💡 콘솔앱의 `print`문이 출력되는 시점에 대신 `UI`단의 대기/작업중 상태를 변경해주면 되겠다는 결론을 내렸습니다.
해당 내용을 처리하기 위해서는 `UI`가 업데이트되어야 하는 타이밍에 `Notification`을 발생시키거나, `delegate`를 통해 적절한 처리를 진행해야 했습니다. 여기서는 발생하는 이벤트를 오로지 한 곳에서만 받아 처리하면 되기 때문에 전체 알림을 발송하는 `NotificationCenter`보다는 `delegate` 패턴이 알맞을 것 같다고 판단하여, 후자로 진행하였습니다.
```swift
private func addTask(_ customer: Customer) {
    let task = BlockOperation {
        self.delegate?.moveCustomerToProcessQueue(customer)
        Thread.sleep(forTimeInterval: customer.duration)
        self.delegate?.popProcessingQueue(customer)
    }
    ...
}
```
### 2️⃣ **UI 관련 코드 main 스레드에서 실행**
🚨 `delegate`나 `NotificationCenter`를 활용하면 `UI`를 변경하는 시점은 정확히 정할 수 있지만 한가지 문제가 있었습니다. `UI` 관련 내용은 `main` 스레드에서만 실행이 되어야 하는데, `OperationQueue` 작업 중에 해당 부분이 호출되면서 `main` 스레드가 아닌 곳에서 `UI`에 접근하는 형태가 된 것입니다. 때문에 컴파일러가 빌드를 진행하지 못하였습니다.

💡 이 문제를 해결하기 위해 `UI`를 그리는 작업을 `OperationQueue.main`에 따로 `addOperation`을 통해 추가해주는 방식으로 진행하여 문제를 해결하였습니다.
```swift
OperationQueue.main.addOperation {
    ...
    self.waitingStackView.addArrangedSubview(customerView)
    ...
}
```

### 3️⃣ **Queue 처리가 완료되기 전에 실시간 UI 구현**
🚨 처음에는 `OperationQueue`의 처리가 완료되기 전에는 `CustomerView`에 담긴 내용이 보이지 않았습니다. 데이터는 제대로 전달되지만, UI에 그리는 작업 자체가 실시간으로 진행되지 않는 것으로 보였습니다.</br>
<img src="https://hackmd.io/_uploads/Syo3LE852.png" width="200">

어째서 비동기 큐를 쓰는데 작업을 기다리는지, `Task/await`을 써야 하는지 다양한 고민을 하다가 아래 코드를 발견했습니다. STEP 3에서 모든 일과가 마무리된 후 마감 메시지를 출력하기 위해 추가했던 부분이었습니다.

```swift
depositBankerQueue.waitUntilAllOperationsAreFinished()
loanBankerQueue.waitUntilAllOperationsAreFinished()
```

💡 `waitUntilAllOperationsAreFinished()` 메서드는 큐의 모든 작업이 끝날 때까지 다음 작업을 대기합니다. 해당 부분을 삭제하자 `UI`가 정상적으로 그려지는 것을 확인할 수 있었습니다.</br>
<img src="https://hackmd.io/_uploads/Hk8DeOIq2.png" width="200">



### 4️⃣ **알맞은 CustomerView를 waitingStackView에서 processingStackView로 이동**
🚨 `StackView`에 추가된 `CustomerView`를 상태값에 따라 이동/삭제해주는 과정에서, 각 `StackView`의 `subview`들을 하나씩 훑으며 작업을 진행하게 되면 반복문이 너무 많아 비효율적이라는 생각이 들었습니다. 

💡 각 `View`에 `identifier`나 `key`값을 부여할 수 있는 방법이 있을지 고민하다가, `Dictionary`를 활용하는 방식을 선택하였습니다.
```swift
private var waitingDictionary: Dictionary<Customer, CustomerView> = [:]
private var processingDictionary: Dictionary<Customer, CustomerView> = [:]
```
이렇게 하면 `customer` 정보만 있어도 고객 상태값을 정확히 이동시킬 수 있고, 또 각 스택뷰가 비어있는지 여부를 확인할 때도 유용하다고 생각했습니다.(스택뷰가 모두 비어있는지를 확인하는 내용은 타이머를 일시정지시킬 때 활용하였습니다. - 대기/업무 스택이 모두 비어있으면 정지)
```swift
if self.processingDictionary.isEmpty && self.waitingDictionary.isEmpty {
    self.pauseTimer()
}
```

### 5️⃣ **UI가 그려지기 전에 완료된 Task 처리**
🚨 간혹 대기에서 업무로 넘어가지 않는 고객들이 있어 확인해보니, 대기중 `StackView`에 해당 고객 정보를 추가하는 작업이 `main` 스레드에서 진행되고 있을 때 `Bank`의 `OperationQueue`(별도의 스레드에서 작업)에서 이미 `Task`가 실행/종료되어 대기->업무로 넘어가는 작업을 정상적으로 거치지 못하는 것으로 보였습니다.
|<img src="https://hackmd.io/_uploads/rJZol_Lc2.png" width="200">|<img src="https://hackmd.io/_uploads/r1WslOIq3.png" width="200">|
|-|-|

💡 이를 해결하기 위해 대기중인 고객을 업무중으로 변경하는 `moveCustomerToProcessQueue()` 메서드에 아래와 같은 내용을 추가하였습니다.
```swift
if waitingDictionary[customer] == nil {
    OperationQueue.main.waitUntilAllOperationsAreFinished()
}
```
이를 통해 대기->업무로 넘기는 작업을 진행하라는 요청이 넘어왔을 때 해당 고객이 대기중 `Dictionary`에 존재하지 않는다면 일단 `main` 스레드의 작업이 모두 끝날 때까지 대기한 후 다시 찾아볼 수 있도록 하였습니다.


### 6️⃣ **StackView의 정렬**
🚨 대기/업무중인 고객의 `CustomerView`가 제대로 상단에 정렬되지 못하고 세로 길이가 멋대로 늘어나는 등 문제가 발생하였습니다.
<img src="https://hackmd.io/_uploads/HJesW_L92.png" width="200">

처음에는 대기/업무 `StackView` 내부 요소에 `setContentHuggingPriority`를 낮게 설정한 `emptyLabel`을 추가하여 조절해보았습니다. 하지만 그렇게 하니 매번 `Task`가 진행될 때마다 `emptyLabel`을 `SuperView`에서 제거한 후 마지막에 다시 추가하는 작업을 거쳐야 해서 번거로웠습니다.
```swift
OperationQueue.main.addOperation {
    customerView.removeFromSuperview()
    self.waitingDictionary[customer] = nil
    self.emptyProcessingView.removeFromSuperview()
    self.processingStackView.addArrangedSubview(customerView)
    self.processingDictionary[customer] = customerView
    self.processingStackView.addArrangedSubview(self.emptyProcessingView)
}
```

💡 해당 부분은 두 개의 `StackView`를 담는 `Horizontal StackView`에서 `alignment`를 `top`으로 조절하여 해결하였습니다.
```swift
stackView.alignment = .top
```

---
<a id="8."></a>
## 참고자료 📚
- [🐻야곰 닷넷: 동시성 프로그래밍](https://yagom.net/courses/동시성-프로그래밍-concurrency-programming/)
- [🍎Apple Docs: Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [🍎Apple Docs: Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols)
- [🍎Apple Docs: String Format Specifiers](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html)


---
<a id="9."></a>
## 팀 회고
[일일 스크럼](https://github.com/maxhyunm/ios-bank-manager/wiki/🌻일일-스크럼)
