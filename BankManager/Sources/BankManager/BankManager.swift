public struct BankManager {
    private var taskCount: Int = 0
    private var businessHour: Double = 0
    
    public func startTask() {
        print("\(taskCount + 1)번 고객 업무 시작")
    }
    
    public mutating func endTask() {
        print("\(taskCount)번 고객 업무 완료")
        taskCount += 1
        businessHour += 0.7
    }
    
    public func finishTasks() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(taskCount)명이며, 총 업무시간은 \(String(format: "%.1f", businessHour))초입니다.")
    }
    
    public init() {
        
    }
}
