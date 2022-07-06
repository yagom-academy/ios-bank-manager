# 은행창구 매니저 README

###### tags: `README`

### 제목: 은행창구 매니저

### 소개: 은행에 도착한 고객을 관리하는 앱

### 팀원

[보리사랑](https://github.com/yusw10) / [휴](https://github.com/Hugh-github)

### 타임라인

#### Week 1
- **2022-06-27(월)** 
  - 개인 공부
- **2022-06-28(화)** - STEP1 PR
  - STEP1 기능 구현 
  - Pull Request
- **2022-06-29(수)** 
  - STEP1 README.md 작성
  - STEP2 진행에 관련하여 논의
- **2022-06-30(목)** - STEP1 merge
  - STEP1 리팩토링
  - STEP1 Merged
  - STEP2 UML-ClassDiagram 작성
- **2022-07-01(금)**  - STEP2 PR
  - UML 기반으로 기능 구현
  - STEP2 기능 구현
  - PullRequest
  
#### Week 2
- **2022-07-04(월)** 
  - 동시성 프로그래밍 공부
- **2022-07-05(화)** - STEP3 PR
  - STEP3 기능 구현
  - Pull Request
- **2022-07-06(수)** 
  - UML 업데이트
- **2022-07-07(목)** - 
  - a
- **2022-07-08(금)** 
  - a

### UML

**Class Diagram**(STEP3 220706기준 업데이트)
![](https://i.imgur.com/E8GEwqJ.png)

### PR
[STEP1](https://github.com/yagom-academy/ios-bank-manager/pull/190)
[STEP2](https://github.com/yagom-academy/ios-bank-manager/pull/197#issue-1291010248)

### 기능 설명
- 양방향 연결 리스트를 이용해 은행에 도착한 고객의 임시 대기열 생성
- BankService 타입에서 고객 대기열을 생성하고 프로그램 로직을 시작하도록 메서드 구현
- BankManager 타입에서 고객 대기 번호와 고객대기열(Queue)타입을 관리 및 대기열에서 업무를 진행할 고객을 fetch하는 메서드 구현
- Operation을 이용해 고객의 업무를 처리
    - DispatchQueue 대신 Operation을 사용한 이유 : Operation 같은 경우 Custom이 가능해 좀 더 활용 범위가 넓다고 판단 및 유지보수 / DispatchQueue의 `DispatchSemaphore`를 사용하면 작업을 처리하는 Thread의 count를 개발자가 직접 해주어야 하기 때문에 실수를 유발할 수 있다고 판단
    - 예금 업무 같은 경우 `maxConcurrentOperationCount`를 사용해 일을 처리하는 Thread 제한
    
### 트러블 슈팅
- **양방향 연결 리스트의 dequeue**
  - 기존의 단방향 연결리스트의 경우 head를 그 다음 노드로 변경하고 head였던 노드의연결을 끊어주면되어 비교적 간단하게 구현할 수 있었습니다. 다만 저희가 구현한 양방향 연결리스트의 경우 이전 노드의 주소와 다음 노드의 주소를 모두 가지고 있기 때문에 어려움을 겪었습니다.
  - 저희는 head를 다음 노드로 옮긴 다음 현재 head의 이전 노드가 가지고 있는 다음 노드의 주소를 제거하고 현재 head인 노드의 이전 노드 주소를 제거해 주는 방식으로 해당 문제를 해결했습니다.
![](https://i.imgur.com/QkVczeY.png)

- **UML**
    - Bank와 BankManager에 역할에 대한 고민 
    - 휴 : 제가 생각한 방향은 BankManager가 고객 대기열을 관리해주고 Bank는 BankManager를 통해 고객의 업무만 받아와 업무를 처리하는 방식을 생각했습니다.
    - 보리: 저는 Bank가 고객 대기열의 관리 및 비동기처리까지 전반적인 코드의 흐름을 담당하고, BankManager는 말 그대로 은행원의 역할만 하도록 하여 업무처리 print()만 호출하도록 생각했습니다.
    - 결론 : 은행원이라는 존재를 후에 사용할 스레드에 대입해보았습니다. 은행이 은행원을 관리하는게 맞다고 생각했기 때문에 스레드를 관리하는 코드를 bank가 호출하고, 이 외의 부가적인 기능(고객 큐 관리)은 매니저가 따로 담당하는게 자연스럽다고 판단했고 이대로 UML작성을 진행 해 보았습니다. 

### 참고 자료
[개발자 소돌이](https://babbab2.tistory.com/86)
