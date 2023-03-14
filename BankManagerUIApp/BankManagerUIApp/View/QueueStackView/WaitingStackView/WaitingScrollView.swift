//
//  WaitingScrollView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class WaitingScrollView: UIScrollView {
    let waitingQueueContentView = WaitingQueueContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpWaitingScrollView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpWaitingScrollView() {
        self.addSubview(waitingQueueContentView)
    }
}
