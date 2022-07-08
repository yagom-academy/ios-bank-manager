import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    private var bankManager = BankManager()
    private var customerNumber = 0
    private var timer = Timer()
    private var workingTime: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addButtonTarget()
        addNotificationObserver()
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(playTimer), userInfo: nil, repeats: true)
        
        let customers = bankManager.createCustomerQueue()
        setCustomerLabel(customers: customers)
        customerNumber = bankManager.manageBank(customers: customers)
    }
    
    private func addButtonTarget() {
        mainView.addCustomerButton.addTarget(self, action: #selector(addCustomerButtonDidTapped(_:)), for: .touchUpInside)
        mainView.clearCustomerButton.addTarget(self, action: #selector(clearCustomerButtonDidTapped), for: .touchUpInside)
        
    }
    
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(startProcessing(notification:)), name: Notification.Name(rawValue: "process"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(finishProcessing), name: Notification.Name(rawValue: "finish"), object: nil)
    }
    
    @objc func playTimer() {
        workingTime += 0.001
        
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSinceReferenceDate: workingTime)
        dateFormatter.dateFormat = "mm:ss:SSS"
        
        mainView.workingTimeLabel.text = "업무시간 - \(dateFormatter.string(from: date))"
    }
    
    @objc private func addCustomerButtonDidTapped(_ sender: UIButton) {
        let customers = bankManager.addCustomerQueue(lastCustomer: customerNumber)
        
        setCustomerLabel(customers: customers)
        customerNumber += bankManager.manageBank(customers: customers)
        
        if timer.isValid == false {
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(playTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func clearCustomerButtonDidTapped(_ sender: UIButton) {
        mainView.waitingStackView.arrangedSubviews.forEach {
            mainView.waitingStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        mainView.processingStackView.arrangedSubviews.forEach {
            mainView.processingStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        workingTime = 0
        customerNumber = 0
        mainView.workingTimeLabel.text = "업무시간 - 00:00:000"
        timer.invalidate()
    }
    
    @objc private func startProcessing(notification: Notification) {
        transferCustomer(at: mainView.waitingStackView, notification)
    }
    
    @objc private func finishProcessing(notification: Notification) {
        transferCustomer(at: mainView.processingStackView, notification)
        
        DispatchQueue.main.async {
            if self.mainView.waitingStackView.arrangedSubviews.isEmpty && self.mainView.processingStackView.arrangedSubviews.isEmpty {
                self.timer.invalidate()
            }
        }
    }
    
    private func transferCustomer(at stackView: UIStackView, _ notification: Notification) {
        guard let customer = notification.object as? Customer else { return }
        
        let text = "\(customer.number) - \(customer.banking.rawValue)"
        
        DispatchQueue.main.async {
            let customerLabel = stackView.arrangedSubviews.filter {
                let label = $0 as? UILabel
                return label?.text == text
            }
            
            customerLabel.forEach {
                stackView.removeArrangedSubview($0)
                $0.removeFromSuperview()
            }
            
            if stackView == self.mainView.waitingStackView {
                customerLabel.forEach {
                    self.mainView.processingStackView.addArrangedSubview($0)
                }
            }
        }
    }
    
    private func setCustomerLabel(customers: Queue<Customer>) {
        for customer in customers.returnList() {
            let customerLabel = UILabel()
            let bankingLabel = "\(customer.number) - \(customer.banking.rawValue)"
            
            switch customer.banking {
            case .loan:
                customerLabel.textColor = .systemPurple
            case .deposit:
                customerLabel.textColor = .black
            }
            
            customerLabel.translatesAutoresizingMaskIntoConstraints = false
            customerLabel.font = .preferredFont(forTextStyle: .title2)
            customerLabel.textAlignment = .center
            customerLabel.adjustsFontForContentSizeCategory = true
            customerLabel.text = bankingLabel
            
            mainView.waitingStackView.addArrangedSubview(customerLabel)
        }
    }
}

