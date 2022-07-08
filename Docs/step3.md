# Step3 

### 1. 작업 내용
- CustomerQueue에 쌓여있는 손님들을 한명씩 빼서 각 손님마다 원하는 업무에 맞게 해당 업무 줄로 보내주었습니다.
- 각각의 업무 줄은 CustomDispatchQueue로 만들어 주었습니다.
- 대출담당 큐에서는 접근가능 스레드 수의 제한을 1로 설정 해주었습니다.
- 예금담당 큐에서는 접근가능 스레드 수의 제한을 2로 설정 해주었습니다.
---
- Business Enum 타입 선언
    - loan
        - name
        - processTime
    - deposit
        - name
        - processTime
- Business 별 CustomDispatchQueue 상수 생성 
    - loanBusinessQueue
    - depositBusinessQueue 

- Business 별 DispatchWorkItem 생성
    - `makeWorkItem()` 메서드 이용
    - loanWorkItem
    - depositWorkItem
- 작업시간 측정 
    - CFAbsoluteTimeGetCurrent() 를 이용하여 handleCustomer 메서드의 시작과 끝에 선언해주어 메서드 실행 시간을 측정 해주었습니다.

### 2. 스텝 핵심 경험

- [x] 동시성 프로그래밍 개념의 이해
- [x] 동시성 프로그래밍을 위한 기반기술(GCD, Operation) 등의 이해
- [x] 스레드(Thread) 개념에 대한 이해
- [x] GCD를 활용한 동시성 프로그래밍 구현
- [x] 동기(Synchronous)와 비동기(Asynchronous) 동작의 구현 및 적용

### 3. 고민한 점
<details>
<summary> 자세히 </summary>
<div markdown="1">

1. 이번 프로젝트의 조건이 은행원 3명이 동시에 업무를 하기 때문에 큐와 스레드를 어떻게 적절하게 분배해줄지에 대해서 고민했습니다. 첫 번째 생각한 방법은 큐를 1개로 설정해주고 큐에서 스레드 3개로 보내는 것을 은행원 3명이라고 보는 방법이었고, 두 번째는 큐를 2개로 설정해서 하나의 큐는 loan 업무를 하고 하나의 큐는 deposit 업무를 하도록 나누어주는 방법이었고, 세 번째는 큐를 3개로 설정해서 각 큐를 은행원이라고 보는 방법이었습니다.
    - 이 중에서 저희는 큐를 예금 업무를 하는 큐, 대출 업무를 하는 큐 두개로 나누어주어 예금 업무를 하는 큐는 semaphore value를 2로 지정해주어 공유자원에 접근하는 스레드가 2개가 되도록 해주었습니다. 마찬가지로 대출 업무를 하는 큐는 semaphore value를 1로 지정해주어 공유자원에 접근하는 스레드가 1개가 되도록 해주었습니다.
    - 아래 그림과 같이 큐와 스레드의 구조를 작성해봤는데 잘 작성한 것인지 라이언에게 여쭤보고 싶습니다.
    
 ![image](https://user-images.githubusercontent.com/98514397/177487869-9b899ec7-2e62-4801-83df-6561e8bcdc6a.jpeg)
     
- 추후 리팩토링 후 수정 예정
</div>
</details>

### 4. Trouble Shooting
- end message가 출력되는 위치에 대한 오류
- 맨 처음에 group을 사용하지 않고 출력을 했더니 아래와 같은 오류가 발생
    
[오류 발생한 콘솔창]
<img width="663" alt="스크린샷 2022-07-06 오후 4 03 34" src="https://user-images.githubusercontent.com/98514397/177489752-91345ea6-fbe4-4d26-847a-4abca3d3942f.png">

- 큐의 작업들이 모두 끝난 뒤에 업무 그룹으로 묶인 작업들이 언제끝나는지에 대해 시점을 알고, 그 이후에 end message를 `group.wait()`을 사용해주었습니다.
- 결론적으로 아래와 같이 정상적으로 end message가 출력되는 것을 확인할 수 있었습니다.

<img width="638" alt="스크린샷 2022-07-06 오후 4 08 23" src="https://user-images.githubusercontent.com/98514397/177490554-dd3c5182-aa6c-4084-ac39-0495b710ff2e.png">

### 5. 배운 키워드
`CFAbsoluteTimeGetCurrent`, `DispatchGroup`, `DispatchSemaphore`, `DispatchWorkItem`, `CaptureList`


