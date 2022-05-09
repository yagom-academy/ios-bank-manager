//
//  UIViewController+Extension.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/05.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}
