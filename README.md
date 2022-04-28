# 💰ios-bank-manager

> 📅 프로젝트 기간 2022.04.25 ~ 2022.05.06 </br>
🎓 팀원 : [@grumpy](https://github.com/grumpy-sw) [@marisol](https://github.com/marisol-develop) / 👑 리뷰어 : 올라프

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [STEP 2](#step-2)
    + [기능설명](#기능설명)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [트러블슈팅](#트러블슈팅)


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## [STEP 2]
### 기능설명
- `struct Teller`: 고객과 업무처리에 걸리는 시간을 파라미터로 받아 업무를 처리하는 은행원
- `final class Customer`: 고객번호를 갖고있는 고객
- `struct Bank`: 은행원에게 일을 시키고, 고객을 줄세우는 은행
- `struct BankManager`: 콘솔앱을 작동시키기 위해 콘솔창에 메뉴를 출력하고 사용자에게 입력을 받는 구조체


### 고민한점
#### 1. Bank 인스턴스를 재사용할 수는 없을까?
- 사용자의 입력으로 은행개점이 되었을 때, 현재 코드에서는 그 때 마다 `Bank` 인스턴스를 새로 생성하여 업무 처리를 진행하고 있습니다. `BankManager`가 `Bank`를 프로퍼티로 가지면서 필요할 때마다 값을 설정하여 사용하는 게 더 나은 방법인지 고민이 되었습니다. 
```swift=
if input == bankOpenMenu {
    let bank = Bank(numberOfTeller, randomNumber(in: customerRange))
    ...
}
```

#### 2. Customer 타입은 struct로 해야할까 class로 해야할까?
- Customer 타입을 struct로 할지 class로 할지 고민했습니다. 기능상 struct이어도 되지 않을까해서 처음에 struct으로 구현을했었는데, 제네릭에 쓰일 타입은 프로토콜이나 클래스로 제한된다는 내용을 공식문서에서 발견했습니다. Node와 Linked List, Queue의 제네릭에 Customer 타입만 받기 위해서 Customer 타입을 class로 구현했습니다.

#### 3. n명의 은행원이 근무한다는 조건을 어떻게 구현할 것인가?
- 프로젝트의 요구사항에 은행 타입에는 n명의 은행원이 근무한다는 조건이 있지만, 은행원이 어떻게 고객의 업무처리를 돕는지에 대해서는 명시되어 있지 않습니다. 그래서 여러 가능성을 고민해봤지만 일단 콘솔 앱의 요구사항에 따라 단 한 명의 은행원이 근무한다고 가정했습니다. 결국 `numberOfTeller`로 은행원의 수를 관리하기는 하지만, Bank 타입에서는 하나의 `Teller` 인스턴스를 프로퍼티로 쓰고 있습니다.



### 배운개념
- Linked List
- Queue
- Generics
- Thread.sleep
- ClosedRange
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

