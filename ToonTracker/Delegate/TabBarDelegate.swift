//
//  TabBarDelegate.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-04.
//

import UIKit
import LinkPresentation

let storyboard = UIStoryboard(name: "Main", bundle: nil)

let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")


func tabBarDelegate() {
    print("TEST")
    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
}
