import UIKit

class MainView: UIView {
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    private let customerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    let addCustomerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        return button
    }()
    
    let clearCustomerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        return button
    }()
    
    let workingTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let statusStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    private let waitStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "대기중"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let processStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무중"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .systemBlue
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let bankingStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    private let waitingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let processingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let processingStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
    let waitingStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    private func setView() {
        customerStackView.addArrangedSubview(addCustomerButton)
        customerStackView.addArrangedSubview(clearCustomerButton)
        
        statusStackView.addArrangedSubview(waitStatusLabel)
        statusStackView.addArrangedSubview(processStatusLabel)
        
        waitingScrollView.addSubview(waitingStackView)
        bankingStackView.addArrangedSubview(waitingScrollView)
        processingScrollView.addSubview(processingStackView)
        bankingStackView.addArrangedSubview(processingScrollView)
        
        mainStackView.addArrangedSubview(customerStackView)
        mainStackView.addArrangedSubview(workingTimeLabel)
        mainStackView.addArrangedSubview(statusStackView)
        mainStackView.addArrangedSubview(bankingStackView)
        
        self.addSubview(mainStackView)
        
        self.backgroundColor = .systemBackground
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate ([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor),
            waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.leadingAnchor),
            waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.trailingAnchor),
            waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor),
            waitingStackView.widthAnchor.constraint(equalTo: waitingScrollView.widthAnchor),
            
            processingStackView.topAnchor.constraint(equalTo: processingScrollView.topAnchor),
            processingStackView.leadingAnchor.constraint(equalTo: processingScrollView.leadingAnchor),
            processingStackView.trailingAnchor.constraint(equalTo: processingScrollView.trailingAnchor),
            processingStackView.bottomAnchor.constraint(equalTo: processingScrollView.bottomAnchor),
            processingStackView.widthAnchor.constraint(equalTo: processingScrollView.widthAnchor),
            
            statusStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
