//
//  DayOfWeek.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-05.
//

import UIKit

extension NSDate {

    func dayOfTheWeek() -> Date? {
        Calendar.current.date(byAdding: .day, value: 7, to: Date())
    }
}
