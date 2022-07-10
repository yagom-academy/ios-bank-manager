import UIKit

class ViewController: UIViewController {
    // MARK: Property
    var bank = Bank()
    var time = 0.0
    var timer: Timer? {
        willSet {
            timer?.invalidate()
        }
    }
    var workQueue: OperationQueue?
    var workOperations: [BlockOperation] = []
    var labelOperations: [BlockOperation] = []
    let deposit = DispatchSemaphore(value: 2)
    let loan = DispatchSemaphore(value: 1)
    
    // MARK: View property
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let addedButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(addCustomer), for: .touchUpInside)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(resetCustomer), for: .touchUpInside)
        return button
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "업무시간 - 00:00:000"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let waitingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "대기중"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let workingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "업무중"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currentStatusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let currentWatingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }()
    
    let currentWorkingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let currentWatingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let currentWorkingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        configureRootStackView()
        configureCurrentStatusStackView()
    }
    
    // MARK: Methods
    private func addView() {
        self.view.addSubview(rootStackView)
        [buttonStackView, timerLabel, statusStackView, currentStatusStackView].forEach {
            rootStackView.addArrangedSubview($0)
        }
        [addedButton, resetButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        [waitingLabel, workingLabel].forEach {
            statusStackView.addArrangedSubview($0)
        }
        [currentWatingScrollView, currentWorkingScrollView].forEach {
            currentStatusStackView.addArrangedSubview($0)
        }
        currentWatingScrollView.addSubview(currentWatingStackView)
        currentWorkingScrollView.addSubview(currentWorkingStackView)
    }
    
    private func configureRootStackView() {
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func configureCurrentStatusStackView() {
        NSLayoutConstraint.activate([
            currentWatingStackView.widthAnchor.constraint(equalTo: currentWatingScrollView.frameLayoutGuide.widthAnchor),
            currentWorkingStackView.widthAnchor.constraint(equalTo: currentWorkingScrollView.frameLayoutGuide.widthAnchor)
        ])
    }
    
    @objc
    private func addCustomer() {
        workQueue = OperationQueue()
        bank.setCustomer(count: 10)
        let workingQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())
        while bank.customerQueue.isNotEmpty {
            do {
                let customer = try bank.popCustomer()
                workingQueue.enqueue(data: customer)
                addLabel(to: currentWatingStackView, with: createLabel(customer: customer))
                timer = Timer.scheduledTimer(timeInterval: 0.001,
                                             target: self,
                                             selector: #selector(updateTimeLabelText),
                                             userInfo: nil,
                                             repeats: true)
                if customer.business == .deposit {
                    workBanking(business: deposit, for: customer)
                } else {
                    workBanking(business: loan, for: customer)
                }
            } catch {
                print("고객이 없습니다.")
                break
            }
        }
    }
    
    private func workBanking(business semaphore: DispatchSemaphore,
                             for customer: Customer) {
        let time = customer.business == .deposit ?
        BankBusiness.deposit.processingTime : BankBusiness.loan.processingTime
        let labelOperation = BlockOperation {
            self.currentWatingStackView.removeLabel(with: customer.name)
            self.addLabel(to: self.currentWorkingStackView, with: self.createLabel(customer: customer))
            self.currentWatingScrollView.contentSize = CGSize(width: self.currentWatingScrollView.contentSize.width, height: self.currentWatingStackView.bounds.height)
        }
        let workOperation = BlockOperation {
            semaphore.wait()
            OperationQueue.main.addOperation(labelOperation)
            if !labelOperation.isCancelled {
                BankManager.work(customer: customer, time: time)
            }
            OperationQueue.main.addOperation {
                self.currentWorkingStackView.removeLabel(with: customer.name)
                self.currentWatingScrollView.contentSize = CGSize(width: self.currentWatingScrollView.contentSize.width, height: self.currentWatingStackView.bounds.height)
                if self.currentWorkingStackView.subviews.isEmpty, self.currentWatingStackView.subviews.isEmpty {
                    self.timer?.invalidate()
                }
            }
            semaphore.signal()
        }
        
        labelOperations.append(labelOperation)
        workOperations.append(workOperation)
        self.workQueue?.addOperation(workOperation)
    }
    
    private func createLabel(customer: Customer) -> UILabel {
        let label = UILabel()
        label.restorationIdentifier = customer.name
        label.text = "\(customer.name) - \(customer.business.part)"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        if customer.business == .loan {
            label.textColor = .systemPurple
        }
        return label
    }
    
    private func addLabel(to stackView: UIStackView, with label: UILabel) {
        stackView.addArrangedSubview(label)
    }
    
    @objc
    private func resetCustomer() {
        currentWatingStackView.removeAllArrangedSubView()
        currentWorkingStackView.removeAllArrangedSubView()
        currentWatingScrollView.heightAnchor.constraint(equalTo: currentWatingScrollView.contentLayoutGuide.heightAnchor).isActive = true
        currentWorkingScrollView.heightAnchor.constraint(equalTo: currentWorkingScrollView.contentLayoutGuide.heightAnchor).isActive = true
        bank.reset()
        self.labelOperations.forEach {
            $0.cancel()
        }
        timerLabel.text = "업무시간 - 00:00:000"
        timer = nil
        time = 0.0
    }
    
    @objc
    private func updateTimeLabelText() {
        self.time += 0.001
        let minute: Int = Int(self.time / 60)
        let second: Int = Int(self.time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(self.time.truncatingRemainder(dividingBy: 1) * 1000)
        let timeText: String = String(format: "%02ld:%02ld:%03ld", minute, second, milisecond)
        self.timerLabel.text = "업무시간 - \(timeText)"
    }
}

extension UIStackView {
    func removeAllArrangedSubView() {
        self.arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    func removeLabel(with text: String) {
        self.arrangedSubviews.forEach {
            if $0.restorationIdentifier == text {
                self.removeArrangedSubview($0)
                $0.removeFromSuperview()
            }
        }
    }
}
