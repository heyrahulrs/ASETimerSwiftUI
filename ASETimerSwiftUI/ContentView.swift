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
        VStack(spacing: 12.0) {
            HStack(alignment: .bottom) {
                Image(eventManager.leftImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 174.0, height: 174)
                    .scaleEffect(0.9)
                    .offset(x: 28)
                Image(eventManager.middleImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 174.0, height: 174)
                    .scaleEffect(1.1)
                Image(eventManager.rightImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 174.0, height: 174)
                    .scaleEffect(0.9)
                    .offset(x: -28)
            }
            Spacer()
                .frame(height: 16.0)
            Text(eventManager.eventHeading)
                .font(.system(size: 44, weight: .heavy))
            Text(eventManager.eventDescription)
                .multilineTextAlignment(.center)
            CountdownView(eventManager: eventManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let eventManager = EventManager()
        return Group {
            ContentView(eventManager: eventManager)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
            ContentView(eventManager: eventManager)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
            ContentView(eventManager: eventManager)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            ContentView(eventManager: eventManager)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
        }
        .colorScheme(.dark)
    }
}
