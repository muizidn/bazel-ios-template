//
//  AppDelegate.swift
//  ModuleApp
//
//  Created by Muis on 25/09/20.
//  Copyright © 2020 Muis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        window.rootViewController =  vc
        
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }

}

