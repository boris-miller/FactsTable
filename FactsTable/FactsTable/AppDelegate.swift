//
//  AppDelegate.swift
//  FactsTable
//
//  Created by Boris Miller on 5/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        let rootControoler = ViewController()
        window?.rootViewController = rootControoler
        
        return true
    }


}

