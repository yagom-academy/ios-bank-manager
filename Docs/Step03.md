## 3️⃣ STEP 3
### STEP 3 Questions

#### Q1. 프로젝트 폴더, 파일 관리 컨벤션
- 프로젝트 한개의 그룹 안에 파일 안에 많은 파일들이 있어, 타입별로 그룹을 만들어 주었습니다. 폴더 관리 컨벤션이 있는지, 하리보의 경우 어떻게 관리하시는지 궁금합니다.!!

#### Q2. 메서드화 시 매개변수
- 메서드화 시 받는 매개변수가 너무 많아지는 경우 어떻게 해주는게 좋은 방법인지 고민되어 질문 드립니다.!
아래 코드 입니다.
    ```swift
    while queue.isEmpty == false {
        guard let client = queue.dequeue() else {
            return nil
        }
        if client.desiredServices == Option.deposit {
            depositQueue.async(group: bankGroup) {
                    handleTask(of: depositBanker, by: memberOfDepositBanker, for: client)
            }
        } else if client.desiredServices == Option.loan {
                loanQueue.async(group: bankGroup) {
                handleTask(of: loanBanker, by: memberOfLoanBanker, for: client)
            }
        }
        numberOfServedClient += 1
    }
    ```
- 여기서 `while`문 안에 있는 `if`문을 메서드화 해주었을 때

    ```swift
    while queue.isEmpty == false {
        guard let client = queue.dequeue() else {
            return nil
        }
        extractedFunc(client, depositQueue, bankGroup, depositBanker, memberOfDepositBanker, loanQueue, loanBanker, memberOfLoanBanker)
        numberOfServedClient += 1
    }
    bankGroup.wait()
    ```

- 위와 같은 코드가 되어서 메서드화 해주지 않았는데.. 이럴 경우에는 이중 중첩으로 해도 무리가 없을까요??

- 추가적으로 생각해보았는데. 그럼 **"메서드의 매개변수를 줄여주는 방법으로 해볼까?"** 라는 생각을 했었습니다. 이를 위해 메서드 안에서 인스턴스화가 되어야 했었습니다. 다시 생각해보니 반복 메서드 안에서 인스턴스화가 되는 것은 좋지 않는 방법이라고 생각했습니다. 그 이유는 애초에 메서드 위치가 반복문 안에 있기 때문에, 메서드 안에서 인스턴스화를 하게 된다면 **"메서드가 실행될 때마다 인스턴스화가 되지 않을까?"** 생각 했고, 그렇게 되면 **"불필요한 메모리 소모가 되지 않을까"** 라고 생각했습니다. 

- 위의 저희의 생각(인스턴스화가 반복문 실행시 계속 된다는 것에 따른 안 좋은 점과 매개변수를 줄일 방법이 있는지)에 대해서 하리보의 의견이 궁금합니다!

#### Q3. BankManager 인스턴스 생성 위치 문제

- 다음의 코드를 보시면, `while`문이 반복되기 이전에, `DepositBankManager`와 `LoanBankManager`의 인스턴스를 생성해주었습니다. 이후, `while` 문 안의 `if` 조건문을 통해 각각의 인스턴스에서 `work` 메서드를 실행합니다. 그런데, 현재 `depositQueue`의 `semaphore`은 2로 설정하여, `thread`는 2개가 생성될 것인데, 각각의 `thread`에서 `work`가 실행되는 것은 두 명의 예금 당당 은행원이 각각 한명의 은행원을 응대하는 것이 아닌, 하나의 예금 담당 은행원이 두 명의 고객을 응대하는 것으로 생각이 들었습니다.

- 코드(반복문 밖 인스턴스 생성)
    ```swift
    private func serveClient() -> Int? {
        ...
        let depositBanker = DepositBankManager()
        let loanBanker = LoanBankManager()
        ...
        while queue.isEmpty == false {
            guard let client = queue.dequeue() else {
                return nil
            }
            if client.desiredServices == Option.deposit {
                depositQueue.async(group: bankGroup) {
                    member.wait()
                    depositBanker.work(from: client)
                    member.signal()
            } else if client.desiredServices == Option.loan {
                loanQueue.async(group: bankGroup) {
                    member.wait()
                    loanBanker.work(from: client)
                    member.signal()
                }
            }
        ...
        }
        ...
    }
    ```

