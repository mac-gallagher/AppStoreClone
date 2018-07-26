//
//  AppDelegate.swift
//  AppStoreClone
//
//  Created by Mac Gallagher on 3/9/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let layout = UICollectionViewFlowLayout()
        let featuredAppsController = FeaturedAppsController(collectionViewLayout: layout)
        window?.rootViewController = UINavigationController(rootViewController: featuredAppsController)
        return true
    }

}

