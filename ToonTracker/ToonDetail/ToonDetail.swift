//
//  ToonDetail.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-06.
//

import UIKit

class ToonDetail: UIViewController {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var imageView: UIButton!
    @IBOutlet weak var toonTitle: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var retrieveTitle: String?
    var url: String?
    var retrieveDescription: String?
    
    var previousView: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        toonTitle?.text = retrieveTitle
        desc?.text = retrieveDescription

        imageView.roundedButtonAllCorners()
        imageView?.sd_setBackgroundImage(with: URL(string: url!)!, for: .normal)
        imageView?.layoutIfNeeded()
        imageView?.subviews.first?.contentMode = .scaleAspectFill

    }
    
    @IBAction func backButton(_ sender: UIButton) {
        print(previousView)
        if(previousView == "home") {
            print("To Home")
            performSegue(withIdentifier: "unwindToHome", sender: self)
        }
        else if(previousView == "search") {
            print("To Search")
            dismiss(animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ToonDetailDescription {
            vc.retrieveDesc =  retrieveDescription
            vc.retrieveTitle = retrieveTitle
        }
        
        
        
    }
}
