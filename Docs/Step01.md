## 1️⃣ STEP 1
### STEP 1 Questions

#### `removeAll 시 head와 tail = nil 차이점`

- `removeAll` 시 `head`와 `tail` 둘다 `nil`을 해주었을 때, 원하는 대로 `Queue`에 쌓인 데이터들이 다 삭제가 되었습니다. </br>
`removeAll`의 내부 구현부에서 `head`와 `tail` 모두 `nil`로 처리하는 부분을, 각각 한쪽만 `nil`인 경우로 수정하여, 어떻게 변화되는지 확인해보았습니다.</br>
`lldb`에서 확인한 결과, `head`가 `nil`일 때, `tail`의 `prev`를 끝까지 타고 들어가보니, 여전히 `head`의 `data`가 남아있었습니다. 반대로, `tail`이 `nil`일 때 또한 마찬가지로, `head`의 `next`를 끝까지 타고 들어가보니, 여전히 `tail`의 `data`가 남아있었습니다. </br>
저희의 생각은 둘 중 하나를 `nil`처리를 하면 적어도, `nil`처리된 부분의 data 또한 `nil`로 변할줄 알았으나, 여전히 `data`가 남아있음을 발견하였습니다. 이것이 값 타입, 참조 타입의 문제인가 싶어, 모든 구조체를 클래스로 바꾸어보아도 같은 결과가 나타났습니다.</br>
이러한 결과가 나온것이 이해가 잘 안되어서 하리보의 생각을 여쭤보고 싶습니다!</br>
아래의 코드는 `lldb` 내용을 간단히 구현해본 것으로, `queue`의 `linkedList`의 `head`를 `nil`로 처리했을때, `data`는 `nil`로 처리되었으나, `tail`의 `prev`로 접근하여, `data`를 살펴보니 `nil`이 아닌 5의 값이 남아있는 것을 확인할 수 있었습니다.  

- 코드
    ```swift
    var queue = CustomerQueue<Int>()
    queue.enqueue(data: 5)
    queue.enqueue(data: 10)
    queue.linkedList.head = nil

    print(queue.linkedList.head?.data) // nil
    print(queue.linkedList.tail?.data) // Optional(10)
    print(queue.linkedList.tail?.prev?.data) // Optional(5)
    ```
    
---
#### `TDD 프로퍼티 생성 관련 질문`
- TDD에서 인스턴스화 시키는 과정에서 강제옵셔널을 피할 목적으로 2번 방법과 같이 코드를 작성해 보았는데 하리보는 1번과 2번방법 중 어느 것을 더 선호하시나요??

```swift
[1번 방법] : 강제 옵셔널 프로퍼티를 만들어서 setUpWithError와 tearDownWithError를 통해 초기화 및 해제
var sut: CustomerQueue<Int>!
var stringSut: CustomerQueue<String>!
    
override func setUpWithError() throws {
    sut = CustomerQueue<Int>()
    stringSut = CustomerQueue<String>()
}

override func tearDownWithError() throws {
    sut = nil
    stringSut = nil
}

[2번 방법] : 바로 인스턴스 생성
var sut = CustomerQueue<Int>()
var stringSut = CustomerQueue<String>()
```
---
#### `@testable import 모듈 탐색 오류`
- 현재, 각각의 `Node`, `LinkedList`, `CustomerQueue`에서 `CustomQueueTest`에 대하여 `target memebership`을 설정하여, `Unit Test` 과정에서 해당 클래스, 구조체 등의 프로퍼티와 메서드에 접근하고 있습니다.
- `target membership`을 각각의 파일에서 설정하기보다는, 각각의 파일들이 포함된 `BankManagerConsoleApp` 모듈을 `@testable import`를 통하여 가져온다면, 파일 내 프로퍼티와 메서드에 손쉽게 접근할 수 있다고 판단하였습니다.
- 하지만, 타겟 멤버쉽을 모두 해제하고, `@testable import`만 사용한 결과, 아래와 같이 모듈을 찾지 못하는 문제에 직면하였습니다.
- 예시 사진
    <img width="1368" alt="Untitled" src="https://user-images.githubusercontent.com/99063327/176124833-769103c0-9b89-4bf8-87cc-b5ee65b3ee5c.png">
- 해당 문제의 원인을 탐색해본 결과, 아키텍쳐 관련 문제로 추정이 되는데, 이를 해결하는 방법들을 블로그들을 통해 수행해보았으나, 해결하지 못했습니다.
- 혹시 하리보께서 이를 해결하시는 방법을 아시는지 궁금합니다!


### STEP 1 Answers

---
### STEP 1 TroubleShooting
    
#### `SwiftLint적용`

같은 프로젝트 내 라이브러리 적용 시 별도의 설정 없이는 `main.swift`만 적용되었는데 
`.swiftlint.yml` 파일에서 어떠한 디렉토리에 라이브러리를 적용할지 설정하고 나서 해결되었다.
- M1 MAC CocoaPods 다운로드
```shell
sudo arch -x86_64 gem install ffi
"${PODS_ROOT}/SwiftLint/swiftlint"
```
- 라이브러리 적용 디렉토리 설정
```shell
included:
  - BankManagerConsoleApp
```
---
    
### STEP 1 Concepts
- `UML`
- `Dependency Manager`, `SwitLint`, `CoCoaPods`, `gitignore`
- `TDD`
- `Node`, `LinkedList`, `Queue`
- `Generics`
---
### STEP 1 Reviews And Updates
    
[STEP 1 Pull Request]()
