//
//  SearchToons.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-08.
//

import UIKit

class SearchToons: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var searchBarExit: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hamburgerBtn: UIButton!
    
    var toonArray = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = .clear
        self.searchBar.delegate = self
        self.searchBar.addPadding(.both(20))
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func exitButtonPressed(_ sender: UIButton) {
        toonArray.removeAll()
        searchForToonFunction(toonTitle: searchBar.text!.lowercased()) { returnData in
            for toon in returnData {
                self.toonArray.append(toon)
                
                if(self.toonArray.count == returnData.count) {
                    print("Worked")
                    self.tableView.reloadData()
                }
            }
           
        }
    }
    
    @IBAction func searchBarPressed(_ sender: UITextField) {
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchBarExit.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchBarExit.isHidden = true
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ToonDetail {
            let index = tableView.indexPathForSelectedRow!.row
           
            vc.retrieveTitle = toonArray[index]["title"] as! String
            vc.retrieveDescription = toonArray[index]["description"] as! String
            let toonId = toonArray[index]["toonId"] as! String
            vc.url =  "https://firebasestorage.googleapis.com/v0/b/toontracker-b5102.appspot.com/o/" + toonId + "?alt=media&token="
            vc.previousView = "search"
        }
        
        
        
    }

}
