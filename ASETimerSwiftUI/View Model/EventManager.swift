//
//  EventManager.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 5/30/20.
//  Copyright © 2020 Rahul Sharma. All rights reserved.
//

import Foundation
import Combine

typealias Time = (days: Int, hours: Int, minutes: Int, seconds: Int)

class EventManager: ObservableObject {
    
    private var event = Event()

    var timer: Cancellable?

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
        "hero"
    }
    
    @Published var remainingSeconds = 0

    init() {
        updateRemainingSeconds()
        if remainingSeconds <= 0 { endTimer(); return }
        startTimer()
    }

    func startTimer() {
        timer = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink { [self] _ in
                if remainingSeconds <= 0 { endTimer(); return }
                updateRemainingSeconds()
            }
    }

    func updateRemainingSeconds() {
        remainingSeconds = Int(eventDate.timeIntervalSinceNow)
    }

    func endTimer() {
        isCountdownOver = true
        if timer != nil {
            timer?.cancel()
            timer = nil
        }
    }

    var remainingTime: Time {
        let remainingTime: Time = (
            days: remainingSeconds / 86400,
            hours: (remainingSeconds % 86400) / 3600,
            minutes: (remainingSeconds % 3600) / 60,
            seconds: (remainingSeconds % 3600) % 60
        )
        return remainingTime
    }

}
