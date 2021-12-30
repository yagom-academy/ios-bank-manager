protocol BankDelegate: AnyObject {
    func addWaitingClient(client: Client)
    func addProcessingClient(client: Client)
    func removeWaitingClient(client: Client)
    func removeProcessingClient(client: Client)
}
