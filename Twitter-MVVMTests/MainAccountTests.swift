//
//  MainAccountTests.swift
//  Twitter-MVVMTests
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import XCTest
@testable import Twitter_MVVM

class MainAccountTests: XCTestCase {

    func test_loading_is_stoped_on_start() {
        
        let sut = makeSut()
        sut.loadViewIfNeeded()
        XCTAssertFalse(sut.loading.isLoading)
        
    }
    
    func test_check_image_logotipo_width() {
        let sut = makeSut()
        XCTAssertEqual(sut.logoTipo.frame.size.width, 45)
    }
    
    func test_check_labelCentral_text() {
        let sut = makeSut()
        XCTAssertEqual(sut.labelApp.text, L10nKeys.labelCentral.localized)
    }
    
    func test_check_labelCentral_font_size() {
        let sut = makeSut()
        XCTAssertEqual(sut.labelApp.font, .systemFont(ofSize: 28, weight: .bold))
    }
    
    func test_check_createAccountButton_size() {
        let sut = makeSut()
        let btn = sut.createAccountBtn
        XCTAssertEqual(btn.frame.size, CGSize(width: sut.view.frame.size.width * 0.8, height: 42))
    }

}

extension MainAccountTests {
    
    func makeSut() -> MainAccountViewController {
        let sut = makeMainAccount()
        addTeardownBlock { [weak sut] in
            XCTAssertNil(sut)
        }
        return sut
    }
    
}
