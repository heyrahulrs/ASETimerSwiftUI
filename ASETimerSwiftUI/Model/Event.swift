//
//  Event.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/30/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct Event {
    
    var heading: String { "WWDC 2022" }
    
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
        return "Watch on " + date + " at " + time + " " + abbreviation + ".\nView online at apple.com or on the Apple TV app."
    }
    
    func abbreviation() -> String {
        for(key, value) in TimeZone.abbreviationDictionary {
            if value == TimeZone.current.identifier {
                return key
            }
        }
        return ""
    }
    
    var unixTime: TimeInterval { 1654534800 }
    
    var eventBackgroundColors: [Color] = [
        .init(red: 2 / 255, green: 13 / 255, blue: 31 / 255),
        .black
    ]
    
    var eventTextColor = Color("HeroColor")
    
}
