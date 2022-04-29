//
//  TabBar.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-04.
//

import UIKit
import Firebase

//var tabBarView = TabBarView()
    
class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        retrieveSubscribedToons()
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
