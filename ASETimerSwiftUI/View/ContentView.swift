//
//  ContentView.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/5/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme
    
    var eventManager: EventManager

    var body: some View {
        ZStack {
            if colorScheme == .dark {
                Color(red: 0.04, green: 0.04, blue: 0.03)
                    .edgesIgnoringSafeArea(.all)
            } else {
                Color(red: 0.96, green: 0.96, blue: 0.97)
                    .edgesIgnoringSafeArea(.all)
            }
            VStack(spacing: 36.0) {
                AspectFillImage(eventManager.imageName)
                    .frame(width: 360.0, height: 360.0)
                VStack(spacing: 12.0) {
                    Text(eventManager.eventHeading)
                        .font(.system(size: 44.0, weight: .bold))
                    Text(eventManager.eventDescription)
                        .multilineTextAlignment(.center)
                    CountdownView(eventManager: eventManager)
                }
                .layoutPriority(1)
                .padding(.bottom)
            }
            .foregroundColor(.primary)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let eventManager = EventManager()
        return Group {
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 12 Pro")
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 12 Pro")
                .colorScheme(.dark)
//            ContentView(eventManager: eventManager)
//                .previewDevice("iPhone 12 mini")
//            ContentView(eventManager: eventManager)
//                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
