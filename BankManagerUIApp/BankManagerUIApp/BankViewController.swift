import UIKit

class BankViewController: UIViewController {
    // MARK: Property
    private var bank = Bank()
    private var time = 0.0
    private var timer: Timer? {
        willSet {
            timer?.invalidate()
        }
    }
    private var workQueue: OperationQueue?
    private var workOperations: [BlockOperation] = []
    private var labelOperations: [BlockOperation] = []
    private let deposit = DispatchSemaphore(value: 2)
    private let loan = DispatchSemaphore(value: 1)
    
    // MARK: View property
    private let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let addedButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(addCustomer), for: .touchUpInside)
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(resetCustomer), for: .touchUpInside)
        return button
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "업무시간 - 00:00:000"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let waitingLabel: UILabel = {
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
    
    private let workingLabel: UILabel = {
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
    
    private let currentStatusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let currentWatingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }()
    
    private let currentWorkingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let currentWatingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let currentWorkingStackView: UIStackView = {
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
                alertError()
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
            if labelOperation.isCancelled == false {
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
        self.workOperations.forEach {
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
    
    private func alertError() {
        let alert = UIAlertController(title: "경고", message: "고객이 없습니다.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(alertAction)
        present(alert, animated: false)
    }
}

// MARK: Extension
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

extension UIButton {

    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.5
        super.touchesBegan(touches, with: event)
    }

    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1
        super.touchesEnded(touches, with: event)
    }
}
