# 은행 창구 매니저 STEP3

---

## 키워드
* **`Concurrency Programming`**
* **`DispatchSemaphore`**

## 배운개념
* **`Concurrency Programming`** : 
**`DispatchQueue`** - main 또는 global() 을 통해서, 다중 쓰레드를 활용해 작업들을 동시적으로 처리할 수 있다.
**`sync`** - 호출한 쪽에서 `DispatchQueue`로 보낸 작업이 끝나기를 기다림.
**`async`** - `DispatchQueue`로 보낸 작업이 끝나기를 기다리지 않고, 바로 다음 작업 실행
* **`DispatchSemaphore`** :
`DispatchSemaphore(value:)`를 통해 원하는 `value`값을 가진 세마포어 생성이 가능하고, `.wait()` 및 `.signal()` 메서드를 통해 동시적으로 접근하고 있는 작업들의 수를 제한 할 수 있다.


## step3 기본 구현 방식


|1번 선택시|1번 제외 선택시|  
|:---:|:---:|  
|<img src="https://i.imgur.com/B3l8t9Q.gif" width="400"/>|<img src="https://i.imgur.com/rrO6J2x.gif" width="400"/>|  


## 궁금한점 🤔
* `playground` 환경과 `Command Line Tool`의 개발 환경의 차이점 : 
추후 업데이트 예정

## 고민한점 🤔
### 
처음에는 Banker 마다 각각 DispatchQueue.global()을 갖도록 정의해서 처리해보려 했습니다.
```swift
import Foundation

struct Customer {
    let task: Task
}

struct Banker {
    var task: Task
    let dispatchQueue = DispatchQueue.global()
    
    func startWork(_ customer: BankCustomer) {
        dispatchQueue.async {
            // do work..
        }
    }
}

func main() {
    var customers: Queue<BankCustomer> = [customer1, customer2, customer3 ...]

    let bankers = [Banker(task: .deposit), Banker(task: .loan), Banker(task: .deposit)]

    customers.forEach { customer in
        bankers.forEach { banker in
            switch customer.task {
            case .deposit:
                // 예금 은행원 업무 실행
            case .loan:
                // 대출 은행원 업무 실행
            }
            
        }
    }
}
```
다만 이러한 방식으로 진행했을 경우 경쟁상황 발생 및 동일한 업무를 가지고 있는 은행원끼리의 업무 분담 문제 (=> **한 은행원이 고객을 독차지**) 등이 발생해서, 결국 Banker마다 각각 인스턴스를 만들어주는 것이 아닌, 업무별로 DispatchQueue를 만들어주어, DispatchSemaphore로 작업 수를 제한해주는 방향으로 해결했습니다.
```swift
let depositQueue = DispatchQueue.global()
let loanQueue = DispatchQueue.global()

let depositSemaphore = DispatchSemaphore(value: 2)
let loanSemaphore = DispatchSemaphore(value: 1)

func main() {
    customers.forEach { customer in
        bankers.forEach { banker in
                         
            switch customer.task {
            case .deposit:
                depositQueue.async {
                    depositSemaphore.wait()
                    // 예금 업무 실행
                    depositSemaphore.signal()
                }
                
            case .loan:
                loanQueue.async {
                    loanSemaphore.wait()
                    // 예금 업무 실행
                    loanSemaphore.signal()
                }
            }
        }
    }
}
```

---
