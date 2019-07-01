//
//  AppDelegate.swift
//  Project1
//
//  Created by Faisal Ikwal on 03/06/19.
//  Copyright © 2019 Exilant Technologies. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: MainCoordinator?
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // create our coordinator
        coordinator = MainCoordinator()
        coordinator?.start()

        // create the window for our app and make it use our navigation controller
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()

        return true
    }



}

