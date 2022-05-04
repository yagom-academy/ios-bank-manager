//
//  BankManagerUIApp - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

fileprivate extension Constants {
    static let clientCountRange: ClosedRange<Int> = 10 ... 30
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let compositionRoot: CompositionRoot
    
    private override init() {
        self.compositionRoot = CompositionRoot(
            numberOfDepositBankClerks: Constants.numberOfDepositBankClerks,
            numberOfLoanBankClerks: Constants.numberOfLoanBankClerks,
            clientCountRange: Constants.clientCountRange)
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let window = window else { return }
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let dependency: CompositionRoot.Dependency = compositionRoot.resolve()
        compositionRoot.setWindow(window: window, dependency: dependency)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
