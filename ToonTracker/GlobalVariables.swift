//
//  GlobalVariables.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-04.
//

import UIKit
import Firebase

let db = Firestore.firestore()

var subscribedToons = [String: [[String: Any]]]() // Holds all the user's subscribed webtoons
var toonsRetrieved = false
var dateArr = [String]()

var toonTitle = [String]()
var toonDescription = [String]()
var toonStatus = [String]()
var toonId = [String]()
