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
### 은행창구 매니저 프로젝트

### 팀원 
|[jeremy](https://github.com/yjjem)| [L J](https://github.com/lj-7-77) |
|:-:|:-:|


---
## 2. 타임라인
221031
- UML 초안 작성
- Linked-list 자료구조 이해, Generics 공식문서
- Node타입 구현

221101
- Queue타입 구현, Unit Test를 통한 검증

221102
- STEP 1 PR
    
221103
- 프로토콜, 익스텐션 구현
- 콘솔창 메뉴 출력 구현
 
221104
- STEP 2 PR


## 3. 시각화된 프로젝트 구조

### 🧩 UML
<img src="https://i.imgur.com/dFuwDLM.jpg" style="border: 1px solid gray;"/>

### 📁 디렉토리 구조 
```
BankManagerConsoleApp
├── Protocols
│   ├── Displayable.swift
│   ├── Runnable.swift
│   └── SelectableMenu.swift
├── extension
│   ├── Displayable + displayMenu.swift
│   ├── Double + formatted.swift
│   ├── Runnable + runBankManagerConsoleApp.swift
│   └── SelectableMenu + getInput.swift
├── WorkLoadManager.swift
├── Bank.swift
├── CustomerQueue.swift
├── MenuSelection.swift
├── Node.swift
└── main.swift
```


## 4. 실행화면

|내용| 화면 |
|---|---|
| 첫 실행 | <img src="https://i.imgur.com/7xEdiT0.png" width="150px"/> |
|  1번 메뉴 선택    | <img src="https://i.imgur.com/2wbLgIz.png" width="600px"/> |
|  2번 메뉴 선택    | <img src="https://i.imgur.com/Vnfdwn0.png" width="300px"/>|
| 그 이외의 값 입력 | <img src="https://i.imgur.com/L3TpWEN.png" width="170px"/> |
|실행 gif|<img src="https://i.imgur.com/pr6LY0a.gif" width="600px"/>|

---
## 5. 고민한 점

#### 🔸 Unit test 두 가지 결과를 한번에 확인하는 경우도 있는지
`BankManagerConsoleAppTest.swift` 테스트 파일의 `test_clear가_큐를_비우는지_확인()` 메서드에서 `front`와 `rear`가 모두 `nil`로 바뀌는지 `XCTAssertEqual`을 두번 호출하여 확인했다.
이 경우 `given`과 `when`단계 코드가 동일하고 `XCTAssertNil`로 `front`와 `rear`값만 각각 확인하면 되었기 때문에 하나의 테스트에서 두 가지를 확인했다.
➡️ 같은 동작이라면 하나의 테스트에서 여러가지 확인 가능하다. 다만 더 자세히 작성하면 좋다.

---
#### 🔸 Unit test given, when 상황이 없을 경우 생략을 해도 되는지
`BankManagerConsoleAppTest.swift` 테스트 파일의 
`test_queue가_비어있을떄_isEmpty가_True를_반환한하는지_확인` 메서드에서 
처음에 큐에 아무것도 들어있지 않은 상태에서 바로 비어있는지 확인을 해도 테스트 성공을 확인할 수 있었다.
테스트 메서드 양식이 `given`, `when`, `then`에 따라 확인하도록 했다.
➡️ 양식에 맞는 상황이 없는경우 생략해도 된다. `given`의 경우 실제로도 종종 생략되곤 한다. `when`이 생략되는경우는 매우 드물다.

---
#### 🔸 Unit Test @testable import 오류
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

---

#### 🔸 Unit Test) 테스트 불가능한 메서드

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


---
#### 🔸 메서드 분리할 때 전역변수 선언하지 않고 값을 공유할 방법
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

---
#### 🔸 은행원의 근무가능 여부를 나타내는 메서드 호출 위치 
`서론`
`toggleAvailability`메서드의 역할은 업무시작할 때는 근무가능상태를 나타내는 `isAvailable`프로퍼티의 값이`true`이고, 고객업무 처리할 때는 `false`로 바뀐다. 업무처리 후에는 다시 `true`가 된다.

`문제`
일을 분배하는 `giveTask`메서드에서 호출할지, 실제로 일을 하는 `work`메서드에서 호출할 지 고민되었다.
`isAvailable`프로퍼티의 값이 쓰이는 곳을 기준으로 생각하면 일을 분배하는 `giveTask`메서드에서 호출하는것이 맞는데,
근무가능상태의 주체는 은행원인것을 생각하면 `work`메서드에서 호출하는것이 맞다.

`의문`
 근무가능상태가 필요한 상황은 일을 분배할 때 필요한 값이기 때문에 `giveTask`메서드에서 호출하였다.

---
## 6. 참고링크
[🌏 Swift Language Guide - Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)

[🌏 Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

[🌏 Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)

[🌏 Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

[🌏 Apple Developer - NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter/)

