# 💰ios-bank-manager

> 📅 프로젝트 기간 2022.04.25 ~ 2022.05.06 </br>
🎓 팀원 : [@grumpy](https://github.com/grumpy-sw) [@marisol](https://github.com/marisol-develop) / 👑 리뷰어 : [@올라프](https://github.com/1Consumption)

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [STEP 3](#step-3)
    + [UML](#UML)
    + [기능설명](#기능설명)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [트러블슈팅](#트러블슈팅)


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## [STEP 3]
### UML
![](https://i.imgur.com/CeHgaxp.png)

### 기능설명
- `enum NumberOfTask`: 업무별 처리할 수 있는 은행원의 수를 담고 있는 구조체 
- `enum WorkTime`: 업무별 처리 소요 시간을 담고 있는 구조체
- `struct Teller`: 고객과 업무처리에 걸리는 시간을 파라미터로 받아 업무를 처리하는 은행원
- `struct Customer`: 고객번호를 갖고있는 고객
- `struct Bank`: 고객을 줄 세우고, 업무별로 나누어 Teller들에게 동시에 일을 시키는 구조체
- `struct BankManager`: 콘솔앱을 작동시키기 위해 콘솔창에 메뉴를 출력하고 사용자에게 입력을 받는 구조체
- `enum TaskType`: 업무별로 String과 업무 시간을 갖고 있는 열거형


### 고민한점

#### 🧐 1. 은행원 3명이 근무하는 것을 어떻게 구현해야 할까?

3명의 은행원이 근무한다는 것은 3개의 스레드에서 일을 처리하는 것으로 이해했습니다. 그래서 동시에 공유된 자원에 접근하는 스레드의 수를 제한하는 DispatchSemaphore의 value를 예금업무의 경우 2, 대출업무의 경우 1로 제한해서 일을 처리하도록 했습니다. 이 DispatchSemaphore를 각각 depositWindow, loanWindow 네이밍으로 생성해서 예금 창구와 대출 창구에서 각각 업무를 처리하는 것으로 표현했습니다.

#### 🧐 2. 은행원에게 고객의 업무를 어떻게 시켜야 할까?

은행은 은행원에게 고객의 일을 처리하도록 시키는 `makeTellerWorkByTask(for  :)` 함수를 통해 은행원 구조체의 `work(for: )` 함수를 호출하고 있습니다. 처음엔 호출 시점이 겹쳐 `Thread.sleep()`함수가 문제를 일으키지 않을까 싶어 업무를 처리할 수 있는 은행원의 수만큼 은행원을 생성하고 Queue를 통해 돌아가면서 업무를 할당하는 방법을 고민했습니다. 그러나 글로벌 큐를 통해 별도의 스레드에서 실행되므로 문제가 되지 않는다고 생각되어 결국 하나의 `Teller` 인스턴스를 사용하는 방법으로 구현했습니다.


#### 🧐 3. DispatchSemaphore.wait()는 어느 시점에 호출해야 할까?
DispatchSemaphore를 사용할 때, semaphore의 count를 세야하기 때문에 스레드가 값에 접근했다고 알리는 메서드인 `wait()`와 일이 끝났다고 알리는 메서드인 `signal()`을 짝지어서 호출해야 한다고 배웠습니다. 야곰닷넷 예제에서는 async 내부에서 `wait()`를 호출한 다음 실행될 코드를 작성하고, 그 이후에 `signal()`를 작성해서 저희도 처음에는 async 코드블럭 내부에서 `wait()`를 호출했었는데요 그러다보니 스레드가 고객 수만큼 생성되는 현상이 있었습니다. DispatchSemaphore count가 제대로 카운팅되지 않는다는 생각이 들었는데요, 생각해보니 이미 async 코드블럭이 실행되기 시작하고나서 `wait()`을 호출하는 것은 의미가 없다는 생각이 들어서 async 코드블럭이 실행되기 직전에 `wait()` 메서드를 호출했더니 정상적으로 semaphore count가 작동했습니다.


#### 🧐 4. 고객 대기열을 순차적으로 실행해야 할까?
프로젝트 실행 예에 따르면 같은 예금업무임에도 불구하고 10번 고객의 업무가 1번 고객의 업무보다 먼저 실행되는 등 고객의 순서와 업무 처리 시작이 관계가 없어 보입니다. 저희는 고객의 번호가 곧 순서라고 이해했고 그렇지 않으면 Queue를 사용할 이유가 없다고 생각해서 다음 그림과 같이 비교적 고객 번호 순서대로 처리되도록 구현했습니다. 

![May-04-2022 12-29-40](https://user-images.githubusercontent.com/63997044/166619632-6050d3df-3bdb-4a8e-9ca5-29bd9382a9f2.gif)

### 배운개념
- Sync와 Async
- GCD
- Thread
- Dispatch Group
---
## 트러블슈팅

---



## 깃커밋 메세지

[chore]: 코드 수정, 내부 파일 수정.<br>
[feat]: 새로운 기능 구현.<br>
[style]: 스타일 관련 기능.(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)<br>
[add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시.<br>
[fix]: 버그, 오류 해결.<br>
[del]: 쓸모없는 코드 삭제.<br>
[docs]: README나 WIKI 등의 문서 개정.<br>
[mod]: storyboard 파일,UI 수정한 경우.<br>
[correct]: 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.<br>
[move]: 프로젝트 내 파일이나 코드의 이동.<br>
[rename]: 파일 이름 변경이 있을 때 사용합니다.<br>
[improve]: 향상이 있을 때 사용합니다.<br>
[refactor]: 전면 수정이 있을 때 사용합니다.<br>
[merge]: 다른브렌치를 merge 할 때 사용합니다.


