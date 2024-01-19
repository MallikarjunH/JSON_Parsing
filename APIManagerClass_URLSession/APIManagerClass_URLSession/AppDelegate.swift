//
//  AppDelegate.swift
//  APIManagerClass_URLSession
//
//  Created by Mallikarjun H on 19/01/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    class func shared() -> AppDelegate {
        return (UIApplication.shared.delegate as? AppDelegate)!
    }
    
    func showLoginViewController() {
        
        /*
        let homeVC = (UIStoryboard.init(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController)!
        let nvc = UINavigationController.init(rootViewController: homeVC)
        window?.rootViewController = nvc
        */
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

