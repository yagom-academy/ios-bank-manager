## 2️⃣ STEP 2
### STEP 2 Questions

#### Q1. `Switch case 쓰는 이유`
- 특정 조건에 따른 메서드 수행 시 제어문을 쓰는데, `if`문과 `switch case`문 중 특정 상황에 따른 선택에 대해 고민해 보았습니다. 기능상으론 동일하겠지만 가독성 측면, 컨벤션?? 측면에서 정의된 것에 대해서 어떤 상황에서는 `if`문과 `switch`문을 쓰시는 지 하리보의 생각을 듣고싶습니다.(단지 견문을 넓히고 싶어서..)

#### Q2. `프로토콜 파일 정리`
- 프로젝트 파일 네임이 시 `extension`인 경우 `'타입'+extension` 이런 식으로 작성되는데 protocol은 명확한 방식이 없는 것 같아 하리보의 경우 어떻게 관리 하시는지 알고 싶습니다.

#### Q3. `enum rawValue`
- 이번 프로젝트에 `enum`으로 따로 선언해서 관리 해주는 부분이 있는데 `.rawValue`보단 `CustomStringConvertible` 프로토콜을 채택해 `.description`을 활용해 코드를 작성해 보았는데 이 경우도 기능을 동일하지만 가독성 측면에서 이점이 있는 것 같아 채택을 했습니다. 하리보는 어떻게 생각하시나요~?

#### Q4. `extension 파일 생성 이후, private 접근자 사용 불가 문제`
- main.swift 파일에서 `Bank` 인스턴스를 생성하여 `Run` 메서드만을 작동하면 기능이 구현될 수 있도록 `Bank` 구조체의 캡슐화 작업을 진행해보았습니다. 이에 `run` 메서드의 내부 구현을 담당하는 아래의 은닉화된 메서드들은 하나의 구조체 안에 들어가는 것은 코드 가독성을 저하한다고 생가하였고, 실제 호출되는 메서드인 `run`만 구현하는 것이 더욱 코드가 보기 좋을 것이라고 생각하였습니다.

    ```swift
    // 1번 방법 : 하나의 .swift 파일 내 하나의 struct 사용
    struct Bank {
        ...
        mutating func run() {}

        private func showMenu() {}
        private mutating func choose(_ option: String) {}
        private mutating func requestReInput() {}
        private mutating func openBank() {}
        private mutating func reset() {}
        private mutating func runBusiness() {}
        private mutating func terminateBusiness() {}
        private mutating func makeClientQueue() -> ClientQueue<Client>? {}
    }
    ```
    
- 그래서 위의 코드를 다음과 같이 `extension`을 통해 분리해보았습니다.

    ```swift
    // 2번 방법 : 하나의 .swift 파일 내 extension을 통한 분리
    // Bank.swift
    struct Bank {
        ...
        mutating func run() {}
    }

    extension Bank {
        private func showMenu() {}
        private mutating func choose(_ option: String) {}
        private mutating func requestReInput() {}
        private mutating func openBank() {}
        private mutating func reset() {}
        private mutating func runBusiness() {}
        private mutating func terminateBusiness() {}
        private mutating func makeClientQueue() -> ClientQueue<Client>? {}
    }
    ```

- 하나의 파일 내에 `struct`와 `extension`을 구현했을 때는, 메서드의 접근 제어자가 `private`으로 선언하였다 아무 문제없이 빌드가 되었음을 확인할 수 있었습니다. 그러나, `Bank`의 `extension`을 Bank+Extension.swift라는 새로운 파일을 생성하여 빌드를 해보니 빌드에 실패하였습니다.

    ```swift
    // 3번 방법 : 각각의 .swift 파일을 통한 분리
    // Bank.swift
    struct Bank {
        ...
        mutating func run() {}
    }

    // Bank+Extension.swift
    extension Bank {
        private func showMenu() {}
        private mutating func choose(_ option: String) {}
        private mutating func requestReInput() {}
        private mutating func openBank() {}
        private mutating func reset() {}
        private mutating func runBusiness() {}
        private mutating func terminateBusiness() {}
        private mutating func makeClientQueue() -> ClientQueue<Client>? {}
    }
    ```
- Q4-1) 외부 파일로 `extension`을 구현하기 위해서는 접근 제어를 `private`에서 `internal`로 변경하는 방법밖에 없을까요? 외부 파일을 생성하면서, `private` 접근 제어 설정을 그대로 가져갈 수 있는 방법이 있을지 궁금합니다. <br/> Q4-2) 그렇지 않다면, 1번 방법처럼 하나의 구조체 안에 다 호출을 해주는 것이 좋을지, 혹은 2번 방법과 같이 그래도 `extension`으로 빼주는게 좋을지, 그것도 아니면 더 좋은 방법이 있을지 질문드리고 싶습니다.

### STEP 2 Answers

