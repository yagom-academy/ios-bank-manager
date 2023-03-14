//
//  WaitingQueueStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/13.
//

import UIKit

final class WaitingQueueStackView: UIStackView {
    private let waitingQueueLabel = WaitingQueueLabel()
    let waitingScrollView = WaitingScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpWaitingQueueStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .vertical
        self.spacing = 10
    }
    
    private func setUpWaitingQueueStackView() {
        self.addArrangedSubview(waitingQueueLabel)
        self.addArrangedSubview(waitingScrollView)
    }
}
