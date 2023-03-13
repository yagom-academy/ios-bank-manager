//
//  BankManagerUIApp - ViewController.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setButton()
    }

    func setButton() {
        let addCustomerButton = UIButton()
        addCustomerButton.titleLabel?.text = "고객 10명 추가"
        addCustomerButton.titleLabel?.textColor = .systemBlue
        addCustomerButton.titleLabel?.font = .preferredFont(forTextStyle: .title2)
        
        
        let resetButton = UIButton()
        resetButton.titleLabel?.text = "초기화"
        resetButton.titleLabel?.textColor = .systemRed
        resetButton.titleLabel?.font = .preferredFont(forTextStyle: .title2)
        
        let stackView = UIStackView()

        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        stackView.addArrangedSubview(addCustomerButton)
        stackView.addArrangedSubview(resetButton)
        

        
        
    }
    
    
    

}







import SwiftUI

struct SwiftUIViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) { }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        SwiftUIViewController()
    }
}