#### A1. Switch case 쓰는 이유
- if 문 보다 switch case 문을 더 많이 사용하는 케이스는 대표적으로 enum 의 case 들을 처리 할때가 있어요! 
- 모든 case들을 정의해야 하기 때문에 컴파일 단에서 놓친 case 들을 확인 할 수 있게 됩니다. if else 문에서는 필요한 조건만 정의하면 되는데 요 차이가 있겠죠! 그리고 여러 조건을 처리해야 한다면 if else 문 보다 switch 를 더 자주 사용하기도 합니다. 개발자 취향에 따라 달라지지만 if, else 로 끝나지 않고 조건이 세개 이상되면 switch 를 쓰시는 분들도 계십니다.

#### A2. 프로토콜 파일 정리
- 프로토콜 네이밍 컨벤션 글을 참고해 보시면 좋을것 같아요 😉
https://dev.srdanstanic.com/swift-protocol-types-and-naming/
- 프로토콜을 정의할 때 주로 파일 하나에 프로토콜을 하나를 정의해주곤 합니다!
- 그래서 파일명도 해당 프로토콜 이름과 동일하게 프로토콜 네임으로 해주시면 됩니닷 ✨

#### A3. enum rawValue
- 네네! 아주 좋습니다 👏 실제로 회사 코드에서도 자주 사용합니다!

#### A4. extension 파일 생성 이후, private 접근자 사용 불가 문제
- 음 우선 말씀하신것 처럼 Bank 의 run() 내부 구현이 하나의 구조체 안에 들어가는게 가독성을 해친다고 생각하지는 않아요! 단지 private 함수들이 파일안에 많다고 해서 가독성을 저하된다고 생각하진 않습니닷. 대신 그 함수들이 Bank 의 역할을 수행하고 있는지, 주입 받을 수 있는 것들이 있는지를 판단해서 분리하는게 좋을것 같아요 🙂
- Q4-2 처럼 하나의 구조체 안에서 호출해주시고, 내부에서 또 크게 기능을 분리하고 싶으시면 extension 으로 빼는 정도까지 해주시면 될 것 같습니다 😉

- private 접근지정자 자체가 객체가 선언된 괄호 안에서만 사용 가능하기 때문에 extension 파일로 빼서 사용하시려면 Internal 로 지정해주시면 됩니다!

---
### STEP 2 TroubleShooting
    
#### T1. `bank와 bankManager간 의존성 주입`

- 은행 창구 매니저 프로젝트를 통해, `Bank`와 `BankManager`간 의존성 주입 방법에 대하여 고민해보게 되었습니다. 1번 방법은 `Bank` 인스턴스를 생성한 이후, `BankManager`를 초기화할 때, 소속 `bank`를 지정하는 방법이었고, 2번 방법은 `BankManager` 인스턴스를 생성한 이후, `Bank`를 초기화할 때, 소속 `bankManager`를 지정하는 방법이었습니다. 두 방법 모두 설득력이 있었고, 둘 중 어떤 방법을 택해야하는지, 혹여나 두 방법을 모두 사용해야 하는 것인지 고민에 빠졌습니다.

    ```swift
    // 1번 방법
    let bank = Bank()
    let bankmanager = Bankmanager(bank: bank)
    
    // 2번 방법
    let bankmanager = Bankmanager()
    let bank = Bank(bankmanager: bankmanager)
    ```
    
- 고민에 대한 해답을 `Queue`와 `LinkedList`에서 찾을 수 있었습니다. Step1에서 `Queue` 타입 구현을 위한 `Linked-list` 타입을 직접 구현하는 과정에서, `Queue`의 내부 프로퍼티로 `Linked-List`를 가져왔습니다. 이와 비슷하게, `Bank`의 업무를 수행하기 위해서, `BankManager`를 내부 프로퍼티로 가져와, `BankManager`의 메서드를 사용하는 것이, 실제 은행 내에서 은행원을 호출하는 것과 비슷한 관계로 파악하였습니다.

- 이에, 2번 방법을 채택하여 `Bank`의 내부 프로퍼티로 `BankManager`를 구현하는 것이 적절하다 판단을 내렸습니다. 추가로, 의존성 역전 원칙에 따라, 의존성 주입 과정에서 각 모듈이 직접 의존을 갖기 보다는 추상화된 인터페이스를 의존하게 하기 위하여, `Banker`라는 프로토콜을 생성하여 사용해보았습니다. 


---
    
### STEP 2 Concepts

- `struct`, `class`
- `POP`, `protocol`, `extension`
- `Dependency Injection`
- `CustomStringConvertible`
- `In-Out parameters`
- `Thread`, `sleep(forTimeInterval:)`

---
### STEP 2 Reviews And Updates
    
[STEP 2 Pull Request](https://github.com/yagom-academy/ios-bank-manager/pull/196)
