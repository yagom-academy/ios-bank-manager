import Foundation

enum ConsoleBundle {
    enum Menu {
        static let open: String = "1"
        static let exit: String = "2"
        static let explainMessage: String = "\(open) : 은행개점\n\(exit) : 종료"
        static let inputMessage: String = "입력 : "
        static let errorMessage: String = "잘못된 입력입니다. 입력 형식을 확인해 주세요. 🤨"
    }
    
    enum TaskMessage {
        static func startMessage(client: Client) -> String {
            return "\(client.waitingNumber)번 고객 \(client.bankTask)업무 시작"
        }
        static func completeMessage(client: Client) -> String {
            return "\(client.waitingNumber)번 고객 \(client.bankTask)업무 완료"
        }
        static func closeMessage(count: Int, duration: String) -> String {
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(count)명이며, 총 업무시간은 \(duration)초입니다."
        }
    }
}
