//
//  Login.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-04.

import UIKit
    
class LoginPage: UIViewController {
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test 0")
        btn.isUserInteractionEnabled = true
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        print("Tester 1")
    }
}
