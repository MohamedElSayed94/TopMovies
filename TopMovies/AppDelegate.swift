//
//  AppDelegate.swift
//  TopMovies
//
//  Created by Mohamed Elsayed on 24/12/2020.
//  Copyright © 2020 Mohamed Elsayed. All rights reserved.
//

import UIKit
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("RealmURL: \(Realm.Configuration.defaultConfiguration.fileURL!)")
        coordinator = AppCoordinator()
        coordinator.start()
        return true
    }

   

}

