//
//  BankManagerUIApp - ViewController.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
