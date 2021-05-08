//
//  ContentView.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/5/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var eventManager: EventManager

    var gradient: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [Color(red: 0.04, green: 0.04, blue: 0.03), Color.clear]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(height: 50.0)
    }

    var gradientInverted: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.clear, Color(red: 0.04, green: 0.04, blue: 0.03)]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(height: 50.0)
    }

    var body: some View {
        ZStack {
            Color(red: 0.04, green: 0.04, blue: 0.03)
            VStack(spacing: 36.0) {
                Spacer(minLength: 0)
                Image(eventManager.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300.0)
                    .clipped()
                    .overlay(
                        VStack {
                            gradient
                            Spacer()
                            gradientInverted
                        }
                    )
                VStack(spacing: 12.0) {
                    Text(eventManager.eventHeading)
                        .font(.system(size: 44.0, weight: .bold))
                    Text(eventManager.eventDescription)
                        .multilineTextAlignment(.center)
                    CountdownView(eventManager: eventManager)
                }
                .layoutPriority(1)
                .padding(.bottom)
                Spacer(minLength: 0)
            }
            .foregroundColor(.white)
            .offset(y: -28.0)
        }
        .ignoresSafeArea()
        .statusBar(hidden: true)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let eventManager = EventManager()
        return Group {
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 12 Pro")
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 12 mini")
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
