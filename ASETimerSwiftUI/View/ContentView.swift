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

    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 40.0) {
                Spacer(minLength: 0)
                Image(eventManager.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 400.0)
                    .offset(y: -84.0)
                    .padding(.bottom, -84.0)
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
//            ContentView(eventManager: eventManager)
//                .previewDevice("iPhone 12 mini")
//            ContentView(eventManager: eventManager)
//                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
