//
//  ViewControllerTests.swift
//  UserDefaultsTests
//
//  Created by wingswift on 2021-12-04.
//

import XCTest
@testable import UserDefaults

class ViewControllerTests: XCTestCase {
    private var sut: ViewController!
    private var defaults: FakeUserDefaults!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        defaults = FakeUserDefaults()
        sut.userDefaults = defaults
    }
    
    override func tearDown() {
        sut = nil
        defaults = nil
        super.tearDown()
    }

    func test_viewDidLoad_withEmptyUserDefaults_shouldShow0InCounterLabel() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.countLabel.text, "0")
    }
    
    func test_viewDidLoad_with7InUserDefaults_shouldShow7InCounterLabel() {
        defaults.intergers = ["count": 7]
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.countLabel.text, "7")
    }
    
    func test_tappingIncrementButton_with12InUserDefaults_shouldIncreaseTo13InUserDefaults() {
        defaults.intergers = ["count": 12]
        sut.loadViewIfNeeded()
        tap(sut.incrementButton)
        XCTAssertEqual(sut.countLabel.text, "13")
    }
}
