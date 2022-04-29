//
//  SearchForToonFunction.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-08.
//

import UIKit
import Firebase


func searchForToonFunction(toonTitle: String, completionHandler:@escaping([[String: Any]])->Void) {
    let toonRef = db.collection("toonCollection")

    var returnData = [[String: Any]]()
    
    toonRef
        .whereField("lowerTitle", isGreaterThanOrEqualTo: toonTitle)
        .whereField("lowerTitle", isLessThanOrEqualTo: toonTitle + "\u{F7FF}")
        .getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            
            for document in querySnapshot!.documents {
                
                var data = document.data();
                data["toonId"] = document.documentID
                
                returnData.append(data)
                
                
                if(returnData.count == querySnapshot?.documents.count) {
                    completionHandler(returnData)
                }
            }
            
            
            
        }
    }
}

