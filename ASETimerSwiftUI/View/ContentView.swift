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
        GeometryReader { proxy in
            ZStack(alignment: .bottom){
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Image(eventManager.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: proxy.size.height * 0.6)
                        .ignoresSafeArea()
                    Spacer(minLength: 0.0)
                }
                VStack(spacing: 40.0) {
                    VStack(spacing: 12.0) {
                        Text(eventManager.eventHeading)
                            .font(.system(size: 40.0, weight: .bold))
                        Text(eventManager.eventDescription)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        CountdownView(eventManager: eventManager)
                    }
                    .layoutPriority(1)
                    .padding(.horizontal)
                    .padding(.bottom)
                    Spacer(minLength: 0)
                }
                .foregroundColor(Color("HeroColor"))
                .frame(width: proxy.size.width,
                       height: proxy.size.height * 0.4)
            }
            .statusBar(hidden: true)
            .frame(width: proxy.size.width,
                   height: proxy.size.height,
                   alignment: .bottom)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let eventManager = EventManager()
        return Group {
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 13 Pro")
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone 13 mini")
            ContentView(eventManager: eventManager)
                .previewDevice("iPhone SE (3rd generation)")
        }
    }
}
