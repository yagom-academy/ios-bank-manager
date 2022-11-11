# README - 은행창구 매니저 프로젝트

---
### 목차
1. [개요](#1-개요)
2. [타임라인](#2-타임라인)
3. [시각화된 프로젝트 구조](#3-시각화된-프로젝트-구조)
4. [실행화면](#4-실행화면)
5. [고민한 점](#5-고민한-점)
6. [참고 링크](#6-참고링크)

---
## 1. 개요
### 🏦 은행창구 매니저 프로젝트
<img src="https://i.imgur.com/6wgWpc3.png" width="100%"/>


### 은행창구의 고객 접수 처리를 비동기방식으로 처리합니다.
### GCD기술을 적용하여 동시성프로그래밍을 구현하였습니다.

### 👯 팀원 
|[jeremy](https://github.com/yjjem)| [L J](https://github.com/lj-7-77) |
|:-:|:-:|


---
## 2. 타임라인

| 날짜 | 내용 |
| -------- | -------- |
| 22.10.31     | - UML 초안 작성 </br>- Linked-list 자료구조 이해, Generics 공식문서</br>- Node타입 구현 |
| 22.11.01     | - Queue타입 구현, Unit Test를 통한 검증     |
| 22.11.02     | - STEP 1 PR     |
| 22.11.03    | - 프로토콜, 익스텐션 구현 </br> - 콘솔창 메뉴 출력 구현 |
| 22.11.04    | - STEP 2 PR     |
| 22.11.07    | - Operation을 이용한 구현     |
| 22.11.08    | - Dispatch을 이용한 구현으로 수정</br> - 예금, 대출 구분용 Task 열거형 추가</br> - 불필요한 파일 삭제 |
| 22.11.10    | - 리팩토링(코드컨벤션, 접근제어자) </br>- STEP 3 PR |

---

## 3. 시각화된 프로젝트 구조

### 📁 디렉토리 구조 
```
BankManagerConsoleApp
├── main.swift
├── Bank.swift
├── BankManagers.swift
├── CustomerQueue.swift
├── MenuSelection.swift
├── Node.swift
├── Task.swift
├── Protocols
│   ├── Displayable.swift
│   ├── Runnable.swift
│   └── SelectableMenu.swift
└── Extension
    ├── Displayable + displayMenu.swift
    ├── Double + formatted.swift
    ├── Runnable + runBankManagerConsoleApp.swift
    └── SelectableMenu + getInput.swift

```


### 🧩 UML

| Step2 UML (deprecated) |
| -------- |
|<img src="https://i.imgur.com/dFuwDLM.jpg"/>|

| Step3 UML (current) |
|---|
|<img src="https://i.imgur.com/ClRdKuK.jpg"/>|

---

## 4. 실행화면

|콘솔 실행|
|---|
|<img src="https://i.imgur.com/wytX3YN.gif" width="800"/>|

---
## 5. 고민한 점
<details>
<summary style="font-size: 24px">🔸 Unit test ) 두 가지 결과를 한번에 확인하는 경우도 있는지</summary>
<div markdown="1">
    
`BankManagerConsoleAppTest.swift` 테스트 파일의 `test_clear가_큐를_비우는지_확인()` 메서드에서 `front`와 `rear`가 모두 `nil`로 바뀌는지 `XCTAssertEqual`을 두번 호출하여 확인했다.
이 경우 `given`과 `when`단계 코드가 동일하고 `XCTAssertNil`로 `front`와 `rear`값만 각각 확인하면 되었기 때문에 하나의 테스트에서 두 가지를 확인했다.
➡️ 같은 동작이라면 하나의 테스트에서 여러가지 확인 가능하다. 다만 더 자세히 작성하면 좋다.

</div>
</details>

<details>
<summary style="font-size: 24px">🔸 Unit Test ) @testable import 오류</summary>
<div markdown="1">

`서론`
이전에 Unit Test를 작성할 시 없던 문제가 이번 프로젝트를 작성하면서 발생했다.

`문제`
|<center>No such module</center>|
|-|
|![](https://i.imgur.com/VkJNXeR.png)|
- @testable import를 할 시`No such module`이라는 에러가 발생하여 Unit Test를 작성하고 실행하는데 어려움이 있었다.
- 여러가지 해결방법이 있는 것 같았지만 명확한 답은 아니었다.
[블로그](https://yeniful.tistory.com/28), [StackOverflow](https://stackoverflow.com/questions/29500227/getting-error-no-such-module-using-xcode-but-the-framework-is-there)

`문제해결 시도`
|<center>Target Memebership 선택 화면</center>|
|-----------------------|
|![](https://i.imgur.com/vmT5pfY.png)|

이를 해결하기 위해 `@testable import`을 사용하지 않고 테스트할 파일 그리고 연관된 파일들의 설정에서 직접 `Target`을 지정을 해주어야 했다. 이런 식으로 파일을 하나 하나 `Target`을 지정을 해주어야한다면 프로젝트 단위가 커질시 문제가 될 것 같다는 생각도 들었다.

`결론`
Console 앱이라 그렇다. XCode의 유닛 테스트는 GUI 환경(Cocoa 또는 Cocoa Touch 의 환경)에서만 동작하기 때문에 테스트 타겟을 추가할 수 없다.

</div>
</details>

<details>
<summary style="font-size: 24px">🔸 Unit Test ) 테스트 불가능한 메서드</summary>
<div markdown="1">

`서론`
아래의 메서드는 WorkLoadManager 내부의 유일한 internal 메서드이다. 

`문제`
return하는 값이 따로 없어 print문 대신에 throw하는 것이 아닌 이상 테스트할 수 있는 방법이 없다.

**private 지정 메서드:**
- `searchForAvailableManager()`
- `getNextTask()`
- `giveTask(number:, task`

</br>

```swift
// WorkLoadManager
mutating func giveWorkToAvailableManager() {
    guard let available = searchForAvailableManager(),
          let task = getNextTask() else {
        print("no available manager")
        return
    }
    giveTask(number: available, task: task)
}
```

</br>

`의문`
 - 이렇게 마땅히 테스트할 수 있는 방법이 없을 때 다른 대안이 있는지 찾아봐야겠다.
 - 여러 private 메서드들이 해당 `giveWorkToAvailableManager()`를 이루고 있을 때 이 메서드들도 테스트를 해주어야할지 알아봐야겠다.

</div>
</details>


<details>
<summary style="font-size: 24px">🔸 메서드 분리할 때 전역변수 선언하지 않고 값을 공유할 방법</summary>
<div markdown="1">

`서론`
`Bank` 구조체에서 임의로 생성된 10~30사이의 난수인 `workCount`변수는 여러메서드에서 쓰인다.

`letCustomersIn` 메서드에서 반환값으로 전달하여 공유할 수 있으나
`letCustomersIn` 에서 반환값을 표시하고 읽어보면, 고객이 입장하는 메서드에서 작업량을 반환하는것이 의미상 어색해보인다.
</br>
```swift
private mutating func letCustomersIn() -> workCount {...}
```
</br>
openBank 메서드에서는 `closeBank` 메서드를 호출할 때,
`letCustomersIn` 메서드에서는 난수만큼의 노드`data`가 `enqueue`되어야하고,
`closeBank` 메서드에서는 고객 몇명을 처리했는지 출력문에 표시할 때 필요하다.

`의문`
이런 경우 필요에따라 `Bank`구조체의 전역변수로 선언해주기도 하는지 고민했다.

---
#### 🔸 bankManaers는 누가 소유해야 하는가: `Bank` vs `WorkLoadManager`
```swift
var bankManagers: [BankManager]  = [BankManager()]
```
</br>

`서론`
추상화 단계에서 Bank가 `bankManagers`를 소유하고 그것들을 `WorkLoadManager`가 관리하는 객체라고 생각을해 Bank의 내부에 구현을 했었습니다.

`발생한 문제점` ***bankManagers를 파라매터로 받아야 하는 번거로움, inout, immutable***
Bank내부에 있으면 WorkLoadManager가 해당 배열의 각각의 요소에 접근하여 수정하기 위해서는 `inout`을 사용해야 했습니다. `for문`으로 각 배열의 요소에 접근하면 해당 `[ i ]` 요소는 immutable하기에 `inout`조차 소용이 없는 점이 문제였습니다.

`해결`
해당 문제를 해결하기 위해 아래의 예제의 메서드를 같이 `for문`을 통해서 배열의 요소에 직접 접근하지 않고 index값을 받아오는 방식을 선택하고 `WorkLoadManger`가 태스크와 매니저 모두 관리하도록 했습니다.

</br>

```swift!
// WorkLoadManager
private func searchForAvailableManager() -> Int? {
	let managersCountRange = Array<Int>(0...(bankManagers.count - 1))
	let number = managersCountRange.first(
	    where: {
	    bankManagers[$0].isAvailable
	
	return number
}
```

</br>

> 처음에는 for문에 `if`문을 붙여 사용을 했었는데 `first(where:)`를 사용해 볼 수 있어 좋은 경험이었다.

`결론`
`WorkLoadManager`가 Bank의 최종 관리자라고 생각을 하고 `bankManager`를 소유하게 한다면 여러모로 이점이 많다. 결론적으로 `WorkLoadManager`가 소유하는게 맞는 것 같다.

</div>
</details>

<details>
<summary style="font-size: 24px">🔸 은행원의 근무가능 여부를 나타내는 메서드 호출 위치 </summary>
<div markdown="1">

`서론`
`toggleAvailability`메서드의 역할은 업무시작할 때는 근무가능상태를 나타내는 `isAvailable`프로퍼티의 값이`true`이고, 고객업무 처리할 때는 `false`로 바뀐다. 업무처리 후에는 다시 `true`가 된다.

`문제`
일을 분배하는 `giveTask`메서드에서 호출할지, 실제로 일을 하는 `work`메서드에서 호출할 지 고민되었다.
`isAvailable`프로퍼티의 값이 쓰이는 곳을 기준으로 생각하면 일을 분배하는 `giveTask`메서드에서 호출하는것이 맞는데,
근무가능상태의 주체는 은행원인것을 생각하면 `work`메서드에서 호출하는것이 맞다.

`의문`
 근무가능상태가 필요한 상황은 일을 분배할 때 필요한 값이기 때문에 `giveTask`메서드에서 호출하였다.

</div>
</details>

<details>
<summary style="font-size: 24px"> 🔸 OperationQueue.waitUntillAllOperationsAreFinished() </summary>
<div markdown="1">

`문제` 
- 아래의 예제처럼 `WorkLoadManager`안의 메서드가 `immutable` 값을 캡쳐하는 문제가 있어 `Class`로 구현을 했었습니다.

`해결, 하지만` 
- 이 문제는 `dequeue`받는 값을 `mutable`한 `tuple`로 바꾸면서 해결되었습니다. 
- 하지만 `Struct`로 되돌리지 않고 `Class`로 사용하는 바람에 `depositQueue`와 `creditQueue`가 `sync`처럼 이전작업이 끝나기를 기다린 후 작동하는 문제가 있어 `waitUntillAllOperationsAreFinished()`는 각 큐를 `sync`처럼 작동하게 하는 것이라고 오해를 했었습니다.

`결론`
`.waitUntillAllOperationsAreFinished()`는 `DispatchGroup`과 비슷하게 `OperatinQueue`의 모든 `Operation`이 끝나기를 기다리게 할 수 있다는 것을 다시 한 번 확인했습니다.

```swift
class WorkLoadManager {
    var queue: CustomerQueue = CustomerQueue<(Task, BlockOperation)>()
    var depositQueue = OperationQueue()
    var creditQueue = OperationQueue()

    init(){
        self.depositQueue.maxConcurrentOperationCount = 2
        self.creditQueue.maxConcurrentOperationCount = 1
    }
        ...
        ...
        ...
        depositQueue.waitUntilAllOperationsAreFinished()
        creditQueue.waitUntilAllOperationsAreFinished()
        print("완료")
    }
}
```
    
</div>
</details>

<details>
<summary style="font-size: 24px"> 🔸 DispatchQueue vs OperationQueue </summary>
<div markdown="1">


#### DispatchQueue
    
- 👍 로직이 복잡하지 않고 오래걸리지 않는 작업을 수행하기에 좋다.
- 👍 Async, Sync 설정이 간단하다.
![](https://i.imgur.com/kAyU84Y.png)
    
```swift=
depositQueue.async(group: banking, execute: dispatchWorkItem)
loanQueue.async(group: banking, execute: dispatchWorkItem)
```
    
#### OperationQueue
    
- 👍 로직이 복잡하고 오래걸리는 작업들을 처리하기에 적합하고. DispatchQueue와는 다르게 작업간의 관계를 세부적으로 설정해줄 수 있다.
- 👎 기본적으로 Operation은 Sync이다. Async로 설정해주려면 Custum Operation을 만들어야 가능하다.
    
![](https://i.imgur.com/4tWwMIe.png)
    
- 👍DispatchQueue보다 코드 작성이 간결하다.
    
| OperationQueue 사용시 | DispatchQueue 사용시 |
| -------- | -------- |
| ![](https://i.imgur.com/ZK6v5F9.png)  | ![](https://i.imgur.com/eyoeIB6.png)    |

- 👍 기본적으로 FIFO지만 설정에 따라 먼저 실행되도록 할 수 있다.
- 👍 Dispatch의 Semaphore를 사용할 수 있다.


    
</div>
</details>
    

---
    
## 6. 참고링크
[🌏 Swift Language Guide - Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)

[🌏 Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

[🌏 Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)

[🌏 Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

[🌏 Apple Developer - NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter/)

[🌏 야곰닷넷 강의 - 동시성 프로그래밍](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)

[🌏 야곰닷넷 강의 - Unit Test 작성하기](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/)

[🌏 Swift Language Guide - DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue/)
