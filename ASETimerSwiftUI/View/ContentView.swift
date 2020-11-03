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
            ZStack(alignment: .bottom) {
                Image(eventManager.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 12.0) {
                    Spacer(minLength: 0.0)
                    Text(eventManager.eventHeading)
                        .font(.system(size: 44.0, weight: .bold))
                    Text(eventManager.eventDescription)
                        .multilineTextAlignment(.center)
                    CountdownView(eventManager: eventManager)
                }
                .layoutPriority(1)
                .padding(.bottom, geometry.size.height * 0.10)
            }
            .frame(width: geometry.size.width,
                   height: geometry.size.height,
                   alignment: .center)
        }
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .center)
        .background(
            Color(#colorLiteral(red: 0.03137254902, green: 0.003921568627, blue: 0.1921568627, alpha: 1))
                .edgesIgnoringSafeArea(.all)
        )
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
