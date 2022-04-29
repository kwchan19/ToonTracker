//
//  ToonDetailDescription.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-07.
//

import UIKit

class ToonDetailDescription: UIViewController {
    
    @IBOutlet weak var toonTitle: UILabel!
    @IBOutlet weak var toonDescription: UITextView!
    var retrieveDesc: String?
    var retrieveTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toonDescription.text = retrieveDesc
        toonTitle.text = retrieveTitle
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}
