//
//  BaseUIView.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/04.
//

import UIKit

class BaseUIView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func addSubviews(){}
    func setConstraints(){}
}
