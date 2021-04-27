# 🏢 은행 매니저 프로젝트 저장소

## 📱 by Jay, Neph

<br/>

### [STEP 01] 콘솔 앱 구현

- 기본적인 은행 업무 구조를 구현하기 위해 은행, 은행원, 고객의 구조를 대략적으로 설계했습니다.

  ```swift
  BankManager
  Bank
  BankTeller
  ConsoleViewController
  ```

  <br/>

  1. 🏢 Bank protocol

     - 은행이 numberTicket property와 두 함수를 갖습니다. numberTicket은 고객에게 배부할 대기 번호를 의미합니다. 

     - 🧐 numberTicket 구현 방식: 처음에는 computed property를 활용해서 extension에 아래와 같이 구현했습니다.

       ```swift
       var numberTicket {
         numberTicket += 1
         return numberTicket
       }
       ```

       하지만 생각한대로 동작하지 않았고 +1이 작동하지않아 메소드를 통해 구현하는 것으로 변경했습니다. extension에 구현된 computed property를 get 하는 로직에서 프로퍼티를 변경하는 것이 작동 안한 이유는 아직 잘 모르겠습니다. (self가 필요했을까..?)

       또한 numberTicket이라는 프로퍼티를 변경해야하므로 struct일 때 문제가 생겨 class로 한정한 프로토콜로 선언했습니다.

     - 은행 업무가 종료될 때 동작할 close 메소드를 구현했습니다. 

     - close 메소드에서 사용할 업무시간을 메소드를 통해 구현했습니다. 예상하기로는 업무가 다양해지고 업무마다 시간이 다르다면 0.7 부분을 변수로 처리해야하지 않을까 생각됩니다.

     - 티켓 번호를 초기화해주는 메소드를 구현했습니다. close 메소드 내에서 단순히 numberTicket = 0이라는 로직을 사용할 수 있었지만 의미가 명확하지 않아 메소드를 통해 의미를 보여주려고 했습니다. 

       🧐 Bank를 conform하는 클래스를 선언할 때 최초에 numberTicket을 0으로 만들어주는 로직이 있습니다. 이것 역시 resetNumberTicket을 활용해서 할 수 있지 않을까 생각했습니다. 0을 변수로 처리해주고, parameter에 초기값과 초기화할 대상을 넣어주는 메소드를 생각했는데 메소드를 이렇게 활용하는지 자체가 고민되서 구현하지 않았습니다.

     <br/>

  2. 🙋 BankTeller protocol

     - 은행원 프로토콜은 은행 업무를 처리하는 프로토콜로 구현했습니다. OperationQueue를 통해 업무 처리를 구현했습니다. 

       🧐 처음에는 각 업무를 Operation으로 구현했는데 알 수 없는 오류가 반복되어 발생되서 BlockOperation을 구현해서 오류를 해결했습니다.

     - sleep 함수가 parameter로 UInt를 받기 때문에 0.7초를 구현하기 위해서 millisecond를 parameter로 받는 usleep 함수를 사용했습니다.

       🧐 업무가 다양해지면 각 업무별로 다양한 처리 시간이 발생할 것 같고, 이 부분도 변수를 통해 처리해야하지 않을까 생각됩니다.

     <br/>

  3. 💿 ConsoleViewer protocol / Looper
     - 시작 메뉴를 출력하고 선택지가 1번인지 확인하는 메소드를 구현했습니다.

  <br/>

  🧐 STEP 01 전반적인 고민: POP를 처음 적용하며 구조에 대한 고민이 많았습니다. 은행, 은행원 등의 요소가 일반적인 상속 구조의 클래스보다 프로토콜로서 적합한지, POP를 접목하기 위해 이런식으로 구현하는 것이 맞는지를 Job, Cuttable의 예시를 참고하며 설득력을 갖추려고 했는데 그 부분이 가장 큰 고민이었습니다. 

