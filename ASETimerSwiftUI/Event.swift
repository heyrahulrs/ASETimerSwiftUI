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
    
    var leftImageName: String {
        "L\(Int.random(in: 1...7))"
    }
    
    var rightImageName: String {
        "R\(Int.random(in: 1...7))"
    }
    
    init() {
        self.heading = "WWDC 2020"
        self.description = "Join us for the first global,\nall-online WWDC20.\nStarts June 22."
        self.unixTime = 1592845200
    }
    
}
