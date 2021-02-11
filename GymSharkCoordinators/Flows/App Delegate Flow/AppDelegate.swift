//
//  AppDelegate.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 09/02/2021.
//  Copyright © 2021 Russell Warwick. All rights reserved.
//

import UIKit

enum DeepLinks: DeepLinkType {
    case pdp(id: String)
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var rootController: UINavigationController? {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        window?.makeKeyAndVisible()
        return window?.rootViewController as? UINavigationController
    }
    
    private lazy var applicationCoordinator: Coordinator? = makeCoordinator()

    private func makeCoordinator() -> Coordinator? {
        guard let rootController = rootController else { return nil }
        return AppCoordinator(router: RouterImp(rootController: rootController), coordinatorFactory: CoordinatorFactoryImp())
    }

    //MARK: - UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let deepLink: DeepLinkType = DeepLinks.pdp(id: "1234567acb") //Get id from userInfo e.c.t
        
        applicationCoordinator?.start(with: deepLink)
        
        return true
    }
}
