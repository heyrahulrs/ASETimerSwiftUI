//
//  ContentView.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/5/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

extension UIDevice {
    static var isLandscape: Bool {
        UIDevice.current.orientation != .landscapeLeft || UIDevice.current.orientation != .landscapeRight
    }
    static var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
struct ContentView: View {
    
    var event = Event()
    
    @State var time: Time = (0, 0, 0, 0)
    
    var body: some View {
        VStack {
            Spacer()
            Image(self.event.imageName)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,
                       maxHeight: UIDevice.isLandscape || UIDevice.isPad ? 312 : 156)
                .aspectRatio(UIImage(named: "Hero")!.size, contentMode: .fit)
            if !UIDevice.isLandscape ||  UIDevice.isPad {
                Spacer()
                    .frame(height: 48.0)
            }
            CountdownView(time: self.time)
                .onAppear {
                    self.time = getCountdownTime(from: self.event.unixTime)
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                        self.time = getCountdownTime(from: self.event.unixTime)
                    }
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
