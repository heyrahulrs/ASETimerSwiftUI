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

    var gradient: Gradient {
        Gradient(
            colors: [
                Color(red: 0.89, green: 0.45, blue: 0.19),
                Color(red: 0.98, green: 0.85, blue: 0.45)
            ]
        )
    }

    var overlay: some View {
        LinearGradient(gradient: gradient,
                       startPoint: .top, endPoint: .bottom)
        .mask(
            Text(eventManager.eventHeading)
                .font(.system(size: 44.0, weight: .bold))
        )
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack(spacing: 12.0) {
                    Image(eventManager.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width,
                               height: geometry.size.height * 0.7)
                    Spacer()
                }
                VStack(spacing: 12.0) {
                    Spacer()
                    Text(eventManager.eventHeading)
                        .font(.system(size: 44.0, weight: .bold))
                        .overlay(overlay)
                    Text(eventManager.eventDescription)
                        .multilineTextAlignment(.center)
                    CountdownView(eventManager: eventManager)
                }
                .layoutPriority(1)
                .padding(.bottom, geometry.size.height * 0.14)
            }
            .frame(width: geometry.size.width,
                   height: geometry.size.height,
                   alignment: .center)
        }
        .foregroundColor(Color(red: 0.98, green: 0.85, blue: 0.45))
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .center)
        .background(
            Color("BackgroundColor")
        )
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }

}

struct ContentView_Previews: PreviewProvider {
    static let eventManager = EventManager()
    static var previews: some View {
        Group {
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 11 Pro")
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 11 Pro Max")
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
