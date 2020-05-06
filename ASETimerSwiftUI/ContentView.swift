//
//  ContentView.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/5/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var event = Event()
    
    var body: some View {
        VStack(spacing: 12.0) {
            HStack(alignment: .bottom) {
                Image(event.leftImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 174.0, height: 174)
                    .offset(x: 28)
                Image("M0_2x")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 174.0, height: 174)
                Image(event.rightImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 174.0, height: 174)
                    .offset(x: -28)
            }
            Spacer()
                .frame(height: 16.0)
            Text(event.heading)
                .font(.system(size: 44, weight: .heavy))
            Text(event.description)
                .multilineTextAlignment(.center)
            CountdownView(event: event)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        }
        .colorScheme(.dark)
    }
}
