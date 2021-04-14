//
//  CountdownView.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/30/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct CountdownView: View {
    
    @ObservedObject var eventManager: EventManager
        
    var body: some View {
        if eventManager.isCountdownOver {
            Text("Countdown Ended".uppercased())
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 18.0)
        } else {
            HStack(alignment: .top) {
                CountdownRow(number: eventManager.timeLeft.days,
                             text: .days)
                SeparatorView()
                CountdownRow(number: eventManager.timeLeft.hours,
                             text: .hours)
                SeparatorView()
                CountdownRow(number: eventManager.timeLeft.minutes,
                             text: .minutes)
                SeparatorView()
                CountdownRow(number: eventManager.timeLeft.seconds,
                             text: .seconds)
            }
        }
    }

}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(eventManager: EventManager())
    }
}
