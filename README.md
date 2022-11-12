# 🏦 은행창구 매니저

## 📖 목차
1. [소개](#-소개)
2. [타임라인](#-타임라인)
3. [Tree](#-tree)
4. [UML](#-uml)
5. [실행 화면](#-실행-화면)
6. [고민한 점](#-고민한-점)
7. [트러블 슈팅](#-트러블-슈팅)
8. [참고 링크](#-참고-링크)

## 🌱 소개

`Hamo`와 `SummerCat`이 만든 은행창구 매니저 앱입니다.

- LinkedList 구조를 기반으로 한 Queue를 구현하고, 한 명의 은행원은 한 번에 한 고객씩 업무를 순차적으로 처리합니다.
- 예금 업무를 처리할 수 있는 은행원은 2명, 대출 업무를 처리할 수 있는 은행원은 1명이 있습니다.
- LinkedList, Queue, Generics, GCD, POP 개념을 기반으로 진행되었습니다.



## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()
[![SwiftLint](https://img.shields.io/badge/SwiftLint-0.49-green)]()

## ⏰ 타임라인

**22.10.31**
- SwiftLint Cocopod으로 적용
- Node 클래스 구현
- LinkedList 구조체 구현
- Queue 구조체 구현

**22.11.03** 
- Bank 구조체 구현
- Customer 구조체 구현
- BankManager 구조체 구현

**22.11.07**
- BankService 열거형 생성
- performTask 메서드 allocateCustomer로 네이밍 수정 및 내부 로직 변경

**22.11.08**
- 은행 업무 처리시간 측정 기능 구현
- Bank 클래스 구현
- Bankable 프로퍼티 구현

**22.11.09**
- Bank 클래스의 기능 일부 Departmentable 프로토콜로 분리

**22.11.10**
- Departable 프로토콜 제거 및 Department 구조체 구현


**22.11.11**
- 고객 생성 로직 BankManager에서 분리


## 🧑 팀원
<img src = "https://i.imgur.com/TVKv7PD.png" width=160>|<img src="https://i.imgur.com/ydRkDFq.jpg" width=200>|
|:--:|:--:|
|[SummerCat](https://github.com/dev-summer)|[하모](https://github.com/lxodud)|

## 🌲 Tree
```
── BankManagerConsoleApp
   ├── Bank
   │   ├── Department.swift
   │   ├── Bank.swift
   │   ├── BankError.swift
   │   ├── BankManager.swift
   │   ├── BankService.swift
   │   ├── Bankable.swift
   │   ├── Depositable.swift
   │   └── Loanable.swift
   ├── Constant.swift
   ├── Customer.swift
   ├── Queue
   │   ├── LinkedList.swift
   │   ├── Node.swift
   │   └── Queue.swift
   └── main.swift

```

## 🌲 UML

![](https://i.imgur.com/NPxTw0c.png)


## 🖥 실행 화면
Step-2  
<img src = "https://i.imgur.com/I9HaZa7.gif" width=700>

Step-3  
<img src = "https://i.imgur.com/AZqFL0B.gif" width=700>


## 👀 고민한 점

### Step 1

- 어떤 의존성 관리도구를 사용해야하는지에 대한 고민
    - SwiftLint를 사용하기 한 의존성 관리 도구로, Swift Package Manager(SPM)을 사용해보려고 했습니다. 애플이 만든 First-Party Tool이기 때문입니다.
    - 그런데 SwiftLint는 SPM을 제대로 지원하지 않아서 CocoaPods를 사용하게 되었습니다.

- 타입구현 클래스 VS 구조체
    - `Node`의 경우 다른 요소들과 연결하기 위해서(`next`) 참조값을 사용하기 때문에 class로 구현하였습니다. 내부에서 자기 자신의 타입을 가진 프로퍼티(`next`)를 멤버로 가지고 있기 때문에 struct는 사용이 불가능합니다.
    - `LinkedList`, `Queue`의 경우 참조나 상속이 필요하지 않고, 의도하지 않은 데이터 변경을 방지하기 위해서 struct를 사용하였습니다. 

### Step 2

- Dispatch Queue의 사용
    - 요구사항에 은행원 n명이 근무한다는 내용이 있어 Dispatch Queue를 활용해야 하는지 고민하였습니다.
    - 하지만 이번 스텝에서는 은행원 1명이 모든 일을 순차적(serial) & 동기적(sync)으로 처리하기 때문에 Dispatch Queue를 사용할 필요가 없다고 판단했습니다.

- Timer의 사용
    - 아래와 같은 형태로 타이머를 구현해 모든 업무를 처리하는 데 걸린 시간을 계산할 수도 있지만, 이런 경우 작업을 처리하는데 걸린 시간 외에 print 등의 다른 작업을 수행하는 시간까지 포함된 시간을 구하게 됩니다.
    - 정확히 업무 처리에 걸린 시간만을 계산하는 것이 과제의 취지라고 생각해서 사용하지 않았습니다.

    ```swift
    mutating func open() -> CFAbsoluteTime {
        let customers: Int = createCustomer()
        let startTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        for _ in 1...customers {
            bank.performTask()
        }
        let workTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent() - startTime
        return workTime
    }
    ```

- `format()` 메서드를 정의하는 Double의 extension 구현
    - `Double+` 파일을 별도로 생성하여 해당 파일 내에 `format()` 메서드를 Double 타입의 extension으로 구현해주었습니다.
    ```swift
    // Double+.swift
    extension Double {
        func format() throws -> String {
            let formatter: NumberFormatter = {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 2

                return formatter
            }()

            guard let result = formatter.string(for: self) else {
                throw BankError.formattingError
            }

            return result
        }
    }
    ```
    
    - 해당 메서드에서 `BankError`를 throw 한 후, `BankManager`에서 다시 던지고, 최종적으로 던져진 에러는 `main()`에서 catch 하고 있습니다. 
    - 메서드 내부에서 `BankError`를 throw하고 있어서 Bank에 의존적이기 때문에 모든 Double에서 사용하되는 것은 부적절하다고 생각했습니다.
    - 따라서 private extension을 사용해 BankManager내부의 Double만 이 메서드를 사용할 수 있도록 구현하는 방법과 BankManager의 메서드로 구현하는 방법을 생각하였습니다.

    ```swift
    // BankManager.swift
    private extension Double {
        func format() throws -> String {
            let formatter: NumberFormatter = {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 2

                return formatter
            }()

            guard let result = formatter.string(for: self) else {
                throw BankError.formattingError
            }

            return result
        }
    }
    ```
    
    ```swift
    // BankManager.swift
    struct BankManager {
        private func format(target: Double) throws -> String {
            let formatter: NumberFormatter = {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 2

                return formatter
            }()

            guard let result = formatter.string(for: target) else {
                throw BankError.formattingError
            }

            return result
        }
    }
    ```


### Step 3

- POP를 어디에 적용할 것인가?
    - `Bank`와 `Queue`를 확장할 수 있는 가능성이 있다고 판단하여 적용해 보았습니다.
    - `Bank`의 경우 `Bankable`이라는 프로토콜을 만들어서 공통적인 프로퍼티나 메서드를 추상화하고 `BankManager`는 `Bank`라는 구체적인 타입이 아닌 추상적인 `Bankable`에 의존하여 `DIP`를 준수하도록 하였습니다.
    - `Queue`의 경우 `Queueable` 프로토콜로 추상화했을 때 다양한 타입을 요소로 받기 위해 `associatedType`을 사용하여 구현하였는데 프로토콜과 구조체, 클래스에서 해당 프로토콜을 타입으로 사용할 때 다양한 에러가 발생했고 이를 해결해주려면 모든 타입에 제네릭을 붙여주고 프로토콜을 더 구현해주어야 하는 오버엔지니어링이 발생하여 필요없다고 판단하였습니다.

- 예금 업무를 2명의 은행원이 처리하는 상황, 처리한 고객 수 카운트의 Race Condition 해결
    - Race Condition을 해소하기 위한 방법으로는 크게 뮤텍스락, 세마포어, 시리얼 큐, 배리어를 활용하는 4가지 방법이 있습니다. 이 중에서 **세마포어를 활용**하는 방법을 선택했습니다.
      - 뮤텍스락: `lock()`과 `unlock()`을 일일이 직접 넣어주어야 해서 휴먼 에러가 발생하기 쉽고, **공유 자원에 동시에 접근할 수 있는 프로세스의 수가 1개**이기 때문에 **은행원 2명이 접근해야 하는 상황에서는 적절하지 못하다**고 판단했습니다.
      - 시리얼 큐: 시리얼 큐를 이용할 경우 각 은행원마다 시리얼 큐를 생성해 sync로 작업을 처리하게 하는 방식으로 구현이 가능합니다. 하지만 이런 방식으로 구현할 경우, 예금 업무를 처리하는 두 개의 은행원 큐에 예금 고객을 보낼 때 **각 큐에 쌓여있는 작업의 개수를 매번 확인해서 더 적은 쪽으로** 고객을 보내야 합니다.
      - 배리어: 배리어는 **특정한 작업이 실행되기 전까지 해당 작업을 실행하지 않는** 개념이라고 생각해서 이 상황에 활용하기에는 적절하지 못하다고 판단했습니다.
      - 세마포어: **공유 자원에 동시에 접근할 수 있는 프로세스의 개수를 제한**하는 방법으로, 예금 업무를 2명의 은행원이 처리하는 상황에 가장 적합하다고 생각해 세마포어를 활용했습니다. `depositQueue`의 semaphore를 2로, `finishedCustomerCount`의 semaphore를 1로 제한해 경쟁 상태를 방지했습니다.
        
- 업무 처리 시간 딜레이를 주는 방법 선택 (Thread.sleep vs asyncAfter)
    - `Thread.sleep(forTimeInterval: )`을 이용해서 딜레이를 주는 방법
        - STEP 2에서 `usleep()`으로 딜레이를 주었던 이유는, `sleep()`이 매개변수로 `Int` 타입만 받을 수 있기 때문이었습니다.`Thread.sleep(forTimeInterval: )`을 이용하면 `Double`을 매개변수로 받을 수 있어 `Thread.sleep`으로 수정했습니다.
        - 하지만 `Thread.sleep()`, `sleep()`을 활용해 의도적으로 딜레이를 발생시킬 경우, 코드가 실행되는 스레드를 지연시키기 때문에 성능을 저하시킬 수 있습니다.

    - asyncAfter를 이용해서 딜레이를 주는 방법
        - `"시작"`이 끝난 후 1.1초 후에 `"종료"`가 되도록 하는 코드
        - `loanQueue`와 `DispatchQueue`로 큐가 2개가 되어 둘 다 작업을 계속 async로 던지기 때문에 `loanQueue` 하나만 사용할 때보다 스레드를 더 많이 생성하게 되어 성능이 저하될 수 있다.

        ```swift
        case .loan:
            loanQueue.async(group: dispatchGroup) {
                self.sema.wait()
                DispatchQueue.global().async {
                print("시작")
                self.sema.signal()
            }
            self.sema.wait()
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.1) {
            print("종료")
            self.sema.signal()
            }
        ```
        
- 위의 두 가지 방법을 비교했을 때, 스레드의 수가 늘어나는 것이 성능 저하에 더 큰 영향을 줄 수 있다고 생각해 최종적으로 `Thread.sleep`을 사용했습니다.


## ❓ 트러블 슈팅

### Step 1

- `Undefined symbols:` 오류
    - `BankManagerConsoleApp`과 같은 Command Line App에서는 `@testable import`로 타겟을 불러올 수 없어 오류가 발생했습니다.
    - 테스트 타겟에서 사용하는 파일들의 Target Membership에 테스트 타겟을 추가해주니 해결되었습니다.

### Step 2

- 구조체의 프로퍼티가 private이면 memberwise initializer도 자동으로 private access level을 가지게 된다.
    - 외부에서 init하기 위해서는 이니셜라이저를 명시적으로 작성해야 한다.


### Step 3

- Struct 내부에서 escaping 클로저로 캡처한 값을 수정해주었을 때 발생하는 오류
    - `Department` 타입이 `struct`일 때 `DispatchQueue`의 `async` 메서드를 이용하여 해당 구조체를 캡처하면 오류가 발생했습니다.
    ![](https://i.imgur.com/16ey4fA.png)
    - 에러를 해결하기 위해서 메서드 앞에 mutating 키워드를 붙였습니다.
    ![](https://i.imgur.com/ISpjSK3.png)

    - 이는 `async`메서드에 전달되는 클로저가 캡처 후 외부에서 mutating 메서드가 끝난 이후 구조체를 변경할 수 있기 때문에 발생한다고 생각했습니다.
    
    - 따라서 이를 해결하려면 `capture list`를 통해서 값 타입을 상수로 캡처하고 내부에서 변경이 일어나지 않는다고 표현해주어야 한다고 생각했습니다.
    ![](https://i.imgur.com/8SU37fJ.png)

    - 이렇게 해결했을 때 캡처해온 값을 수정하지 못하기 때문에, `handledCustomerCount`의 값을 변경하는 부분을 클로저 밖으로 분리하여 해결했습니다.



## 🔗 참고 링크

[동시성 프로그래밍 - 야곰닷넷](https://yagom.net/courses/%eb%8f%99%ec%8b%9c%ec%84%b1-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-concurrency-programming/)

[Memberwise Initializer](https://www.swiftbysundell.com/tips/when-can-memberwise-initializers-be-used/)

[Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)

[Concurrent Programming With GCD in Swift 3](https://developer.apple.com/videos/play/wwdc2016/720/)

[Escaping Closure Captures Mutating 'self' Parameter](https://stackoverflow.com/questions/70649135/escaping-closure-captures-mutating-self-parameter-struct)

[Protocol-Oriented Programming in Swift](https://developer.apple.com/videos/play/wwdc2015/408/)

[오픈소스 라이브러리 만들기 - 야곰닷넷](https://yagom.net/courses/open-source-library/)

[SwiftLint](https://github.com/realm/SwiftLint)

[🔝 맨 위로 이동하기](#-은행창구-매니저)
