//
//  CountdownView.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/30/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct CountdownView: View {
    
    var time: Time
    
    var body: some View {
        Group {
            if time.minutes < -120 || time.hours <= -2 {
                Text("Keynote has been concluded.")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 18.0)
            } else if time.hours < 0 || time.minutes < 0 || time.seconds < 0 {
                Text("Keynote is now streaming live.")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 18.0)
            } else {
                HStack(alignment: .top) {
                    CountdownRow(number: time.days, text: .days)
                    SeparatorView()
                    CountdownRow(number: time.hours, text: .hours)
                    SeparatorView()
                    CountdownRow(number: time.minutes, text: .minutes)
                    SeparatorView()
                    CountdownRow(number: time.seconds, text: .seconds)
                }
            }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(time: (days: 10, hours: 12, minutes: 45, seconds: 10))
    }
}