- 이에 이번에는 다음과 같이, 클로저 내부에서 인스턴스를 생성하여 구현을 해보니, 각각의 `thread`에서 은행원이 한명씩 생성되어 은행원 2명이 각각 1명의 고객을 응대하는 방식으로 보이는 것 같습니다. 그런데, 여기서 2가지 문제가 발생하는데, 먼저 하나는 반복문이 돌때마다 인스턴스를 생성하기에 적절하지 않다고 판단이 되고, 다음으로 반복문을 통해 은행원 2명이 생성되지만, 한번의 작업을 끝날때마다 동일한 은행원이라는 보장이 없었습니다. 즉, 은행원 A와 은행원 B가 생성되었지만, 이후 다른 고객이 올때, 또 인스턴스가 생성하여 은행원 C, 은행원 D라는 새로운 은행원이 응대를 하는게 아닐까 고민이 되었습니다.

- 코드(반복문 안 인스턴스 생성)
    ```swift
    private func serveClient() -> Int? {
        ...
        while queue.isEmpty == false {
            guard let client = queue.dequeue() else {
                return nil
            }
            if client.desiredServices == Option.deposit {
                depositQueue.async(group: bankGroup) {
                    member.wait()
                    let depositBanker = DepositBankManager()
                    depositBanker.work(from: client)
                    member.signal()
            } else if client.desiredServices == Option.loan {
                loanQueue.async(group: bankGroup) {
                    member.wait()
                    let loanBanker = LoanBankManager()
                    loanBanker.work(from: client)
                    member.signal()
                }
            }
            ...
        }
        ...
    }
    ```

- 위와 같은 고민은, 인스턴스의 수를 은행원의 수와 동일시하여 생각되는 문제라고 생각됩니다. 일단 현재는 `semaphore`가 은행원의 수라고 생각을 하고 진행을 해보았는데 이 생각이 과연 맞는 것인지 궁금하고, 또한 은행원 인스턴스의 생성은 어디에서 어떻게 호출해야 하는지 질문을 드리고 싶습니다.

### STEP 3 Answers
A1. 프로젝트 폴더, 파일 관리 컨벤션
주로 view, viewModel, viewController, Network 처럼 각각 파일의 역할 별로 폴더링을 하곤 합니다!
지금 폴더 나누신 기준도 각각 역할에 맞게 잘 나눠주신것 같아요 👏🏻

A2. 메서드화 시 매개변수
우선 메서드화를 하고자 하시는 이유에 대해서 여쭤보고 싶어요!
두번째 코드에서 메서드화를 해주신 부분은
수행하는 역할이 다르거나, 코드 반복되거나, 코드 길이가 아주 길어보이지는 않아요!
이미 hadleTask() 도 메서드화되어 빠져 있어서
저라면 굳이 그 부분에서 메서드화를 한다면 코드가 반복되고 있는

depositQueue.async(group: bankGroup) {
   handleTask(of: depositBanker, by: memberOfDepositBanker, for: client)
}
이 부분을 할것 같아요, handleTask 메서드도 저라면 한 하나의 큰 메서드로 빼줄것 같습니다!
그렇게 되면

extractedFunc(queue: depositQueue,
              bankGroup: bankGroup,
               banker: depositBanker,
               member: memberOfDepositBanker,
               client: client)

private func extractedFunc(queue: DispatchQueue, bankGroup: DispatchGroup, banker: Banker, member: DispatchSemaphore, client: Client) {
        queue.async(group: bankGroup) {
            member.wait()
            banker.work(from: client)
            member.signal()
        }
    }
매개변수가 그래도 많긴 하지만 이런식으로 되겠죠!

A3. BankManager 인스턴스 생성 위치 문제
말씀 주신것 처럼 semaphore 가 은행원의 수라고 생각하시는게 맞아요! 그리고 반복문안에서 인스턴스 생성도 적절하지 않다고 잘 판단해주셨어요 😉 
지금 구현해주신 위치에서 semaphore 생성을 해주면 semaphore 의 value 를 1,2 로 각각 지정해주고 있어서,
DispatchQueue 내에서 딱 두개씩만 작업 개수를 제한해줍니다!

📌 추가로
+Extension 파일을 분리하셨는데
주로 UI Component 들이나 스위프트 프레임워크 같은 큰 공통 기능들에 대해서 +Extension 으로 구현해주는 편이예요.
구현해 주신 것 처럼, 단지 기능이나 코드 분리를 위해서 사용하는 경우는 보통 한 파일 내에서 extension 으로 빼주는 정도입니다!
꼭 수정해주지 않으셔도 되고 알아두시면 좋을 것 같아서 말씀드려용

---
### STEP 3 TroubleShooting

#### T1. isEmpty 프로퍼티 문제

