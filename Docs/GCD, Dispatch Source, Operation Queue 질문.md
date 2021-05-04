# 질문 3가지
![스크린샷 2021-04-29 오후 7 24 39](https://user-images.githubusercontent.com/65153742/116536940-8b892280-a920-11eb-83eb-a5303a520a58.png)

<br>

### 1. 여기서 시스템 이벤트의 목록을 봐도 어떤걸 말하는건지 잘 모르겠습니다 가능하다면 예제를 들어주실 수 있을까요 ?
[MacOS 운영체제는 유닉스의 일종](https://effectivecode.tistory.com/932)

[유닉스 신호](https://ko.wikipedia.org/wiki/%EC%9C%A0%EB%8B%89%EC%8A%A4_%EC%8B%A0%ED%98%B8)

- 링크 간단하게 말하면 몰라도 되는 내용이다. 일단은...

![스크린샷 2021-04-29 오후 7 26 11](https://user-images.githubusercontent.com/65153742/116537119-c3906580-a920-11eb-9364-c516998f2403.png)

- 회사에서 디바이스까지 만든다는 게 아니면 잘 사용하지 않는다. 아름다운 경험은 아니었다.
- 주제를 벗어난 공부가 아닌가? 현재로써는

![스크린샷 2021-04-29 오후 7 26 54](https://user-images.githubusercontent.com/65153742/116537182-dc991680-a920-11eb-82fb-db520612d6d1.png)

<br>

### 2.  Operation Queue의 사용처는 Dispatch Queue에 해당안되는 부분이라고 봐도 될까요 ? Operation Queue와 Dispatch Queue의 차이점을 공부했는데 실제로 어떻게 쓰이는지 잘 모르겠습니다 대표적인 예시가 어떤 경우가 있을까요 ?
- 당근마켓 앱을 동작하고 있을때, 이미 지나간 영역을 처리할 필요가 있나? 이런 경우 취소기능을 쓴다. 실제로 오퍼레이션 큐를 자주 사용하지 않는다. 개발자에게 일이 길어지는 건 사실.

<br>

### 3. 혹시 Notification Center의 동작원리가 Dispatch Source와 관련이 있을까요?
![스크린샷 2021-04-29 오후 7 28 50](https://user-images.githubusercontent.com/65153742/116537395-22ee7580-a921-11eb-96a2-a7821dac8754.png)
- [Message Dispatch](https://jcsoohwancho.github.io/2019-11-02-Message-Dispatch/) (allen 공유)
- 메서드 디스패치에 대해 알고 싶다면 swift performance wwdc - 야곰, 후반부에 배우긴 함
