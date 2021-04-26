## Team 


### 🏢 은행 매니저 프로젝트 저장소

### 📱 by Jay, Neph

<br/>

[STEP 01] 콘솔 앱 구현

- 기본적인 은행 업무 구조를 구현하기 위해 은행, 은행원, 고객의 구조를 대략적으로 설계했습니다.

  ```swift
  은행
  
  - 개점 알림
  - 종료 알림
  - 번호표 출력
  
  Bank
  
  func openAlert()
  
  func closeAlert()
  
  func giveNumberTicket(to: Customer) -> Int
  
  은행원
  
  - 고객 업무 처리
  
  BankTeller
  
  func handleBanking()
  
  func startTask(customerNumber: Customer, completionHandler: ( ) -> Void) {
  
       print("\(customerNumber) 고객 업무 시작")
  
       completionHandler() 
  
  }
  
  func endTask(customerNumber: Customer) {
  
       print(\customerNumber 고객 업무 완료)
  
  }
  
  
  고객
  
  - 티켓을 가지고 있음
  
  Customer
  
  - ticketNumber (get only){
  
       return giveNumberTicket(to: Self)
  
  }
  ```

  🧐 고객의 ticketNumber 구현: ~~처음에는 ticketNumber를 메소드를 통해 할당하는 식으로 구현했습니다. 하지만 메소드가 하는 역할이 단순히 ticketNumber를 setting 해주는 것이기 때문에 Computed Property로 변경하게 되었습니다.~~ -> protocol은 let을 쓸 수 없어 Customer가 변하지 않는 고유의 대기번호를 갖는 것이 불가능했습니다. 새로운 설계가 필요합니다.

  >https://www.bignerdranch.com/blog/protocol-oriented-problems-and-the-immutable-self-error/

  🧐 Bank에 openAlert() 등을 작성하고 extension에 구현 vs extension에만 구현:

 