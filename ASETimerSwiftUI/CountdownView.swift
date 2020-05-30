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
        ZStack {
            if eventManager.isEventConcluded {
                Text("Keynote has been concluded.".uppercased())
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 18.0)
            } else if eventManager.isEventStreamingLive {
                Text("Keynote is now streaming live.".uppercased())
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 18.0)
            } else {
                HStack(alignment: .top) {
                    CountdownRow(number: eventManager.timeLeft.days, text: .days)
                    SeparatorView()
                    CountdownRow(number: eventManager.timeLeft.hours, text: .hours)
                    SeparatorView()
                    CountdownRow(number: eventManager.timeLeft.minutes, text: .minutes)
                    SeparatorView()
                    CountdownRow(number: eventManager.timeLeft.seconds, text: .seconds)
                }
            }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(eventManager: EventManager())
    }
}
