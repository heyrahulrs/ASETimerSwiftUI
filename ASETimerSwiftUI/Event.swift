//
//  Event.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/30/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import Foundation

struct Event {
    
    var heading, description: String
    var unixTime: TimeInterval
    
    init() {
        self.heading = "WWDC 2020"
        self.description = "Join us for the first global,\nall-online WWDC20.\nStarts June 22."
        self.unixTime = 1592845200
    }
    
}
