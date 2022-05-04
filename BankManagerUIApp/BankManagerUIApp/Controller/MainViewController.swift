//
//  BankManagerUIApp - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    private var bank: Bank?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func instance(bank: Bank) -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {
            return MainViewController()
        }
        
        mainViewController.bank = bank
        return mainViewController
    }
}

