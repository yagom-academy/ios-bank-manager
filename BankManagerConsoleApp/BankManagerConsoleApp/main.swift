import Foundation

func run() {
    let bankManagerViewController = BankManagerViewController()
    while bankManagerViewController.isFlag {
        bankManagerViewController.showMenu()
        bankManagerViewController.receiveUserInput()
    }
}

run()
