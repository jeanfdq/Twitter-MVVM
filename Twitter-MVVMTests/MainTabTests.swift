//
//  MainTabTests.swift
//  Twitter-MVVMTests
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import XCTest
@testable import Twitter_MVVM

class MainTabTests: XCTestCase {
    
    func testMainTabBar_should_return_tabs_count() {
        let sut = makeSut()
        XCTAssertTrue(sut.viewControllers?.count == 4)
    }
    
    private func makeSut() -> MainTabBarController {
        let sut = MainTabBarController()
        
        sut.loadViewIfNeeded()                              // Test para executar o viewDidLoad
        sut.beginAppearanceTransition(true, animated: true) // Test para executar o viewWillAppear
        sut.endAppearanceTransition()                       // Test para executar o viewWillDisappear
        
        addTeardownBlock { [weak sut] in
            XCTAssertNil(sut)
        }
        return sut
    }

}
