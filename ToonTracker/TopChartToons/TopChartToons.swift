//
//  TopChartToons.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-07.
//

import UIKit

class TopChartToons: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
  
    @IBOutlet weak var hamburgerButton: UIButton!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        tableView.separatorColor = .clear
        
    }
    /*
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchExitButton.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchExitButton.isHidden = true
    }*/
    
}
