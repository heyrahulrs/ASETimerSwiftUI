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
        GeometryReader { geometry in
            body(for: geometry.size)
                .foregroundColor(
                    Color(red: 0.11,
                          green: 0.20,
                          blue: 0.42)
                )
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .background(
                    Color(red: 0.96,
                          green: 0.96,
                          blue: 0.96)
                )
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true)
        }
    }
    
    func body(for size: CGSize) -> some View {
        VStack(spacing: 12.0) {
            Image(eventManager.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: min((size.width / 3.0) + 64.0, 300.0),
                    height: min((size.width / 3.0) + 64.0, 300.0)
                )
            Spacer()
                .frame(height: 16.0)
            Text(eventManager.eventHeading)
                .font(.system(size: 44.0, weight: .heavy))
            Text(eventManager.eventDescription)
                .multilineTextAlignment(.center)
            CountdownView(eventManager: eventManager)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let eventManager = EventManager()
        return Group {
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 11 Pro")
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 11 Pro Max")
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
