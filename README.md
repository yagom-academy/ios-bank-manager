## iOS 커리어 스타터 캠프

### 은행 매니저 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

## Step1 구조와 설계

### 타입 구현

  - 은행에는 n명의 은행원이 근무합니다

   - 은행원은 따로 타입을 만들기로

   - 은행원은 10이하의 랜덤한 은행원이 근무중

   - [은행원(state: false), 은행원(state: false), 은행원(state: false, now: 1), 은행원, 은행원] 

  - 은행에는 n명의 고객이 업무처리를 위해 대기합니다

   - 고객의 타입은 : Int or String

   - 먼저 방문한 고객에 먼저 호출될 수 있도록 (FIFO) > Queue

   - [, 2, 3, 4, 5] - 대기 중인 고객의 업무가 모두 끝나면 은행업무를 마감합니다

   - 고객의 수가 처음부터 지정되기 때문에 대기열 0인 상태 && 업무중인 은행원이 없을 때 은행업무를 마감

   - 위 조건은 고객 업무가 종료되었을 때 체크

  - 업무를 마감할 때 "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 XX명이며, 총 업무시간은 XX초입니다."라고 출력합니다 

   - 초기 배정받은 대기 고객 수, 고객수 * 0.7초

  - 은행원은 각 창구를 하나씩 담당하며, 창구에는 번호가 있습니다

   - 창구 번호 : 은행원 배열 인데스 + 1

  - 은행원은 고객의 업무를 처리합니다

  - 각 고객의 업무를 처리하는 데 걸리는 시간은 0.7초입니다

  - 은행원이 한 번에 처리할 수 있는 고객은 한 명입니다

   - 은행 업무 상태 : Bool 으로 체크

  - 대기중인 고객의 업무처리를 시작할 때 아래와 같이 출력합니다

   - "3번 고객 업무 시작"

   - 고객이 배정받을 때 출력

  - 고객의 업무를 처리하면 아래와 같이 출력합니다

   - "5번 고객 업무 완료"

  - 고객이 은행에 방문하면 대기순번을 부여받습니다

   - 대기열 인덱스 + 1

  - 고객은 업무를 처리할 담당 은행원이 배정될 때 까지 대기합니다

   - 0. 은행을 막 열었을 때 그냥 전체를 탐색하면서 업무 가능한 은행원에게 고객을 매칭

​    1. 은행원이 고객의 업무를 완료했을 때 대기열에서 고객을 호출한다.

### 콘솔앱 구현

  - Step 1의 은행에는 한 명의 은행원이 근무합니다.

  - 은행원은 한 번에 한 명의 고객의 업무를 처리할 수 있습니다.

  - 앱을 실행하면 두 개의 메뉴를 출력합니다.

   - 1 : 은행 개점

   - 2 : 종료

  - 사용자가 1을 입력하면 은행을 개점하고 10명~30명의 고객이 방문합니다. 10~30 사이의 임의의 수 만큼의 고객의 업무를 처리하면 은행문이 닫히고 다시 메뉴를 출력합니다.

  - 사용자가 2를 입력하면 프로그램을 종료합니다.

   

- 프로젝트 Step1 예시

