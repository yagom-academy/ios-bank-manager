
import Foundation

enum ProcessStatus: String {
    case start = "업무 시작"
    case done = "업무 종료"
    case startExamination = "심사 시작"
    case completeExamination = "심사 완료"
    case failExamination = "심사 실패"
}

enum ConsoleOutput {
    case invalidInput
    case menuChoice
    case bankOpening
    case bankClosing(Bank)
    case currentProcess(ClientOperation, ProcessStatus)
    
    var message: String {
        switch self {
        case .invalidInput:
            return "잘못된 입력값입니다. 다시 시도해주세요."
        case .menuChoice:
            return " 1 : 은행개점 \n 2 : 종료\n 입력 : "
        case .bankOpening:
            return "은행개점"
        case let .bankClosing(bank):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.totalClientCount)명이며, 총 업무시간은 \(bank.totalOperateTime)초입니다."
        case let .currentProcess(client, processStatus):
            guard let clientWaitingNumber = client.waitingNumber, let clientGrade = client.grade?.description, let  clientBusiness = client.business?.rawValue else {
                return BankOperationError.unknownError.rawValue
            }
            
            return "\(clientWaitingNumber)번 \(clientGrade)고객 \(clientBusiness)\(processStatus.rawValue)"
        }
    }
}
