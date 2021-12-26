import Foundation

enum BankManagerMessage {
    static let wrongInput = "잘못된 입력입니다. 다시 확인해주세요."
    static let menuList = """
                          \(Menu.open) : 은행 개점
                          \(Menu.close) : 종료
                          입력 : 
                          """
}
