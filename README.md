# 🏦은행창구 매니저💰

## 💬 소개
> 자료구조 `Queue`를 활용해 은행에 도착한 대기열을 구현하고 1명의 은행원이 10~30명 사이의 고객의 업무를 1:1로 처리해주는 은행 콘솔앱입니다.

</br>

## 🔖 목차 

1. [팀원](#1.)
2. [타임 라인](#2.)
3. [시각적 프로젝트 구조](#3.)
4. [실행 화면](#4.)
5. [고민한 부분](#5.)
6. [트러블 슈팅](#6.)
7. [참고 링크](#7.)
8. [팀 회고](#8.)


---

</br>

<a id="1."></a>

## 1. 🎙️ 팀원

|[Karen ♉️](https://github.com/karenyang835)|
| :-: |
| <Img src="https://github.com/karenyang835/ios-bank-manager/assets/124643896/c1954254-be28-4f53-bbe1-5aa01a3d0922" width="250"/>|


---

</br>

<a id="2."></a>

## 2. ⏰ 타임 라인
> 프로젝트 기간 : 2023.07.10. ~ 2023.07.21.

|**날 짜**|**내 용**|
|:-:|-|
| 2023.07.10. |✴️ 자료구조 `Queue`를 활용해 임시 대기열 타입 구현 <br>|
| 2023.07.11. |✅ `CustomerWatingQueue`를 테스트 할 `QueueTest`를 구현<br> ✅ `LinkedList`를 테스트 할 `LinkedListTest` 구현   |
| 2023.07.12. |🖨️ `value`와 `element`를 `element`로 네이밍 통일 <br> 💥 `Node`를 `LinkedList`에 `nested type`로 수정 <br>    |
| 2023.07.13. |📝 프로젝트에서 필요로 하는 핵심기능 공부 - 시간 관련 `Thread.sleep`, `CFAbsoluteTimeGetCurrent` <br>    |
| 2023.07.14. |🖨️ `Queue`의 활용도를 넓히기 위해 `CustomerWatingQueue`에서 `Queue`로 변경 <br> ✴️ 은행 고객을 지칭하는 `Customer` 구조체 구현<br> ✴️ 은행을 지칭하는 `Bank` 구조체 구현 <br> ✴️ 은행원을 지칭하는 `Teller` 구조체 구현<br> ✴️ 전체적으로 컨트롤 할 `BankManager` 구조체 구현<br>|

---

</br>

<a id="3."></a>

## 3.📊 시각적 프로젝트 구조
### 📂 폴더 구조
![스크린샷 2023-07-14 오후 5 08 49](https://github.com/karenyang835/ios-bank-manager/assets/124643896/e3e3e361-b93e-4208-846f-e91db20caa67)
</br>

### 🎨 Class Diagram
</br>

![image](https://github.com/karenyang835/ios-bank-manager/assets/124643896/574f21d6-22dc-45d8-aaff-59426c337dda)

---

</br>


<a id="4."></a>

## 4. 📱실행 화면
| 1. 은행개점  |2. 종료 |
| :--------: | :--------: |
|<img src="https://github.com/karenyang835/ios-bank-manager/assets/124643896/0d032f79-42e8-4784-930f-5bd2bcf49add" style="zoom:80%;" />|<img src="https://github.com/karenyang835/ios-bank-manager/assets/124643896/19e7c683-40ca-4b60-8552-9dc753864697" style="zoom:80%;" />|

---

</br>

<a id="5."></a>

## 5. 🤔 고민한 부분
### 1️⃣ 왜 `LinkedList`와 `Queue`를 왜 각각 구현해야되는 걸까?
- 이 부분은 예전 '계산기'라는 프로젝트를 진행할 때도 의문이었던 부분이었는데 명확하게 해답을 찾지 못하고 지나갔었습니다. 그때는 자료구조를 왜 사용해야되는지가 가장 큰 의문이었고, 자료구조라는 것에 아직 익숙하지 않고 제대로 이해를 못했기 때문이라고만 생각하고 넘어갔었습니다. 그런데 이번 프로젝트에서 또 다시 맞닥뜨리니 이번에는 명확한 이유를 알고 작성을 해야되겠다는 생각이 들었습니다.
- 의문점은 `LinkedList`도 `Queue`도 자료구조의 한 종류이고 심지어 안에 구성도 메소드명만 다르지 역할은 동일하다 생각되어졌고, '하나만 구현하면 되는 것 아닐까?'라고 생각되어졌습니다. 왜 굳이 `LinkedList`를 활용해서 `Queue`를 또 작성을 해야되는지에 대해 의문이 들었습니다.

|**자료구조명**|**설 명**|
|:-:|-|
| **`Queue`** |•  선입선출(`FIFO`)<br> • 자료를 갖는 컨테이너 프로퍼티가 반드시 필요<br> • 삽입과 제거를 빠르게 수행하기 위해 사용|
| **`LinkedList`** |• 자체적으로 데이터를 관리하는 자료구조<br>• 임의의 위치에서 삽입과 제거가 가능한 자료구조<br> • 탐색 기능도 제공 <br>|

- `Queue`는 내부에 자료를 갖는 컨테이너를 프로퍼티로 반드시 하나를 갖고 있어야되고, `LinkedList`가 컨테이너의 역할을 하게 되는 것입니다. 즉, 필수적인 요소를 가지고 있어야 되는 프로퍼티가 존재하기에 그 부분을 `LinkedList`가 채워주어야되서 `LinkedList`와 `Queue`를 각각 구현해줘야 된다는 것을 알게 되었습니다.


### 2️⃣ Node를 따로 선언해 줄 필요가 있을까?
- `Node`는 `LinkedList`안에서만 활용되어지는데 굳이 따로 빼두어야할 지가 의문이었습니다. 그래서 `LinkedList`안에서만 활용되니 `LinkedList`안에 `nested type`으로 구현을 해주었습니다.


### 3️⃣ 업무 처리시간을 누가 가지고있어야 할까?
- 업무 처리시간을 고객이 가지고 있는게 맞을지 은행원이 가지고 있는게 맞을지 고민되었습니다. 고객이 어떤 업무를 할지를 가져오는거니까 고객이 요청하는 업무에 따라 처리 시간이 달라지니 고객이 가지고 있는게 맞는건가라고 잠깐 생각했었는데 은행원에게 고객이 업무를 전달하고 그 업무를 처리하는 것은 은행원이니까 업무 처리시간을 갖는 것은 은행원이 맞다고 생각되어졌습니다.


### 4️⃣ 업무처리 시간을 어떻게 적용시켜주어야 될까?
- 시간에 대해 적용시켜보는 것은 처음이라 어떻게 주어져야할지 고민되었습니다. 검색해보니 `sleep`과 `Thread.sleep`이렇게 두 가지가 있었습니다. 두 가지 모두 같은 기능을 한다고 되어있었는데 차이는 아래와 같습니다.

|**메서드명**|**내 용**|
|:-:|-|
| **sleep**    |•`static`타입 메서드 <br>  •`sleep`은 마이크로초(1/1000000초) 단위로 대기 시간을 지정  |
|**Thread.sleep**|•`class`타입 메서드 <br> •`Thread.sleep`은 밀리초(1/1000초) 단위로 대기 시간을 지정<br>|
- 이러한 차이로 인해 `Thread.sleep`을 사용할 때 대기 시간을 더 쉽게 조정할 수 있습니다.
또한 `Thread.sleep()`이 `Foundation FrameWork`의 `Thread class`에 정의된 메서드로 `swift`에 더 최적화 되어있다고 해서 해당 명령어로 진행했습니다.

---

</br>

<a id="6."></a>

## 6. 🚨 트러블 슈팅

### 1️⃣ `UnitTest`시 `import`해올 수 없는 문제

#### ⛔️ 문제점
- 테스트하려는 파일을 제대로 `import`하지 못하는 현상이 발생되어졌습니다.
![스크린샷 2023-07-14 오후 4 59 32](https://github.com/karenyang835/ios-bank-manager/assets/124643896/a2a501f0-8cd5-4fa1-9bbb-a00c7f3417b2)


#### ✅ 해결 방법
- 테스트하려는 파일의 `Targer Membership`에서 테스트하려는 곳을 체크해주어 해결했습니다.

|**오류 발생 시**|**오류 해결**|
|:-:|-|
| ![스크린샷 2023-07-14 오후 4 59 49](https://github.com/karenyang835/ios-bank-manager/assets/124643896/33faaa70-9059-4e75-bc8a-7f6dea71d152)|![스크린샷 2023-07-14 오후 5 11 17](https://github.com/karenyang835/ios-bank-manager/assets/124643896/3eb1737b-419f-4269-9a00-fce60e6cd01c)|




### 2️⃣ 콘솔창이 제대로 실행되지 않는 문제
#### ⛔️ 문제점
- 콘솔창에서 작성한 코드를 빌드하고 실행하려고 하니 다음과 같은 창이 뜨면서 빌드도 제대로 되지 않고 콘솔창 또한 볼 수 없는 문제점이 발생했습니다.
![스크린샷 2023-07-14 오후 4 49 06](https://github.com/karenyang835/ios-bank-manager/assets/124643896/bf90bb65-d47c-4f26-94ea-fd43c7feb9e1)


#### ✅ 해결 방법
- 빌드할 타겟을 `BankManagerConsoleApp`로 설정을 해주면 제대로 동작이 되었습니다.
![스크린샷 2023-07-14 오후 5 12 35](https://github.com/karenyang835/ios-bank-manager/assets/124643896/fc2460e9-6ddd-4662-bbf1-b156a9bc630b)


---

</br>

<a id="7."></a> 

## 7. 🔗 참고 링크

🍎 [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) <br>
🍏 [Apple Developer - sleep(_:)](https://developer.apple.com/documentation/swift/task/sleep(_:))<br>
🍏 [Apple Developer - Thread.sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)<br>
🍏 [Apple Developer - CFAbsoluteTimeGetCurrent()](https://developer.apple.com/documentation/corefoundation/1543542-cfabsolutetimegetcurrent)<br>

---

</br>

<a id="8."></a>

## 8. 💌 팀 회고

### 👏🏻 우리팀이 잘한 점
- 개인 공부를 충분히 하고 진행했습니다.
- 의문이 드는 사항에 대해서는 해답을 찾고 진행을 했습니다.


### 👊🏻 우리팀이 개선할 점
- 불규칙한 생활로 컨디션 관리를 못한 것 같습니다.


</br>
