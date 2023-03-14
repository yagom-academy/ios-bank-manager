//
//  WaitingScrollView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class WaitingScrollView: UIScrollView {
    
    private let waitingContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .systemGray2

        return stackView
    }()
    
    
}
