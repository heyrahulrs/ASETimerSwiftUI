//
//  SceneDelegate.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/5/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let eventManager = EventManager()
        let contentView = ContentView(eventManager: eventManager)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

