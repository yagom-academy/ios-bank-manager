# iOS 커리어 스타터 캠프

### 은행 매니저 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

### step-1 구현
* class Node : 노드를 생성하는 클래스
* class LinkedList : LinkedList 자료구조를 만드는 클래스
* struct BankManagerQueue : LinkedList 클래스를 이용하여 Queue 자료구조를 만드는 구조체



![image](https://user-images.githubusercontent.com/52707151/127147493-c0895489-e349-4b75-aed0-4b902836fd2f.png)

---
### step-2 구현

* struct UserInteraction: 사용자의 입력값과, 결과를 출력해주는 타입 구현
* enum BankMessage: 문자열을 저장하고 있는 열거형 타입 구현
* class Banker: 고객의 대기열을 가지고, 일을 처리하는 Banker 타입 구현
* struct Bank: 고객의 대기열과, 은행원을 소유하고 있고 전체적인 은행업무를 담당하는 타입 구현
* Int + Extention: 하드코딩을 피하기위해 Int타입 Extention으로 사용할 정수값을 타입프로퍼티로 구현하였다.



![image](https://user-images.githubusercontent.com/52707151/127963289-9754b272-f889-483e-b3c4-2cac0cd2566e.png)
