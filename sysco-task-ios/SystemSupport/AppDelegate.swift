//
//  AppDelegate.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        
        let navigationController = UINavigationController(rootViewController: PlanetHomeViewController())
        
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

