//
//  MainView.swift
//  BankManagerUIApp
//
//  Created by OneTool, Red on 2022/05/05.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(mainStackView)
        self.addSubview(customerScrollView)
        
        setUpAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpAutoLayout() {
        mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        
        customerScrollView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 20).isActive = true
        customerScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        customerScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        customerScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    // MARK: - Label
    let workingTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .monospacedDigitSystemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        
        return label
    }()
    
    let waitingLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.backgroundColor = .systemGreen
        
        return label
    }()
    
    let workingLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        
        return label
    }()
    
    func createCustomerLabel(customer: Customer) -> UILabel {
        guard let task = customer.task else { return UILabel() }
        
        let label = UILabel()
        label.text = "\(customer.numberTicekt) - \(task.rawValue)"
        if task == .deposit {
            label.textColor = .black
        } else {
            label.textColor = .systemPurple
        }
        
        return label
    }
    
    // MARK: - Button
    let addTenCustomerButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        
        return button
    }()
    
    // MARK: - StackView
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonStackView, workingTimeLabel, labelStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 12
        
        return stackView
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addTenCustomerButton, resetButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        return stackView
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [waitingLabel, workingLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var customerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [watingStackView, workingStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var watingStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        
        return stackView
    }()
    
    lazy var workingStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        
        return stackView
    }()
    
    // MARK: - ScrollView
    lazy var customerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = true
        scrollView.addSubview(customerStackView)
        
        customerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        customerStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        customerStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        customerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        customerStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        return scrollView
    }()
    
    
    
    
    
    
    
    
    
}
