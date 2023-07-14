# 🏦 은행창구 매니저 🏦 -  Yetti ☃️, Redmango 🥭

## 📖 목차
1. [프로젝트 소개](#-프로젝트-소개) <br>
2. [팀원](#-팀원) <br>
3. [타임 라인](#-타임-라인) <br>
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조) <br>
5. [트러블 슈팅](#-트러블-슈팅) <br>
6. [참고 링크](#-참고-링크) <br>

</br>

## 🏦 프로젝트 소개
은행에 고객이 왔을 때 고객들의 업무에 따라 은행원들이 각자의 업무를 처리해주는 앱
> 프로젝트 기간 23/07/10 ~

</br>

## 👨‍💻 팀원
| ☃️Yetti☃️ | 🥭Redmango🥭 |
| :--------: | :--------: |
| <Img src =  "https://hackmd.io/_uploads/rJj1EtKt2.png" width="200" height="200"> | <Img src = "https://hackmd.io/_uploads/HJ2D-DoNn.png"  width="200" height="200"> |
|[Yetti's Github](https://github.com/iOS-Yetti) |[Redmango's Github](https://github.com/redmango1447) |

</br>

## ⏱️ 타임라인
|날짜|내용|
|:--:|--|
|2023.07.10.| - Linked List 기본 기능 구현
|2023.07.11.| - 유닛테스트 코드추가
|2023.07.12.| - Pull Request 작성 |
|2023.07.13.| - Bank, Banker, Customer 타입 구현 |
|2023.07.14.| - 타입 별로 기능 분리 |



</br>

## 👀 시각화된 프로젝트 구조
### 🌲 File Tree
```
BankManagerConsoleApp
├── main
├── BankManager
├── Bank
├── Banker
├── Customer
├── CustomerQueue
├── LinkedList
└── Node

BankManagerUIApp
├── BankManagerUIApp
|    ├── App
|    |    ├── AppDelegate
|    |    └── SceneDelegate
|    ├── Model
|    |    ├── BankManager
|    |    ├── CustomerQueue
|    |    ├── LinkedList
|    |    └── Node
|    ├── View
|    |    ├── Main.storyboard
|    |    └── LaunchScreen.storyboard
|    ├── Controller
|    |    └── ViewController
|    └── Resoruce
|         └── Asset.xcassets
├── BankManagerUIAppTests
|    ├── CustomelQueueTests
|    └── BankManagerUIAppTests
└── BankManagerUIAppUITests
     └── BankManagerUIAppUITests
```
### 📐 Diagram
![](https://hackmd.io/_uploads/SyR2cD0F2.png)
</br>

## 🧨 트러블 슈팅
###### 핵심 트러블 슈팅위주로 작성하였습니다.
1️⃣ **파일 복사시 참조** <br>
-
🔒 **문제점** <br>
- 기존 step1의 Queue와 관련 타입을 모두 UIApp에 구현하였습니다만 step2는 ConsolApp에서 Queue를 이용해 구현을 시도해보라고 하였습니다. 이 경우 ConsolApp에서 Queue및 관련 타입을 찾지 못하는 문제가 발생했습니다.

🔑 **해결방법** <br>
- 생각해낸 해결 방법은 2가지로
1. ConsolApp에서  UIApp과 똑같은 이름의 파일을 만들고 코드를 복사,붙여넣기 한다.
2. UIApp에서 ConsolApp으로 Xcode를 이용해 복사하되 Create Folder Referances를 선택하고 Copy items if needed를 체크해제한다. 즉 원본 파일을 참조하는 파일을 ConsolApp내부에 만들되 실제 폴더에서 파일이 생성되진 않게 한다.

저희는 둘 중 2번째 방법으로 진행하였습니다. 추후에 어떻게 될진 모르지만 복사한 대상인 Queue와 LinkedList, Node 타입은 자료구조의 일종으로 두 개의 App에서 별개의 작동원리를 가지고 있지 않을 것으로 예상되고 또한 추후 변형될 여지도 적다고 생각했기 때문입니다.

<br>

## 📚 참고 링크
- [inout 파라미터의 활용](https://hyunsikwon.github.io/swift/Swift-Inout-01/)
- [sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
