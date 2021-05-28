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
                if eventManager.remainingTime.days != 0 {
                    CountdownRow(number: eventManager.remainingTime.days,
                                 text: .days)
                    SeparatorView()
                }
                CountdownRow(number: eventManager.remainingTime.hours,
                             text: .hours)
                SeparatorView()
                CountdownRow(number: eventManager.remainingTime.minutes,
                             text: .minutes)
                SeparatorView()
                CountdownRow(number: eventManager.remainingTime.seconds,
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
