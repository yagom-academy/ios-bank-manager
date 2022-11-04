# 🏦 은행창구 매니저

## 📖 목차
1. [소개](#-소개)
2. [타임라인](#-타임라인)
3. [UML](#-uml)
4. [실행 화면](#-실행-화면)
5. [고민한 점](#-고민한-점)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

## 🌱 소개

`Hamo`와 `SummerCat`이 만든 은행창구 매니저 앱입니다.

- LinkedList 구조를 기반으로 한 Queue를 구현하고, 한 명의 은행원이 한 번에 한 고객씩 업무를 순차적으로 처리합니다.
- LinkedList, Queue, Generics 개념을 기반으로 진행되었습니다.



## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()
[![SwiftLint](https://img.shields.io/badge/SwiftLint-0.49-green)]()

## ⏰ 타임라인

22.10.31
- SwiftLint Cocopod으로 적용
- Node 클래스 구현
- LinkedList 구조체 구현
- Queue 구조체 구현

22.11.03 
- Bank 구조체 구현
- Customer 구조체 구현
- BankManager 구조체 구현



## 🧑 팀원
<img src = "https://i.imgur.com/TVKv7PD.png" width=160>|<img src="https://i.imgur.com/ydRkDFq.jpg" width=200>|
|:--:|:--:|
|[SummerCat](https://github.com/dev-summer)|[하모](https://github.com/lxodud)|

## 🌲 UML
![](https://i.imgur.com/mDSi0Tl.png)

## 🖥 실행 화면

![](https://i.imgur.com/I9HaZa7.gif)



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
    - 하지만 이번 스텝에서는 은행원 1명이 모든 일을 순차적 & 비동기적으로 처리하기 때문에 Dispatch Queue를 사용할 필요가 없다고 판단했습니다.

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


## ❓ 트러블 슈팅

### Step 1

- `Undefined symbols:` 오류
    - BankManagerConsoleApp`과 같은 Command Line App에서는 `@testable import`로 타겟을 불러올 수 없어 오류가 발생했습니다.
    - 테스트 타겟에서 사용하는 파일들의 Target Membership에 테스트 타겟을 추가해주니 해결되었습니다.

### Step 2

- 구조체의 프로퍼티가 private이면 memberwise initializer도 자동으로 private access level을 가지게 된다.
    - 외부에서 init하기 위해서는 이니라이저를 명시적으로 작성해야 한다.


## 🔗 참고 링크


[🔝 맨 위로 이동하기](#-은행창구-매니저)
