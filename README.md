# 은행 창구 매니저 💸

## 목차 🪧
- [소개 📑](#소개-)
- [팀원 🤼‍♂️](#팀원-%EF%B8%8F)
- [프로젝트 구조 🏗](#프로젝트-구조-)
- [구현 내용 🧑‍💻](#구현-내용-)
- [실행 화면 📱](#실행-화면-)
- [핵심 경험 💡](#핵심-경험-)
- [트러블 슈팅 [Step 2] 🧐](#트러블-슈팅-step-2-)
- [참고 링크 🔗](#참고-링크-)
<br>

## 소개 📑
> 은행에서 은행원이 업무를 처리하는 콘솔 앱을 만드는 프로젝트
 
<br>

## 팀원 🤼‍♂️
> 안녕하세요 ! 은행 창구 매니저 프로젝트를 함께하는 **`Junf`**  🤷🏻‍♀️ 🙋🏻‍♂️ 입니다 ! 🍊
> 
|bonf| Judy|
|:-------:|:--------:|
| <img src="https://i.imgur.com/yGJljLR.jpg" width="350" height="350"/> |  <img src="https://i.imgur.com/SUeFi0b.jpg" height="350"/>    |
|@apwierk2451|@Judy-999|

- 리뷰어: 콘🌽(@protocorn93) 

## 프로젝트 구조 🏗
### UML

 <img src="https://i.imgur.com/1A2v0BE.png" width="700" height="550"/>
<br>

## 구현 내용 🧑‍💻
### [STEP1]
#### Node
> 단방향 연결 리스트의 노드
- `value`: Generic 타입을 갖는 프로퍼티
- `next`: 단방향 LinkedList의 다음 노드를 가리키는 프로퍼티
- `static func == () -> Bool`: 노드 2개가 같은 지 비교하는 메서드
<br>

#### LinkdedList
> 단방향 연결 리스트
- `head`: 첫 번째 노드를 가리키는 프로퍼티
- `tail`: 마지막 노드를 가리키는 프로퍼티
- `isEmpty`: 리스트가 비어있는지에 Bool값을 반환하는 연산 프로퍼티
- `firstNode`: 첫 번째 노드를 반환하는 연산 프로퍼티
- `append`: 맨 뒤에 새로운 노드를 추가하는 메서드
- `removeHead`: 맨 앞 노드를 꺼내는 메서드
- `removeAll`: 모든 노드를 삭제하는 메서드
<br>

#### Queue\<T>
> 연결 리스트를 이용한 큐
- `list` : 큐의 리스트
- `isEmpty`: 큐가 비어있는지 Bool값을 반환하는 연산 프로퍼티
- `peek` : 큐의 첫 번째 값을 반환하는 메서드
- `enqueue` : 큐의 맨 뒤에 값을 삽입하는 메서드
- `dequeue` : 큐의 첫 번째 값을 꺼내는 메서드
- `clear` : 큐를 비우는 메서드
<br>

### [STEP2]

#### Banker
> 업무를 보는 주체인 은행원 구조체
- `serve(customer: Customer)`: 고객을 상대로 업무를 처리하는 메서드

#### BankManager
> 은행의 일을 관리하는 관리자(=BankManager) 구조체
- `openUpBank`: 은행 개점 여부를 묻는 메서드
- `selectWork(_ status: String)`: 은행 개점 여부를 선택하는 메서드
- `startBanking`: 업무 시작을 지시하는 메서드

#### Bank
> 은행 구조체 
- `banker`: 은행에 있는 은행원을 나타내는 프로퍼티
- `customer`: 은행에 온 고객들의 대기열을 나타내는 프로퍼티

#### Customer
> 고객을 나타내는 구조체
- `number`: 고객의 번호를 나타내는 프로퍼티

<br>

## 실행 화면 📱
![console](https://user-images.githubusercontent.com/95114036/176831382-006e7026-518e-4d28-8ff2-7d023749c880.gif)

<br>

## 핵심 경험 💡
- [x]  Linked-list 자료구조의 이해 및 구현
- [x]  Queue 자료구조의 이해 및 구현
- [x]  Generics 개념이해 및 적용
- [x]  Queue의 활용
- [x]  타입 추상화 및 일반화

<br>

## 트러블 슈팅 [Step 2] 🧐
### 1. do-ctach와 while의 순서
**Queue**에서 `dequeue`를 실행했을 때 큐가 비어있어 값을 꺼낼 수 없으면 `nilOfValue` 에러를 던지도록 했습니다. 그렇기 때문에 **BankManager**에서 업무를 처리하는 `startBanking` 메서드에서 고객 대기열에서 한 명씩 `dequeue`할 때 에러처리가 필요했습니다.

모든 고객의 업무를 보기위해 큐의 `isEmpty`가 `true`일 때까지 `dequeue`를 반복하도록 해주었는데 While 반복문과 do-catch 에러처리 순서에 대해 고민했습니다.

```swift
// 첫 번째 방식: do 안에서 while 문을 돌기
do {
    while !(bank.customer.isEmpty) {
        let customer = try bank.customer.dequeue()
        bank.banker.serve(customer: customer)
    }
} catch {
    //...
}

// 두 번째 방식: while 문 안에서 do-catch 실행
 while !(bank.customer.isEmpty) {
    do {
        let customer = try bank.customer.dequeue()
        bank.banker.serve(customer: customer)
    } catch {
        //...
    }
}
```
두 방법 모두 실행 결과는 동일하다고 생각했습니다. 현재 프로젝트에서는 두 번째 방식을 선택했습니다.
<br>

### 2. 실제 작업 시간 vs 단순 계산 시간
요구사항에 모든 고객의 업무를 처리하면 `"총 업무시간은 --초입니다."`라고 출력하도록 되어있습니다. 업무 시간을 구하기위해 업무를 처리하는 함수인 `startBanking`가 시작하고 끝나는 시간을 타이머로 비교해야 하는지 고민했습니다. 하지만 업무처리에 0.7초씩 텀이 있도록 했지만 실제로 함수가 돌아가는 시간이 0.7초가 아니기 때문에 은행의 업무시간과는 의미가 맞지 않다고 생각하여 단순히 `0.7 * 고객수`를 업무시간으로 사용했습니다.


```swift
let workingTime = String(format: "%.2f", customerNumber * 0.7)
```
더불어 요구사항에서 소수점 두 자리까지만 나오도록 되어 있어 String의 format을 사용하여 적용했습니다.
<br>

### 3. 고객 대기열 만드는 함수의 위치
고객의 대기열을 만드는 `createCustomerQueue`함수의 경우 개발자가 해주는 역할이라고 생각하였습니다.
왜냐하면 몇 명의 고객이 올 지는 bankManager도 bank도 모르는 일이기 때문입니다.
우선적으로 main 파일에 넣었습니다.
<br>

### 4. 업무처리 시간
다음 코드와 같이 은행원이 고객 1명을 처리하는 시간을 0.7초로 잡기 위해 `usleep`메서드를 사용하였습니다.
```swift
func serve(customer: Customer) {
    print("\(customer.number)번 고객 업무 시작")
    usleep(useconds_t(700000))
    print("\(customer.number)번 고객 업무 완료")
}
```

delay를 주는 다른 방법을 찾는 중에 dispatchQueue를 이용하여 delay를 주는 방법을 발견하였는데 작동을 하지않았습니다. dispatchQueue를 이용하였을 때 작동을 하지 않아서 공부가 더 필요합니다.

```swift
func serve(customer: Customer) {
    print("\(customer.number)번 고객 업무 시작")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
        print("\(customer.number)번 고객 업무 완료")
        // 1초 후 실행될 부분인데 delay 없이 프로그램이 종료 되어버림
    }
}
```

<br>

## 참고 링크 🔗
[Generics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)<br>
[Equatable](https://developer.apple.com/documentation/swift/equatable)<br>
[Queue](https://github.com/raywenderlich/swift-algorithm-club)
