//
//  RetrieveDaily.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-04.
//

import UIKit
import Firebase

func retrieveSubscribedToons() { // Retrieve the user's subscribed toons
    subscribedToons.removeAll()
    subscribedToons["monday"] = [[String: Any]]()
    subscribedToons["tuesday"] = [[String: Any]]()
    subscribedToons["wednesday"] = [[String: Any]]()
    subscribedToons["thursday"] = [[String: Any]]()
    subscribedToons["friday"] = [[String: Any]]()
    subscribedToons["saturday"] = [[String: Any]]()
    subscribedToons["sunday"] = [[String: Any]]()
    db.collection("toons").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            var count = 0
            for document in querySnapshot!.documents {
                
                var data = document.data();
                data["toonId"] = document.documentID
                let date = data["date"] as! String
                
                subscribedToons[date]!.append(data)
           
                

                count += 1
                if(count == querySnapshot?.documents.count) {
                    
                    let currentDate = Date()
                    var dateComponent = DateComponents()
                    
                    for i in 0...6 { // Appends the following days to dateArr
                        dateComponent.day = i
                        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
                        let index = Calendar.current.component(.weekday, from: futureDate!)
                        let appendWeekday = Calendar.current.weekdaySymbols[index-1]

                        if(subscribedToons[appendWeekday.lowercased()]!.count != 0) {
                            dateArr.append(appendWeekday)
                        }
                        
                    }

                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadData"), object: nil)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadHome"), object: nil)
                    break
                }
                
            }
            
        }
    }
}
