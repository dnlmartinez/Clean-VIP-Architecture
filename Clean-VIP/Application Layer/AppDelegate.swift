//
//  AppDelegate.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let characterViewController = CharacterViewController()
        let navigationController = UINavigationController(rootViewController: characterViewController)
        
        CharacterConfigurator.configureModule(viewController: characterViewController)
        
        
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.init(named: "RedMarvel")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 24)]
        
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance
        
        return true
    }

}

