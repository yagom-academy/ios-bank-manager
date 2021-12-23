# 🏦 은행 창구 매니저 프로젝트

- 프로젝트 기간: [2주] 2021-12-20(월) ~ 2021-12-31(금)

- 캠퍼: 나무(@jsim27), 예거(@Jager-yoo)

- 리뷰어: 찌루루(@jae57)

<br>

# STEP 1 - Queue 타입 구현

## 고민한 점

### ☑️ LinkedList 구현
1. **단일 연결리스트 / 이중 연결리스트**
이중 연결 리스트로 구현하면 `중간에 있는 요소` 탐색 시 시간복잡도의 이익이 있습니다.
하지만 요구사항의 Queue 타입에서 필요로 하는 기능들은 `중간 요소`를 탐색할 필요가 없기에 단일 연결리스트로 구현했습니다.

2. **subscript 구현 여부**
1번과 같은 이유로, 인덱스를 통해 `가운데 요소`에 접근할 필요가 없기에 구현하지 않았습니다.

3. **Node 타입 정의**
Node는 LinkedList 내부에서만 사용되는 타입이기에 `private Nested Type`으로 구현했습니다.
`next` 프로퍼티를 통하여 참조되어야 하기에 `class`로 구현했습니다.

4. **class / struct**
단일 연결 리스트는 `head`와 `tail`이라는 Node를 저장 프로퍼티로 가집니다.
저장값이 많지 않은 가벼운 타입이기에 값 복사가 일어나도 성능상 문제가 없다고 생각했으며, 굳이 참조 타입으로 구현할 이유가 없기에 `struct`로 구현하였습니다.

5. **tail**
`tail`을 구현하면 마지막에 `append`한 요소에 쉽게 접근할 수 있는 이점이 있어서 `head` 이외에 `tail`도 구현했습니다.
또한, `tail`을 연산프로퍼티로 구현하면 접근할 때마다 O(n)의 연산을 해 주어야 하는데, 저장 프로퍼티로 구현하여 리스트에 요소가 추가될 때마다 `tail`을 갱신해주면 `tail`에 접근 할 때 성능적 이점이 있다고 판단하여 저장 프로퍼티로 구현했습니다.

### ☑️ Queue 구현
1. 구현한 LinkedList를 활용하여 요구사항대로 `enqueue`, `dequeue`, `clear`, `peek`, `isEmpty` 기능을 구현했습니다.
요구사항 외적인 기능은 구현하지 않는 것으로 결정했습니다.

### ☑️ UnitTest 작성
1. **유닛 테스트의 대상**
유닛 테스트의 대상은 외부에서 접근할 수 있는 요소에 대해서만 실행하는 것이 적절하다고 생각하여, Node, LinkedList에 대한 테스트는 작성하지 않고, 외부에서 사용할 Queue 타입에 대해서만 테스트를 작성, 수행했습니다.
2. **Mock 인스턴스 활용**
접근제어로 인해 Queue의 `list`에 접근하지 못합니다.
그렇기에 접근제어 설정을 하지 않은 MockQueue를 만들어 테스트에 활용했습니다.

<br>

## 🤔 궁금한 점

### ❓ CFGetRetainCount 메서드를 통해 디버깅 시 reference count가 추가로 하나 더 표시되는 이유가 뭘까요?

![](https://i.imgur.com/P6wGS8h.png)

- list 변수에 enqueue 메서드로 3개의 원소(1, 2, 3)를 append 해준 상태에서
- list 를 비우는 removeAll() 메서드가 잘 작동하는지 검증하기 위해 `RetainCount`를 직접 확인해보고 싶었습니다.
- head, tail 변수에 `nil`을 할당하기 전에 breakpoint를 걸고 tail 의 `RetainCount` 재보면 `3개`가 나왔습니다.
- 저희가 예상한 건 `2개`개 였는데요, 왜냐면 앞의 `Node().next`가 하나를 올려주고, 변수 tail 이 하나를 올려준다고 생각했어요.
- 그러면 왜 `3개`가 나올까요? 나머지 1개는 어디서 나온 건지 궁금했습니다.

🙋🏻‍♂️ 저희 가설은 `CFGetRetainCount` 메서드에서 tail을 전달하기 때문에 하나가 더 늘어난다는 것인데요, 저희가 생각한 이유가 맞는지 궁금합니다!

---

## 알게 된 내용

### ✅ 1. 모든 프로퍼티가 private 접근제어인 구조체의 초기화
구조체로 구현한 `LinkedList` 타입은 `private` 접근제어와 `옵셔널`이 부여된 2개의 인스턴스 프로퍼티 head, tail 을 가집니다.

```swift
private var head: Node<Element>?
private var tail: Node<Element>?
```

이때, 외부에서 `LinkedList` 타입의 초기화를 시도하는 경우, 멤버와이즈 이니셜라이저에서 파라미터가 보이지 않습니다. (`private` 접근제어로 인해 외부에서 프로퍼티 접근 불가)

```swift
private var list: LinkedList<Element> = LinkedList()
```

따라서 위와 같이 `list` 변수를 선언하면, head 와 tail 모두 자동으로 `nil`이 할당된 채로 초기화됩니다.

<br>

### ✅ 2. 유닛 테스트에서 sut 변수와 setUp, tearDown 메서드 활용

- `sut` = System Under Test

```swift
var sut: MockQueue<String>!

override func setUpWithError() throws {
    try super.setUpWithError()
    sut = MockQueue()
}

override func tearDownWithError() throws {
    try super.tearDownWithError()
    sut = nil
}
```

MockQueue 타입을 갖는 `sut` 변수를 `!(암시적 추출 옵셔널)`을 붙여 선언합니다.

`setUpWithError` 메서드는 각각의 테스트 메서드가 실행되기 전에 `sut` 변수에 MockQueue 타입을 초기화해서 할당합니다.

`tearDownWithError` 메서드는 각각의 테스트 메서드가 실행된 이후 `sut` 변수에 `nil`을 할당하여 다음 테스트를 동일한 조건에서 실행할 수 있도록 만듭니다.

<br>

### ✅ 3. TestDouble
> 테스트 더블이란 테스트를 진행하기 어려운 경우 이를 대신하여 테스트를 진행할 수 있도록 만들어주는 객체입니다. 테스트 더블에는 Dummy, Stub, Fake, Spy, Mock 등이 있습니다. 각각 역할이 다르지만, 명확하게 구분되지 않는 경우가 많습니다. 그렇기에 다른 테스트 더블을 아울러 Mock으로 통칭하기도 합니다. 
> 
> 출처: [Test Double - 야곰닷넷, by. 오동나무](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/lessons/%ed%85%8c%ec%8a%a4%ed%8a%b8%eb%a5%bc-%ec%9c%84%ed%95%9c-%ea%b0%9d%ec%b2%b4-%eb%a7%8c%eb%93%a4%ea%b8%b0/topic/test-double/)

저희 `MockQueue`의 경우에는 사실상 Stub에 가까운 역할인 것 같지만, 역시 명확히 들어맞는지는 모르겠기에 Mock으로 이름 지었습니다.

<br>

### ✅ 4. CFGetRetainCount

LLDB에서 `po CFGetRetainCount(객체)` 명령어로 클래스 인스턴스의 `RetainCount(참조 횟수)`를 확인할 수 있습니다.

<p align="center"><img src="https://i.imgur.com/CWdXNeO.png)" width="40%"></p>

<br>

### ✅ 5. breakpoint 작동 시점

특정 코드 라인에 breakpoint 를 걸어놨다면, 그 라인의 코드가 작동하기 `전에` breakpoint 가 작동합니다.
