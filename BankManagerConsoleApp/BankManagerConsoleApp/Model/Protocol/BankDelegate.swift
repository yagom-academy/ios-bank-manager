protocol BankDelegate: AnyObject {
    func didFinishWork(totalCustomer: Int, workingTime: Double)
}
