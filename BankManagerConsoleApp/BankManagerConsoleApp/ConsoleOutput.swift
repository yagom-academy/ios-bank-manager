
import Foundation

enum ProcessStatus: String {
    case start = "업무 시작"
    case done = "업무 종료"
    case startExamination = "심사 시작"
    case completeExamination = "심사 완료"
}

enum ConsoleOutput {
    case menuChoice
    case bankOpening
    case invalidInput
    case currentProcess(ClientOperation, ProcessStatus)
    
    var message: String {
        switch self {
        case .menuChoice:
            return " 1 : 은행개점 \n 2 : 종료\n 입력 : "
        case .bankOpening:
            return "은행개점"
        case .invalidInput:
            return "잘못된 입력값입니다. 다시 시도해주세요."
        case let .currentProcess(client, processStatus):
            guard let clientWaitingNumber = client.waitingNumber, let clientGrade = client.grade?.description, let  clientBusiness = client.business?.rawValue else {
                return BankOperationError.unknownError.rawValue
            }
            
            return "\(clientWaitingNumber)번 \(clientGrade)고객 \(clientBusiness)\(processStatus.rawValue)"
        }
    }
    
}
