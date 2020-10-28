//
//  QuickActionSwuiftUIBlogApp.swift
//  QuickActionSwuiftUIBlog
//
//  Created by Thomas Prezioso on 10/25/20.
//

import SwiftUI

@main
struct QuickActionSwuiftUIBlogApp: App {
    @Environment(\.scenePhase) var lifeCycle
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: lifeCycle) { (newLifeCyclePhase) in
            switch newLifeCyclePhase {
            case .active :
                print("App is active")
            case .inactive:
                print("App is inactive")
            case .background:
                print("App is going to the Background")
                // This will add our dynamic quick actions when our app is sent to the background on our device
                addQuickActions()
            @unknown default:
                print("default")
            }
        }
    }
    
    func addQuickActions() {
        UIApplication.shared.shortcutItems = [
            UIApplicationShortcutItem(type: "Tweet", localizedTitle: "Tweet"),
            UIApplicationShortcutItem(type: "Call", localizedTitle: "Call"),
            UIApplicationShortcutItem(type: "Message", localizedTitle: "Message"),
            UIApplicationShortcutItem(type: "Saved", localizedTitle: "Saved"),
        ]
    }
}
