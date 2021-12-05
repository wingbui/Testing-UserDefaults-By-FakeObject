//
//  ViewController.swift
//  UserDefaults
//
//  Created by wingswift on 2021-12-04.
//

import UIKit

protocol UserDefaultsProtocol {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int
}

class ViewController: UIViewController {
    var userDefaults: UserDefaultsProtocol = UserDefaults.standard
    @IBOutlet private(set) var countLabel: UILabel!
    @IBOutlet private(set) var incrementButton: UIButton!
    
    private var count = 0 {
        didSet {
            countLabel.text = "\(count)"
            userDefaults.set(count, forKey: "count")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count = userDefaults.integer(forKey: "count")
    }
    
    @IBAction private func incrementButtonTapped() {
        count += 1
    }

}

extension UserDefaults: UserDefaultsProtocol {}

