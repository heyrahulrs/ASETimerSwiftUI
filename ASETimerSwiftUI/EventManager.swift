//
//  EventManager.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 5/30/20.
//  Copyright © 2020 Rahul Sharma. All rights reserved.
//

import Foundation

typealias Time = (days: Int, hours: Int, minutes: Int, seconds: Int)

class EventManager: ObservableObject {
    
    private var event = Event()
    
    var eventHeading: String {
        event.heading
    }
    
    var eventDescription: String {
        event.description
    }
    
    var isEventStreamingLive: Bool {
        let timeDifference = event.unixTime - Date().timeIntervalSince1970
        return timeDifference <= 0 && timeDifference >= -7200
    }
    
    var isEventConcluded: Bool {
        let timeDifference = event.unixTime - Date().timeIntervalSince1970
        return timeDifference <= -7200
    }
    
    var leftImageName: String {
        "L\(Int.random(in: 1...7))"
    }
    
    var middleImageName: String {
        "M0"
    }
    
    var rightImageName: String {
        "R\(Int.random(in: 1...7))"
    }
    
    @Published var timeLeft: Time
    
    init() {
        timeLeft = EventManager.getCountdownTime(from: event.unixTime)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.timeLeft = EventManager.getCountdownTime(from: self.event.unixTime)
        }
    }
    
    static func getCountdownTime(from eventTime: Double) -> Time {
        let secondsUntilEvent = eventTime - Date().timeIntervalSince1970
        let days = Int(secondsUntilEvent / 86400)
        let hours = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 86400) / 3600)
        let minutes = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 3600) / 60)
        let seconds = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 60))
        return (days, hours, minutes, seconds)
    }
    
}
