//
//  DoingTaskScrollView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class DoingTaskScrollView: UIScrollView {
    
    private let doingTaskContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .systemGray2

        return stackView
    }()
}
