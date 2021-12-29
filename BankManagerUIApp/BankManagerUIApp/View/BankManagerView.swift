import UIKit

class BankManagerView: UIView {
    let addClientsButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    let initializeButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    let serviceTimeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "업무시간"
        label.textAlignment = .center
        return label
    }()
    let waitingClientsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "대기중"
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        label.textColor = .white
        return label
    }()
    let processingClientsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "업무중"
        label.textAlignment = .center
        label.backgroundColor = .systemIndigo
        label.textColor = .white
        return label
    }()
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        return stackView
    }()
    let titleStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        // TODO: distribute
        return stackView
    }()
    let queueStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        // TODO: distribute
        return stackView
    }()
    let waitingQueueStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    let processingQueueStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
