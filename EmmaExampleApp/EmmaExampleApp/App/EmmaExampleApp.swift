//
//  EmmaExampleAppApp.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 4/10/24.
//

import SwiftUI
import EMMA_iOS

class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        // EMMA uses window to display some InApp Messages
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let configuration = EMMAConfiguration()
        configuration.sessionKey = ""
        EMMA.startSession(with: configuration)
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([any UIUserActivityRestoring]?) -> Void) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            if let url = userActivity.webpageURL {
                EMMA.handleLink(url: url)
            }
        }
        return true
    }
}

@main
struct EmmaExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // MARK: - Properties -
    @StateObject var routeViewModel = RouteViewModel()
    
    // MARK: - Main -
    var body: some Scene {
        WindowGroup {
            RouteView()
                .environmentObject(routeViewModel)
        }
    }
}