![Project_Step1]( https://user-images.githubusercontent.com/44163277/116527192-60e59c80-a915-11eb-8531-8401a723364a.png)



- 구현 영상

![Project_Step1구현]( https://user-images.githubusercontent.com/44163277/116526743-e3ba2780-a914-11eb-8182-c35ff080f7ce.gif)



고민한 점



이번 프로젝트의 핵심 경험인 비동기 프로그래밍 설계를 STEP1에 적용해야 할까?

결론적으로 이번 STEP1에서는 비동기 프로그래밍 설계는 꼭 필요하지 않다고 생각하여 적용하지 않았습니다.

비동기 프로그래밍의 특징 중 하나가 하나의 동작 단위가 끝나기 전에 다른 동작을 실행할 수 있다는 점인데요. 비동기 프로그래밍으로 STEP1 을 진행한다면 아래 처럼 출력될 것으로 생각했습니다.



1번 고객 업무 시작

2번 고객 업무 시작

3번 고객 업무 시작

... (1번 고객 업무 시작으로 부터 0.7초가 지나고)

1번 고객 업무 완료

... (2번 고객 업무 시작으로 부터 0.7초가 지나고)

2번 고객 업무 완료

...



물론 OperationQueue의 maxConcurrentOperationCount의 값을 1로 만들어 순차적으로 처리될 수 있도록 만들 수 있지만

STEP2를 진행하면서 비동기 프로그래밍에 대한 고민을 해보기로 결정했습니다.





1. 타입을 어떻게 나누고 구현할까?

![구조설계](https://user-images.githubusercontent.com/44163277/116528743-25e46880-a917-11eb-9b33-76a717c84db5.png)

- 프로그램을 설계할 때 프로그램의 동작 방식을 현실에서 동작하는 방법과 유사하게 나누고 구현하려고 고민해봤습니다.

은행의 업무 프로세스는 BankManager이라는 타입 안에서 구현하려고 했고

고객의 은행 방문(업무를 처리할 고객의 수)과 고객 정보(몇명의 고객이 있으며 대기중인 고객의 값을 출력하는 부분)에 대한 기능들은

CustomerManager안에서 구현했습니다.



2. 이번 STEP에서 에러 관리를 해야 할까?

이번 스텝에서는 타입과 사용되는 데이터의 값이 추가되거나 변경되는 경우가 드물고 외부로부터 들어오는 데이터의 종류가 앱 실행시 입력하는 메뉴 뿐이라서 별도로 에러타입 구현 및 에러 관리를 하지 않았습니다.

3. 쓰레드를 일시정지 하는 방법이 Thread.sleep, sleep, usleep 등이 있던데 sleep과 usleep은 멈추는 초 단위의 차이가 있다는 것을 알게 되었습니다. 프로젝트 요구사항이 0.7초여서 usleep을 채택했는데 그렇다면 Thread.sleep과 sleep을 선택할 때 적절한 기준이 있을까요?

### 피드백 내용
- 타입 구현 부분에 각각의 요구사항(동작과 역할)들을 우리 실생활과 좀 더 비슷하게 코드에 녹아낼 수 있지 않을까? 각 객체가 어떤 역할이고 어떤 동작을 하게 할지에 좀 더 초점을 맞추면 좋을 것 같습니다!
- Thread.sleep, sleep, usleep 전부 쓰레드를 sleep하는 어떤 메서드를 wrapping한 메서드로 알고 있습니다. 그래서 사용자가 좀 더 편의에 맞는 걸 선택해서 사용하도록 제공하고 있는 걸로 알고있어요! 그래서 말씀해주신대로 시간 단위 등이 더 편한 것을 골라서 쓰시면 될 것 같습니다. 그리고 동작을 잠시 멈출 수 있는 작업으로 Timer.scheduledTimer, DispatchQueue.main.asyncAfter 등도 있으니 각각의 특징과 사용방법도 한번 알아보시면 도움이 될 것 같습니다!

- 피드백 내용 변경 전
```
// BankManager.swift
import Foundation

class BankManager {
    
    func openBank() {
        var bankState: Bool = choiceBankState()
        
        while bankState {
            bankWorkProgress()
            
            bankState = choiceBankState()
        }
    }
    
    private func choiceBankState() -> Bool {
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator : "")
            
            guard let inputNumber = readLine() else {
                return false
            }
            
            if inputNumber == "1" {
                return true
            } else if inputNumber == "2" {
                return false
            } else {
                print("잘못된 입력입니다, 다시 입력해주세요.")
            }
        }
    }
    
    private func bankWorkProgress() {
        let customerManager: CustomerManager = CustomerManager()
        let todayTotalVisitCustomers: Int = customerManager.countCustomers()
        
        while true {
            let remainingCustomer: Int = customerManager.countCustomers()
            
            if remainingCustomer == 0 {
                finishBank(todayTotalVisitCustomers: todayTotalVisitCustomers)
                break
            } else {
                let customer: Int = customerManager.matchBankerAndCustomer()
                bankerWorkProgress(customerNumber: customer)
            }
        }
    }
    
    private func bankerWorkProgress(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customerNumber)번 고객 업무 완료")
    }
    
    private func finishBank(todayTotalVisitCustomers: Int) {
        var workTime = Double(todayTotalVisitCustomers) * 0.7
        workTime = round(workTime * 100) / 100
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(todayTotalVisitCustomers)명이며, 총 업무 시간은 \(workTime)초 입니다.")
    }
}

// CustomerManager.swift
import Foundation

class CustomerManager {
    private lazy var customers: [Int] = visitCustomers()
    
    private func visitCustomers() -> [Int] {
        let randomCustomerNumber: Int = Int.random(in: 10...30)
        let customers = Array(1...randomCustomerNumber)
        
        return customers
    }
    
    func matchBankerAndCustomer() -> Int {
        let customer = customers.removeFirst()
        
        return customer
    }
    
    func countCustomers() -> Int {
        return customers.count
    }
}
```
- 피드백 반영
```
/// 변수 bankState -> bankOpenMenuState 이름 변경
/// 메서드의 반복문을 if문과 재귀 형식으로 변경
/// 메서드 choiceBankState -> bankOpenMenu 이름 변경
/// 메서드 bankWorkProgress의 상수 todayTotalVisitCustomers 이름 변경
/// visitCustomers 메서드 로직을 더 간결하게 변경
/// CustomerManager -> Customer 타입으로 변경 및 기능을 BankManager로 이전

```

- 피드백 내용 수정 후
```
import Foundation

class BankManager {
    func openBank() {
        let bankOpenMenuState: Bool = bankOpenMenu()
        var customers: [Customer] = visitCustomers()
        
        if bankOpenMenuState {
            bankWorkProgress(customers: &customers)
            
            openBank()
        }
    }
    private func bankOpenMenu() -> Bool {
        
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator : "")
            
            guard let inputNumber = readLine() else {
                return false
            }
            
            if inputNumber == "1" {
                return true
            } else if inputNumber == "2" {
                return false
            } else {
                print("잘못된 입력입니다, 다시 입력해주세요.")
            }
        }
    }
   
    private func bankWorkProgress(customers: inout [Customer]) {
        let TotalCustomersCount: Int = countCustomers(customers: customers)
        
        while true {
            let remainingCustomer: Int = countCustomers(customers: customers)
        
            if remainingCustomer == 0 {
                finishBank(todayTotalVisitCustomers: TotalCustomersCount)
                break
            } else {
                let customer: Int = matchBankerAndCustomer(customers: &customers)
                bankerWorkProgress(customerNumber: customer)
            }
        }
    }
    
    private func bankerWorkProgress(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customerNumber)번 고객 업무 완료")
    }

    private func finishBank(todayTotalVisitCustomers: Int) {
        var workTime = Double(todayTotalVisitCustomers) * 0.7
        workTime = round(workTime * 100) / 100
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(todayTotalVisitCustomers)명이며, 총 업무 시간은 \(workTime)초 입니다.")
    }
    
    private func visitCustomers() -> [Customer] {
        var result: [Customer] = []
        let waitNumbers: [Int] = Array(1...Int.random(in: 10...30))

        for number in waitNumbers {
            let customer: Customer = Customer(waitNumber: number)
            result.append(customer)
        }

        return result
    }
    
    private func matchBankerAndCustomer(customers: inout [Customer]) -> Int {
        let customer: Customer = customers.removeFirst()
        
        return customer.waitNumber
    }
    
    private func countCustomers(customers: [Customer]) -> Int {
        return customers.count
    }
}

// Customer.swift

import Foundation

final class Customer {
    let waitNumber: Int
    
    init(waitNumber: Int) {
        self.waitNumber = waitNumber
    }
    
}
```

## Step2
- TroubleShooting
