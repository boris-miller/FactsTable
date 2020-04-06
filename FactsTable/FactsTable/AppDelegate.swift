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
    var navController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootController = ViewController()

        navController = UINavigationController()
        navController?.pushViewController(rootController, animated: false)

        window = UIWindow()
        window?.rootViewController = navController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()

        return true
    }

}

