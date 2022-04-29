//
//  HomePage.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-03.
//

import UIKit

let homePage = HomePage()
var tabBarController: UITabBarController?

class HomePage: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var todayTomorrow = [String]()
    
    @objc func reloadHomePage() {
        tableView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.separatorColor = .clear
        
        
        let currentDate = Date()
        var dateComponent = DateComponents()
        
        for i in 0...1 { // Appends the following days to dateArr
            dateComponent.day = i
            let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            let index = Calendar.current.component(.weekday, from: futureDate!)
            let appendWeekday = Calendar.current.weekdaySymbols[index-1]
          //  todayTomorrow[i] = String(appendWeekday)
            todayTomorrow.append(String(appendWeekday))
        }

        NotificationCenter.default.addObserver(self, selector: #selector(reloadHomePage), name: NSNotification.Name(rawValue: "reloadHome"), object: nil)
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ToonDetail {
            //print(tableView.indexPathForSelectedRow)

        }
        
        
        
    }
}

