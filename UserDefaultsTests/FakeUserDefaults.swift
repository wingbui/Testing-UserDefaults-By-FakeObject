//
//  FakeUserDefaults.swift
//  UserDefaultsTests
//
//  Created by wingswift on 2021-12-04.
//

@testable import UserDefaults

class FakeUserDefaults: UserDefaultsProtocol {
    var intergers: [String: Int] = [:]
    
    func set(_ value: Int, forKey defaultName: String) {
        intergers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        intergers[defaultName] ?? 0
    }
}
