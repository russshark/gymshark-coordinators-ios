//
//  Coordinator.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 09/02/2021.
//  Copyright © 2021 Russell Warwick. All rights reserved.
//

protocol DeepLinkType {

}

protocol Coordinator: class {
    
    var router: Router { get }
    
    func start()
    func start(with option: DeepLinkType?)
    
    func addDependency(_ coordinator: Coordinator)
    func removeDependency(_ coordinator: Coordinator?)
}

enum CoordinatorOutputResult {
    case normal
    case cancelled
    case error
    //these can be anything you want
}

protocol CoordinatorOutput: class {
    var finishFlow: ((CoordinatorOutputResult?) -> Void)? { get set }
}
