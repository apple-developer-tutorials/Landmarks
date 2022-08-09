//
//  LandmarksApp.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Chris Hand on 8/8/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
