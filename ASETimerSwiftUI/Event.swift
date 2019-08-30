//
//  Event.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/30/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import Foundation

typealias Time = (days: Int, hours: Int, minutes: Int, seconds: Int)

func getCountdownTime(from eventTime: Double) -> Time {
    let secondsUntilEvent = eventTime - Date().timeIntervalSince1970
    let days = Int(secondsUntilEvent / 86400)
    let hours = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 86400) / 3600)
    let minutes = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 3600) / 60)
    let seconds = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 60))
    return (days, hours, minutes, seconds)
}

struct Event {
    
    var heading, description: String
    var unixTime: TimeInterval
    var imageName: String = "Hero"
    
    init() {
        self.heading = "Apple Special Event"
        self.description = "Live from Steve Jobs Theater"
        self.unixTime = 1568134800
    }
    
}
