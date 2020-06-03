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
            ZStack {
                self.body(for: geometry.size)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func body(for size: CGSize) -> some View {
        VStack(spacing: 12.0) {
            HStack(alignment: .bottom) {
                Image(eventManager.leftImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: min((size.width / 3.0) + 64.0, 300.0),
                        height: min((size.width / 3.0) + 64.0,  300.0)
                    )
                    .scaleEffect(0.9)
                    .offset(x: 28)
                Image(eventManager.middleImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: min((size.width / 3.0) + 64.0, 300.0),
                        height: min((size.width / 3.0) + 64.0, 300.0)
                    )
                    .scaleEffect(1.1)
                Image(eventManager.rightImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: min((size.width / 3.0) + 64.0, 300.0),
                        height: min((size.width / 3.0) + 64.0, 300.0)
                    )
                    .scaleEffect(0.9)
                    .offset(x: -28)
            }
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
        return ContentView(eventManager: eventManager)
            .colorScheme(.dark)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
            .previewDisplayName("iPhone 11 Pro")
    }
}
