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

    var eventDate: Date {
        Date(timeIntervalSince1970: event.unixTime)
    }
    
    var isCountdownOver: Bool = false
    
    var imageName: String {
        ["girl", "boy", "guy"].randomElement()!
    }
    
    @Published var timeLeft: Time

    init() {
        timeLeft = EventManager.getCountdownTime(from: event.unixTime)
        let timeDifference = event.unixTime - Date().timeIntervalSince1970
        if timeDifference <= 0 {
            isCountdownOver = true
            return
        }
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: handleTimer)
    }
    
    func handleTimer(timer: Timer) {
        timeLeft = EventManager.getCountdownTime(from: event.unixTime)
        let timeDifference = event.unixTime - Date().timeIntervalSince1970
        if timeDifference <= 0 {
            isCountdownOver = true
            timer.invalidate()
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
