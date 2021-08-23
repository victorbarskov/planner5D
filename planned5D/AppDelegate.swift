//
//  AppDelegate.swift
//  planned5D
//
//  Created by Victor Barskov on 20.08.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    override init () {
        super.init()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let root = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProjectsViewController") as? ProjectsViewController {
            window?.rootViewController = UINavigationController(rootViewController:  root)
        }
        
        return true
    }

    

}

