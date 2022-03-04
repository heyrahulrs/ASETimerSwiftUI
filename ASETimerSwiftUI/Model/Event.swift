//
//  Event.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/30/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import Foundation

struct Event {
    let heading: String = "Peek Performance"
    var description: String {
        let dateFormat = "MMMM d"
        let timeFormat = "h:mm a"
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = dateFormat
        let date = dateformatter.string(from: Date(timeIntervalSince1970: unixTime))
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = timeFormat
        let time = timeFormatter.string(from: Date(timeIntervalSince1970: unixTime))
        let abbreviation = abbreviation()
        return "Watch on " + date + " at " + time + " " + abbreviation
    }
    func abbreviation() -> String {
        for(key, value) in TimeZone.abbreviationDictionary {
            if value == TimeZone.current.identifier {
                return key
            }
        }
        return ""
    }
    let unixTime: TimeInterval = 1646762400
}
