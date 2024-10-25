//
//  EmmaExampleAppApp.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 4/10/24.
//

import SwiftUI
import EMMA_iOS

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    var routeViewModel = RouteViewModel()
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        // EMMA uses window to display some InApp Messages
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let configuration = EMMAConfiguration()
        configuration.debugEnabled = true
        configuration.sessionKey = ""
        configuration.pushNotificationsDelegate = self // EMMA Push
        EMMA.startSession(with: configuration)
        EMMA.startPushSystem() // Enable EMMA Push System
        return true
    }
    
    // EMMA Push
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        EMMA.registerToken(deviceToken)
    }
    
    // EMMA Push
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if #available(iOS 14.0, *) {
            completionHandler([.badge, .sound, .banner, .list])
        } else {
            completionHandler([.badge, .sound, .alert])
        }
    }
    
    // EMMA Push
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        // Extraemos el deeplink del payload de la notificación
        if let deeplink = userInfo["deeplink"] as? String {
            routeViewModel.deeplink = deeplink
        }
        
        EMMA.handlePush(userInfo: userInfo)
        completionHandler()
    }
    
    // EMMA Powlink
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
    var routeViewModel = RouteViewModel()
    
    init() {
        appDelegate.routeViewModel = routeViewModel
    }
    
    // MARK: - Main -
    var body: some Scene {
        WindowGroup {
            RouteView()
                .environmentObject(routeViewModel)
        }
    }
}
