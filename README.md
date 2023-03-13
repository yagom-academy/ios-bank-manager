# iOS 커리어 스타터 캠프
# 💰 은행창구 매니저

> 프로젝트 기간: 2023.03.06 ~ 2023.03.10
> 
> 팀원: 👨🏻‍💻[kaki](https://github.com/kak1x), 👨🏻‍💻[송준](https://github.com/kimseongj) | 리뷰어: 👨🏻‍💻[도미닉](https://github.com/AppleCEO)
> 
> 은행창구 매니저 콘솔 앱 구현


## 목차
1. [타임라인](#-타임라인)
2. [프로젝트 구조](#-프로젝트-구조)
3. [실행 화면](#-실행-화면)
4. [트러블 슈팅](#-트러블-슈팅)
5. [참고 링크](#참고-링크)

<br/>

# ⏰ 타임라인
<details>
    <summary><big>타임라인</big></summary>
- 23.03.06 (월): Linked List Queue 구현, Unit Test 구현 (STEP1 PR)
<br>
- 23.03.07 (화): STEP1 리뷰 사항 수정 (Refactor)
<br>
- 22.03.08 (수): BankManager 구현 및 실행 (STEP2 PR)
<br>
- 22.03.09 (목): STEP2 리뷰 사항 수정 (변수명 수정, 함수 분리)
<br>
- 22.03.10 (금) : DispatchQueue로 은행업무 구현 (STEP3 PR)

</details>
<br/>
<br/>
    
# ✍🏻 프로젝트 구조
<details>
    <summary><big>폴더구조</big></summary>
<img src = "https://i.imgur.com/pJI0Ku0.png">
    </details>
    
<br/>
<br/>

# ✨ 실행 화면

### 은행개점 (프로그램 실행)
![](https://i.imgur.com/z4IeSTo.png)

### 종료 (프로그램 종료)
![](https://i.imgur.com/bXpbyvm.png)



# 🔥 트러블 슈팅
### 1. 테스트 코드 작성 시 given과 when 구분
>아래와 같이 테스트 코드 작성 시 `given`과 `when`에 무엇을 적어야할지 고민했습니다. `given`은 어떤 상황이 주어지고, `when`은 어떤 코드를 실행한다고 배웠습니다. 이 부분에 있어`enqueue`메서드는 `given`인지, `when`인지 헷갈렸습니다.

```swift
// 1번
func test_dequeue됐을경우_처음_enqueue된_데이터가_반환된다() {
        // given
        let expectation = "hello"
        // when
        sut.enqueue("hello")
        sut.enqueue("kaki")
        sut.enqueue("songjun")
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }

// 2번
func test_dequeue됐을경우_처음_enqueue된_데이터가_반환된다() {
        // given
        let expectation = "hello"
        sut.enqueue("hello")
        sut.enqueue("kaki")
        sut.enqueue("songjun")
        // when
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }

```

### ⚒️ 해결방법
> given 은 테스트 환경을 만드는 것이고 when 은 테스트하고 싶은 중요 기능을 실행한다라고 나뉘어질 수 있습니다. 위 테스트에서 중요 기능은 dequeue이고 enqueue작업은 테스트 환경을 만들어주는 것이라 생각되어 2번 방법으로 테스트 코드를 작성했습니다.

</br>

### 2. 프로그램 실행 시간 확인
> 기존엔 고객 한 명당 0.7초씩 고정적으로 시간을 소요하기 때문에 프로그램 실행 시간을 고객수 * 0.7 초로 계산해주었습니다. 하지만 Step3로 넘어오며 대출 업무 고객은 1.1초, 예금 업무 고객은 0.7초로 각기 다른 시간이 소요되어 기존의 방식을 사용할 수 없었습니다.

### ⚒️ 해결방법
```swift
mutating func processBusiness() {
    let startTime = CFAbsoluteTimeGetCurrent()
    
    while !waitingQueue.isEmpty {
        guard let client = waitingQueue.dequeue() else { return }
        processBankTask(client)
    }
    group.wait()
    
    let wasteTime = CFAbsoluteTimeGetCurrent() - startTime
    presentBusinessResult(time: wasteTime)
}
```

> CFAbsoluteTimeGetCurrent()를 사용하여 시작되는 시점의 시간을 프로그램 실행이 끝났을때의 시간에서 빼주는 것으로 총 소요시간을 계산할 수 있었습니다.

### 3. 비동기 코드를 넘기고 바로 뒤의 코드를 실행시키는 현상
> 업무에 관한 코드를 전부 비동기로 설정해주었더니 비동기 코드를 바로 끝내고 아예 기다리지 않은 채 뒤의 코드를 실행시키는 문제가 발생하였습니다.

![](https://i.imgur.com/seTy6Jj.png)

### ⚒️ 해결방법
```swift
mutating func processBusiness() {
    while !waitingQueue.isEmpty {
        guard let client = waitingQueue.dequeue() else { return }
        processBankTask(client)
    }
    group.wait()
    
    presentBusinessResult(time: wasteTime)
}

private func processBankTask(_ client: Client) {
    if client.requstedTask == .loan {
        DispatchQueue.global().async(group: group) {
            loanSemaphore.wait()
            loanSemaphore.signal()
        }
    } else {
        DispatchQueue.global().async(group: group) {
            depositSemaphore.wait()
            depositSemaphore.signal()
        }
    }
}
```

> DispatchGroup을 이용하여 비동기적으로 처리되는 작업들을 그룹으로 묶어주고, group.wait()을 사용하여 DispatchGroup의 수행이 끝나는것을 기다리게 해주어 문제를 해결하였습니다.

<br/>
<br/>

# 참고 링크
* [Apple Developer Documentation - CFAbsoluteTimeGetCurrent()](https://developer.apple.com/documentation/corefoundation/1543542-cfabsolutetimegetcurrent)
* [야곰 닷넷 - 동시성 프로그래밍](https://yagom.net/courses/동시성-프로그래밍-concurrency-programming/)
* [Apple Developer Documentation - DispatchGroup](https://developer.apple.com/documentation/dispatch/dispatchgroup)