- `clientQueue`에 있는 모든 고객의 업무를 처리할때까지 은행원의 업무가 계속되도록 코드를 구상해보았습니다. 이에 `clientQueue`의 `isEmpty` 프로퍼티가 `true`가 되기 전까지, `client`를 `dequeue`하기 위하여 `while` 문 안에 집어 넣어보았습니다. 그런데 `breakpoint`를 걸어보니 `while`문의 밖에 쓴, `bankGroup.wait()`, `return numberOfServedClient` 메서드가 호출되지 않는 것을 발견하였습니다. 
- 코드를 전체적으로 다시 검토한 결과, `LinkedList` 구조체의 `isEmpty` 프로퍼티의 구현부가 `head == nil && tail == nil`로 되어 있었습니다. 여기서 `&&` 비교 연산자를 `||` 비교 연산자로 바꾼 결과, 정상적으로 작동하는 것을 확인하였습니다.

#### T2. 동시성 프로그램 구현

- 프로젝트 요구상황에 따라 다중처리를 구현하는 부분에서 애를 많이 먹었습니다. 처음에는 `clientQueue`에서 고객을 `dequeue`하는 기능도 비동기적으로 이루어져야 하니 여기서부터 동시성 프로그램을 구현해보아야 하는 것인가 고민을 하였습니다. 이를 고민해본 결과, `clientQueue`에서 `dequeue`를 하는 작업까지는 기존의 코드 내에서 구현되어도 충분하다고 판단되었고, 주목할 점은 고객의 업무에 따라 예금 고객 대기열(`depositQueue`) 혹은 대출 고객 대기열(`loanQueue`)에 넣은 다음 고객에 대한 은행원의 업무 처리 작업에서 동시성 프로그램을 구현해야 한다는 점이었습니다.
- 이를 간단히 정리하자면, 고객은 원래의 코드에서 진행하던대로 빼서 각각의 `dispatchQueue`에 넣은 다음, 몇개의 `Thread`로, 그리고 동기 혹은 비동기적으로 처리할 지 고민하면 되는 문제였습니다. 우선 `Thread`의 개수는 은행 종업원의 수로 파악하여, 현재 요구사항에는 각각 2명, 1명으로 설정되어 있기도 하고, 추가적으로 종업원의 수를 늘릴 수도 있다고 판단하여, 다중 `thread`를 필요로하기 때문에 `attribute`를 `Concurrent`로 구현해보았습니다.
- 그 다음으로 고객 대기열에서 고객을 어떻게 추출하는 지를 고민해보아야 했습니다. 이 부분이 처음에 가장 잘 이해가 안 되었습니다. 왜냐하면, 전체적인 시점에서 한 은행원이 다른 은행원이 고객을 응대하는 중에도 당연히 자신의 고객이 비었다면 데려와야 한다고 생각하여 비동기로 처리한다고 생각했습니다. 하지만, 은행원 개인의 시점에서 자신의 고객 응대가 끝나기 전에 다른 고객을 데려오지는 않아야 하므로 동기로 처리해야 되지 않을까 의문이 생겼습니다. 동기 혹은 비동기는 서로 상충되어서 하나의 방법만을 선택해야하여 고민이 깊어졌습니다. 
- 고민 결과, `sync`, `async`의 문제는 아래의 화살표처럼 각각의 쓰레드에서의 처리 방식을 의미하는 것이었고, 은행원 개인 시점에서 일이 끝날때까지 다음 고객을 안 데려오는 것은, 기존의 코드블럭의 논리처럼 하나의 일이 끝날때까지 다른 일은 시작하지 않는 기본적인 구조였습니다. 이를 바탕으로, 은행의 다중처리 기능은 동시성 프로그램에 비동기 방식을 통해 구현하였습니다.

- 이미지
    <img width="1093" alt="스크린샷 2022-07-06 오전 11 13 03" src="https://user-images.githubusercontent.com/99063327/177453100-5d7f43b2-20c6-4609-8982-12563ad9b38c.png">

---
    
### STEP 3 Concepts

- `randomElement`
- `CFAbsoluteTime`, `CFAbsoluteTimeGetCurrent`
- `DispatchQueue`, `concurrent`, `sync`, `async`, `closure`, `Thread`
- `DispatchGroup`, `wait`
- `DispatchSemaphore`, `wait`, `signal`, `race condition`
- `return tuple`

---
### STEP 3 Reviews And Updates
    
[STEP 3 Pull Request](https://github.com/yagom-academy/ios-bank-manager/pull/206)

---
