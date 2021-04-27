//
//  ConsoleViewerTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/04/28.
//

import XCTest

class ConsoleViewerTest: XCTestCase {
    struct DummyConsoleViewer: ConsoleViewer {}
    var dummyConsoleViewer = DummyConsoleViewer()
    
    func test_ConsoleViewer_showStartMenu() {
        dummyConsoleViewer.showStartMenu()
    }
}
