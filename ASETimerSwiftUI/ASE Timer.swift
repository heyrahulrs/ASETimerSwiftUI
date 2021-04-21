//
//  ASE Timer.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 21/04/21.
//  Copyright © 2021 Rahul Sharma. All rights reserved.
//

import SwiftUI

@main
struct ASE_Timer: App {

    @StateObject var eventManager = EventManager()

    var body: some Scene {
        WindowGroup {
            ContentView(eventManager: eventManager)
        }
    }
    
}
