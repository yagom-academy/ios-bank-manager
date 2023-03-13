//
//  BankManagerUIApp - ViewController.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


final class BankManagerViewController: UIViewController {
    let mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setMainStackView()
        setButtons()
        setTimerLabel()
        setQueueLabel()
        setCustomerScrollView()
    }
    
    private func setMainStackView() {
        view.addSubview(mainStackView)
        
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    private func setButtons() {
        let addCustomerButton = {
            let button = UIButton()
            button.setTitle("고객 10명 추가", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            
            return button
        }()
        
        
        let resetButton = {
            let button = UIButton()
            button.setTitle("초기화", for: .normal)
            button.setTitleColor(.systemRed, for: .normal)
            
            return button
        }()
        
        let stackView = {
            let stackView = UIStackView(arrangedSubviews: [addCustomerButton, resetButton])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        mainStackView.addArrangedSubview(stackView)
    }
    
    private func setTimerLabel() {
        let timerLabel = {
            let label = UILabel()
            label.text = "타이머 넣기"
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .black
            label.textAlignment = .center
            
            return label
        }()
        
        mainStackView.addArrangedSubview(timerLabel)
    }
    
    private func setQueueLabel() {
        let waitingLabel = {
            let label = UILabel()
            label.textColor = .white
            label.backgroundColor = .systemGreen
            label.text = "대기중"
            label.textAlignment = .center
            label.font = .preferredFont(forTextStyle: .title1)
            
            return label
        }()
        
        let workingLabel = {
            let label = UILabel()
            label.textColor = .white
            label.backgroundColor = .systemIndigo
            label.text = "업무중"
            label.textAlignment = .center
            label.font = .preferredFont(forTextStyle: .title1)
            
            return label
        }()
        
        let stackView = {
            let stackView = UIStackView(arrangedSubviews: [waitingLabel, workingLabel])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        mainStackView.addArrangedSubview(stackView)
    }
    
    private func setCustomerScrollView() {
        let anotherStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        let waitingStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        let waitingScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false

            scrollView.addSubview(waitingStackView)

            NSLayoutConstraint.activate([
//                scrollView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
//                scrollView.widthAnchor.constraint(equalTo: self.mainStackView.widthAnchor, multiplier: 0.5),
            ])

            return scrollView
        }()
        

  
        let workingStackView = {
           let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        
        let testLabel1 = {
            let label = UILabel()
            label.textColor = .black
            label.text = "테스트"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 50)
            
            return label
        }()
        
        let testLabel2 = {
            let label = UILabel()
            label.textColor = .black
            label.text = "테스트"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 50)
            
            return label
        }()
        
        let testLabel3 = {
            let label = UILabel()
            label.textColor = .black
            label.text = "테스트"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 50)
            
            return label
        }()
        
        let testLabel4 = {
            let label = UILabel()
            label.textColor = .black
            label.text = "테스트"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 50)
            
            return label
        }()
        
        let testLabel5 = {
            let label = UILabel()
            label.textColor = .black
            label.text = "테스트"
            label.textAlignment = .center
            
            return label
        }()
        
        anotherStackView.addArrangedSubview(waitingScrollView)
        anotherStackView.addArrangedSubview(workingStackView)

        waitingStackView.addArrangedSubview(testLabel1)
        waitingStackView.addArrangedSubview(testLabel2)
        waitingStackView.addArrangedSubview(testLabel3)
        waitingStackView.addArrangedSubview(testLabel4)
        workingStackView.addArrangedSubview(testLabel5)

        mainStackView.addArrangedSubview(anotherStackView)
    }
    
}

import SwiftUI

struct SwiftUIViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = BankManagerViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        return BankManagerViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        SwiftUIViewController()
    }
}
