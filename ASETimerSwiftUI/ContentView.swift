//
//  ContentView.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/5/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

enum RowType: String {
    case days = "Days"
    case hours = "Hours"
    case minutes = "Minutes"
    case seconds = "Seconds"
}

typealias Time = (days: Int, hours: Int,
    minutes: Int, seconds: Int)

func getCountdownTime(from eventTime: Double) -> Time {
    let secondsUntilEvent = eventTime - Date().timeIntervalSince1970
    let days = Int(secondsUntilEvent / 86400)
    let hours = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 86400) / 3600)
    let minutes = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 3600) / 60)
    let seconds = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 60))
    return (days, hours, minutes, seconds)
}

struct ContentView: View {
    
    @State var time: Time = (0, 0, 0, 0)
    
    var body: some View {
        CountdownView(time: time)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    self.time = getCountdownTime(from: 1568307600.0)
                }
            }
    }
}

struct CountdownView: View {
    
    var time: Time
    
    var body: some View {
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

struct CountdownRow: View {
    
    var number: Int
    var text: RowType
        
    var body: some View {
        VStack {
            Text(String(format: "%02d", number))
                .font(.custom("AvenirNext-Bold", size: 38.0))
            Text(text.rawValue.uppercased())
                .fontWeight(.bold)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

struct SeparatorView: View {
    var body: some View {
        Text(":")
            .bold()
            .font(.largeTitle)
            .frame(height: 52.7)
            .offset(y: -2)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        CountdownRow(number: 5, text: .minutes, isLastRow: true)
    }
}
#endif
