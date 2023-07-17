# 은행창구 매니저 🏦

## 은행의 은행원들이 고객들의 업무를 처리하는 앱
> 프로젝트 기간: 2023-07-10 ~ 2023-07-21

## 🕺 팀원
|와이|비모|
|:-:|:-:|
|<img height="200px" src="https://hackmd.io/_uploads/B12VWu0Kh.png">|<img height="200px" src="https://avatars.githubusercontent.com/u/67216784?v=4">
|[Github Profile](https://github.com/yy-ss99)|[Github Profile](https://github.com/bubblecocoa)|

</br>

## 📝 목차
1. [타임라인](#타임라인)
2. [실행화면](#실행-화면)
3. [시각화된 프로젝트 구조](#시각화된-프로젝트-구조)
4. [트러블 슈팅](#트러블-슈팅)
5. [참고링크](#참고링크)

</br>

<a id="타임라인"></a>

## 📆 타임라인  
<table>
    <thead>
        <th style="text-align: center;">날짜</th>
        <th style="text-align: center;">진행 사항</th>
    </thead>
    <tbody>
        <tr>
            <td>2023-07-10</td>
            <td>
                LinkedList를 위한 Node 생성 </br>
                LinkedList 생성 </br>
                CustomerWaitingQueue 생성 </br>
                Queue Unit Test 추가 </br>
            </td>
        </tr>
        <tr>
            <td>2023-07-12</td>
            <td>
                Node의 data에 private(set) 키워드 추가 </br>
                Queue Unit Test 몇 테스트 케이스 동적으로 변경 </br>
            </td>
        </tr>
        <tr>
            <td>2023-07-13</td>
            <td>
                BankClerk 구조체 생성 및 구현 </br>
                Customer 구조체 생성 및 구현 </br>
                Bank 구조체 생성 및 구현 </br>
                BankManager 구조체 구현 </br>
                main에서 BankManager의 selectMenu 호출 </br>
            </td>
        </tr>
        <tr>
            <td>2023-07-14</td>
            <td>
                매직 리터럴을 분리 </br>
            </td>
        </tr>
    </tbody>
</table>

</br>

<a id="실행-화면"></a>

## 🖥️ 실행 화면
|메뉴 선택|은행 개점|
|:-:|:-:|
|![잘못된 입력 종료](https://github.com/yagom-academy/ios-bank-manager/assets/124860690/59dc7349-2495-4834-a41f-f6f6dd1eff8a)|![은행업무](https://github.com/yagom-academy/ios-bank-manager/assets/124860690/e5a09ef5-32d1-4406-b027-17f9fab14eb0)|

</br>

<a id="시각화된-프로젝트-구조"></a>

## 👀 시각화된 프로젝트 구조

### 💎 클래스 다이어그램
프로젝트 진행에 따라 추가 예정

### 🗂️ 폴더구조
프로젝트 진행에 따라 추가 예정

</br>

<a id="트러블-슈팅"></a>

## 🚀 트러블 슈팅

### 1️⃣ XCode14.3에서 Unit Test를 하기 위한 방법의 변경

#### 🔍 문제점
`Xcode 14.3` 전후로 `Edit Scheme - Test` 메뉴의 구성이 달라졌습니다. 
- Xcode 14.3 전의 Edit Scheme Test 메뉴
![Xcode 14.3 전의 Edit Scheme Test 메뉴](https://hackmd.io/_uploads/Hk8_muAK3.png)
- Xcode 14.3의 Edit Scheme Test 메뉴
![Xcode 14.3의 Edit Scheme Test 메뉴](https://hackmd.io/_uploads/rJ1pGuCth.png)

이미지를 보면 `14.3버전` 이전의 `Test` 항목에서는 바로 `Tests`를 추가할 수 있습니다. 이때는 `Test Navigator`에서 `Tests`를 생성하면 자동으로 이곳에 추가되었던 것으로 기억합니다. 하지만 이후 버전에서는 `Tests` 항목은 추가할 수 없고 `Test Plans` 항목만 추가할 수 있습니다. 이것을 무시하고 테스트를 진행해 보았으나, 테스트가 프로젝트를 인식하지 못하는 이슈가 있었습니다.

#### ⚒️ 해결방안
1. 만약 `Test Navigator`에 접근했을 때 `Test Plan: {AppName}(AutoCreated)`라는 것이 보이면, 새로 `Test Plan`을 추가해주어야 합니다.
![](https://hackmd.io/_uploads/B13NPuAKh.png)
2. `AutoCreated`가 아닌 사용자 지정 `Test Plan`인 것을 확인했으면, 자신에게 원하는 `Test Target`을 생성합니다. (기존과 동일)
![](https://hackmd.io/_uploads/BkInPuAth.png)
3. 생성한 `Test Plan`을 열고 `+`버튼을 눌러 생성한 `Test Targer`을 추가합니다.
![](https://hackmd.io/_uploads/rkowOdCK3.png)

위 과정을 통해 다시 예전처럼 테스트를 진행할 수 있었습니다.

> **요약 : 이전과 달리 `Test Plan`이 꼭 필요합니다.**

</br>

### 2️⃣ 스레드를 0.7초간 멈추기 위한 방법

### 🔍 문제점

`sleep(_: UInt32)` 함수를 이용하려고 했으나, 함수의 파라미터로 `UInt32`타입을 받았기 때문에 소수점이 필요한 0.7초는 지정할 수 없었습니다. `usleep(_: useconds_t)` 함수의 경우 세부적인 시간을 지정할 수 있었으나, `1000000(백만)`이 1초를 의미했기 때문에 직관적으로 알아보기 어렵다고 생각했습니다. 

### ⚒️ 해결방안

`Thread.sleep(forTimeInterval:)` 함수를 사용할 경우 `Double` 파라미터로 받기 때문에 0.7초 동안 스레드를 멈출 수 있었습니다.

```swift
func work(customerNumber: Int) {
    print("\(customerNumber)번 고객 업무 시작")
    Thread.sleep(forTimeInterval: 0.7)
    print("\(customerNumber)번 고객 업무 완료")
}
```

<a id="참고링크"></a>

## 🔗 참고링크
- [🍎 Developer Apple - sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)