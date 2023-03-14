//
//  QueueStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/13.
//
import UIKit

class QueueStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpQueueStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.axis = .horizontal
        self.distribution = .fillEqually
    }
    
    private let waitQueueStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical

        return stackView
    }()
    
    private let waitQueueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = .systemGreen
        
        return label
    }()
    
    private let doTaskStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical

        return stackView
    }()
    
    private let doTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "업무중"
        label.backgroundColor = .systemIndigo
        label.textColor = .white
        
        return label
    }()
    
    private func setUpQueueStackView() {
        self.addArrangedSubview(waitQueueStackView)
        self.addArrangedSubview(doTaskStackView)
        waitQueueStackView.addArrangedSubview(waitQueueLabel)
        doTaskStackView.addArrangedSubview(doTaskLabel)
    }
}
