//
//  MainView.swift
//  BankManagerUIApp
//
//  Created by 이원빈 on 2022/07/10.
//

import UIKit

class MainView: UIView {
    
    let mainStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.alignment = .fill
        stackview.distribution = .fill
        
        return stackview
    }()
    
    let twoButtonStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        return stackview
    }()
    
    let addTenCustomerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    
    let processTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.text = "업무시간 - 00:00:000"
        label.textAlignment = .center
        return label
    }()
    
    let currentStateStackView: UIStackView = {
       let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        return stackview
    }()
    
    let waitingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "대기중"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemGreen
        return label
    }()
    
    let processingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "업무중"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .systemBlue
        return label
    }()
    
    let waitingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let processingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let waitingStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        return stackview
    }()
    
    let processingStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        return stackview
    }()
    
    var rootViewController: UIViewController?
    
    init(_ rootViewController: UIViewController) {
        super.init(frame: .null)
        self.rootViewController = rootViewController
        addAllSubViews()
        designateMainStackConstraints()
        addProcess(text: "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAllSubViews() {
        guard let rootViewController = rootViewController else { return }
        rootViewController.view.addSubview(mainStackView)
        
        twoButtonStackView.addArrangedSubview(addTenCustomerButton)
        twoButtonStackView.addArrangedSubview(resetButton)
        mainStackView.addArrangedSubview(twoButtonStackView)
        
        mainStackView.addArrangedSubview(processTimeLabel)
        
        currentStateStackView.addArrangedSubview(waitingLabel)
        currentStateStackView.addArrangedSubview(processingLabel)
        mainStackView.addArrangedSubview(currentStateStackView)
        
        waitingScrollView.addSubview(waitingStackView) // 스크롤뷰 안의 버티컬 스택뷰를 넣어줌
        processingScrollView.addSubview(processingStackView)  // 스크롤뷰 안에 요소를 넣어주어야 생기려나 ? 스크롤뷰 제약에서 에러가 나는듯
        
        rootViewController.view.addSubview(waitingScrollView)
        rootViewController.view.addSubview(processingScrollView)
        
    }
    
    func designateMainStackConstraints() {
        guard let rootViewController = rootViewController else { return }
        mainStackView.topAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainStackView.heightAnchor.constraint(equalTo: rootViewController.view.heightAnchor, multiplier: 0.17 ).isActive = true
        
        waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor).isActive = true
        waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.leadingAnchor).isActive = true
        waitingStackView.widthAnchor.constraint(equalTo: waitingScrollView.widthAnchor).isActive = true
        let frameConstraints = waitingStackView.heightAnchor.constraint(equalTo: waitingScrollView.frameLayoutGuide.heightAnchor)
        frameConstraints.priority = .defaultLow
        frameConstraints.isActive = true
        waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.trailingAnchor).isActive = true
        waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor).isActive = true

        processingStackView.topAnchor.constraint(equalTo: processingScrollView.topAnchor).isActive = true
        processingStackView.leadingAnchor.constraint(equalTo: processingScrollView.leadingAnchor).isActive = true
        processingStackView.widthAnchor.constraint(equalTo: processingScrollView.widthAnchor).isActive = true
        let frameConstraints2 = processingStackView.heightAnchor.constraint(equalTo: processingScrollView.frameLayoutGuide.heightAnchor)
        frameConstraints2.priority = .defaultLow
        frameConstraints2.isActive = true
        processingStackView.trailingAnchor.constraint(equalTo: processingScrollView.trailingAnchor).isActive = true
        processingStackView.bottomAnchor.constraint(equalTo: processingScrollView.bottomAnchor).isActive = true
        
        waitingScrollView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor).isActive = true
        waitingScrollView.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor).isActive = true
        waitingScrollView.trailingAnchor.constraint(equalTo: rootViewController.view.centerXAnchor).isActive = true
        waitingScrollView.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor).isActive = true

        processingScrollView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor).isActive = true
        processingScrollView.leadingAnchor.constraint(equalTo: rootViewController.view.centerXAnchor).isActive = true
        processingScrollView.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor).isActive = true
        processingScrollView.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor).isActive = true
    }
    
    func addProcess(text: String) {
        let processLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.preferredFont(forTextStyle: .title2)
            if text.hasSuffix("대출") {
                label.textColor = .systemPurple
            }
            label.text = text
            label.textAlignment = .center
            return label
        }()
        waitingStackView.addArrangedSubview(processLabel)
    }
    
    func startProcessing(text: String) {
        let processLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.preferredFont(forTextStyle: .title2)
            if text.hasSuffix("대출") {
                label.textColor = .systemPurple
            }
            label.text = text
            label.textAlignment = .center
            return label
        }()
        processingStackView.addArrangedSubview(processLabel)
    }
}
