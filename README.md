# 💰ios-bank-manager

> 📅 프로젝트 기간 2022.04.25 ~ 2022.05.06 </br>
🎓 팀원 : [@grumpy](https://github.com/grumpy-sw) [@marisol](https://github.com/marisol-develop) / 👑 리뷰어 : [@올라프](https://github.com/1Consumption)

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [STEP 4](#step-4)
    + [기능설명](#기능설명)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [트러블슈팅](#트러블슈팅)


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## [STEP 4]

### 기능설명
- `enum NumberOfTask`: 업무별 처리할 수 있는 은행원의 수를 담고 있는 구조체 
- `enum WorkTime`: 업무별 처리 소요 시간을 담고 있는 구조체
- `struct Teller`: 고객과 업무처리에 걸리는 시간을 파라미터로 받아 업무를 처리하는 은행원
- `struct Customer`: 고객번호를 갖고있는 고객
- `struct Bank`: 고객을 줄 세우고, 업무별로 나누어 Teller들에게 동시에 일을 시키는 구조체
- `struct BankManager`: 콘솔앱을 작동시키기 위해 콘솔창에 메뉴를 출력하고 사용자에게 입력을 받는 구조체
- `enum TaskType`: 업무별로 String과 업무 시간을 갖고 있는 열거형
- `CustomerSendable`: 고객을 대기중 / 업무중으로 보내거나 대기중에서 삭제하기 위한 메서드가 명시된 프로토콜

### 화면 구성

![](https://i.imgur.com/NqFKByM.png)


### 고민한점

#### 🧐 1. 대기중에 있는 고객을 업무중으로 어떻게 보낼 수 있을까?
- 고객을 대기중에 보내고, 업무중에 보내고, 업무중에서 제거하기 위해 `CustomerSendable` Protocol을 생성했습니다. stackView의 subview들인 Label들을 배열로 받고, 배열을 돌면서 대기중에 있는 label의 text와 일치하면 removeFromSuperView를 해주는 방식으로 대기중에 있는 고객을 삭제하고 업무중에 새로 라벨을 추가해주었습니다. 업무중에 있는 고객을 제거할 때도 동일한 방법으로 했습니다.

#### 🧐 2. 초기화 기능을 어떻게 구현해야 할까?
- 프로젝트 문서의 내용은 다음과 같습니다.
    > 초기화 버튼을 누르면 대기중인 고객과 타이머 모두 초기화됩니다.

    저희는 이 중에서 대기 중인 고객을 초기화하는 방법이 쉽게 떠오르지 않아 많은 고민을 했습니다. 결국 뷰 컨트롤러에서 `bankManager`를 통해 직접 구현했던 큐의 `clear`기능을 호출하는 방법으로 구현했는데요, 이 기능을 위해 `private`하지 않은 추가적인 메서드가 생성된다는 게 너무 아쉬운 부분입니다.  

#### 🧐 3. Model과 ViewController를 어떻게 연결할까?
- Console App에서 구현한 Model를 UIApp의 ViewController에 어떻게 연결할지 고민했습니다. Notification Center과 Delegate Pattern을 생각해봤는데요, Notification Center는 알림을 받는 대상이 다수일때 쓰는 것이 적절하지 않을까 생각했습니다. Delegate Pattern을 구현하기 위해 CustomerSendable 프로토콜을 구현해서 
    - Customer가 enqueue 되는 시점
    - teller가 일을 시작하는 시점
    - 업무가 끝나는 시점
마다 ViewController에게 customer 정보를 알려주어, ViewController에서 StackView에 Subview를 추가하는 등의 적절한 행동을 해주도록 했습니다.

#### 🧐 4. 업무시간을 측정하는 Timer를 어떻게 구현해야 할까?
- 한 번에 하나의 입력만 처리할 수 있는 메인 쓰레드의 특성 상, 실시간으로 업무시간을 카운팅하기 위해서는 일정한 주기로 계속해서 UI를 갱신하는 함수를 호출해줄 것으로 생각했습니다. 그렇기 때문에 사용자가 화면을 클릭하고 아래로 스크롤을 하는 상황에서 (꾹 누르고 있기 때문에) 백그라운드로 해당 함수가 실행되어야 한다고 예상했고 따라서 백그라운드에서도 동작하는 `DispatchSourceTimer`를 사용하여 구현하였습니다.



### 조언을 얻고 싶은 부분
#### ❓ Console App의 파일을 UIApp에 어떻게 가져와야 할까?
- 처음에는 Add file to “BankManagerUIApp”을 써서 파일들을 가져오려고 했는데요, Xcode에 옮겨와지기는 하지만 디렉토리에는 해당 파일들이 생성되어 있지 않아서, 저희는 파일들을 모두 새로 생성해서 하나하나 복사붙여넣기로 옮겼습니다ㅠㅠ 혹시 다른 Xcode에 있는 .swift 파일을 가져올 수 있는 방법이 있을까요?


#### ❓ extension
- View를 구성하는 코드까지 전부 포함하다 보니 View Controller의 크기가 너무나도 커져버렸습니다. 이렇게 너무 많은 코드를 담고 있는 경우에 원하는 코드의 위치를 찾기가 쉽지 않았는데요, extension 단위로 파일 분리가 가능한 것으로 보이는데 이렇게 View Controller를 작은 단위의 여러 파일로 나누어도 괜찮은가요? 복잡한 파일을 나누어 필요한 부분만 쉽게 찾을 수 있다는 의견과 오히려 파일 분리가 여러 문제가 될 수 있다는 의견이 둘 다 맞는 것 같아 의견을 듣고 싶습니다.


### 배운개념
- DispatchQueue
- sync/async
- Notification Center
- delegate를 통한 데이터 전달
- DispatchSourceTimer
- Anchor
- NSLayoutConstraint

---
## 트러블슈팅

---



## 깃커밋 메세지

[chore]: 코드 수정, 내부 파일 수정.
[feat]: 새로운 기능 구현.
[style]: 스타일 관련 기능.(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
[add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시.
[fix]: 버그, 오류 해결.
[del]: 쓸모없는 코드 삭제.
[docs]: README나 WIKI 등의 문서 개정.
[mod]: storyboard 파일,UI 수정한 경우.
[correct]: 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
[move]: 프로젝트 내 파일이나 코드의 이동.
[rename]: 파일 이름 변경이 있을 때 사용합니다.
[improve]: 향상이 있을 때 사용합니다.
[refactor]: 전면 수정이 있을 때 사용합니다.
[merge]: 다른브렌치를 merge 할 때 사용합니다.


