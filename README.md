# 💰ios-bank-manager

> 📅 프로젝트 기간 2022.04.25 ~ 2022.05.06 </br>
🎓 팀원 : [@grumpy](https://github.com/grumpy-sw) [@marisol](https://github.com/marisol-develop) / 👑 리뷰어 : 올라프

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [트러블슈팅](#트러블슈팅)


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## [STEP 1]
### 고민한점
#### 1. Node와 LinkedList, 그리고 CustomerQueue를 구현할 때 클래스와 구조체 중 어떤 타입을 사용해야 할까?
- 클래스와 구조체를 선택할 때 여러 기준이 있지만 어떤 데이터를 포함하고 저장소의 역할을 한다면 클래스를, 틀의 기능을 한다면 구조체를 선택할 것 같습니다. Node와 Linked List는 자료구조의 역할을 하기 때문에 클래스로, CustomerQueue는 Linked List를 포함하고 이를 활용하는 특수한 큐라고 생각되어 구조체로 구현하였습니다.

#### 2. Unit Test 실행시 발생하는 Undefined symbols for architecture arm 64를 어떻게 해결해야할까?
- symbol을 찾을 수 없다는 내용의 오류가 발생해서 구글링해보니, Targets-Build Phases-Compile Sources에서 Test에서 사용할 함수가 포함된 파일이 리스트에 있는지 확인하고 추가를 해야한다는 내용이 있었습니다. 실제로 QueueTest 타겟의 Compile Sources에 QueueTest.swift 자기자신의 파일만 있어서, 테스트에 필요한 다른 파일들도 추가해주었더니 정상적으로 테스트가 실행되었습니다.

#### 3. main.swift 파일이 없으면 왜 빌드가 안될까?
- swiftlint 라이브러리를 이번 프로젝트에 포함시켜서, main.swift 파일에 swiftlint의 내용을 테스트하기 위한 코드만 작성을 했었습니다. 테스트를 해보고 나서 main.swift 파일을 삭제했는데 오류가 발생했었습니다. 그 이유를 찾아보니 프로그램은 Entry Point(프로그램의 시작 지점)을 찾아 그 곳에서부터 시작하고 애플 공식 문서에서는 `the main attribute, the NSApplicationMain attribute, the UIApplicationMain attribute, a main.swift file, or a file that contains top-level executable code.`이렇게 다섯 가지 경우 Top-Level Code인 Entry Point로 인식한다고 합니다. 콘솔 앱에서는 main.swift 파일이 Entry Point(프로그램의 시작 지점)의 역할을 하기 때문에 파일을 다시 생성하여 해결했습니다.

#### 4. 외부에서 쓰이지 않는 데이터들의 접근 제어 수준 설정?
- Node의 data, LinkedList의 head, tail, count들은 선언한 곳 외부에서는 읽어오기만 하면되고, 쓰일 필요는 없다고 생각했습니다. 그래서 이런 프로퍼티들은 private(set) var로 선언해주었습니다.

#### 5. swiftlint 라이브러리의 규칙 중 사용하지 않고 싶은 규칙이 있을 때 어떻게 해야할까?
- 스위프트 스타일과 컨벤션을 관리하는 swiftlint 라이브러리를 import했는데요, 메서드와 메서드 사이를 공백으로 구분해주고 싶은데 "Trailing Whitespace Violation" 경고가 떠서 swiftlint의 README파일에 있는 내용을 참고하여 아래와 같이 해당 규칙을 무효화하려고 했습니다.
```swift=
// swiftlint:disable:next trailing_whitespace
var count: Int {
    return list.count
}
...
// swiftlint:disable:previous trailing_whitespace
```
하지만 계속 경고가 뜨고 있어서, BankManagerConsolApp에 .swiftlint.yml에 무효화할 규칙으로 trailing_swhitespace를 추가하여 해결했습니다.
```
disabled_rules:
    - trailing_whitespace
opt_in_rules:
included:
excluded:
```

첫번째에 시도했던 방법도 swiftlint의 README에 있었던 방법인데 왜 적용이 되지 않았을까요?🥲

 ![](https://i.imgur.com/qnPel61.png)

### 배운개념
- Linked List
- Queue
- 의존성 관리 도구 (CocoaPods, Carthage, SPM)

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

