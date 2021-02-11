//
//  AppCoordinator.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 09/02/2021.
//  Copyright © 2021 Russell Warwick. All rights reserved.
//

import Foundation

final class AppCoordinator: BaseCoordinator {
    
    //MARK: -
    
    private let coordinatorFactory: CoordinatorFactory
    
    //MARK: - Init
    
    init(router: Router, coordinatorFactory: CoordinatorFactory){
        self.coordinatorFactory = coordinatorFactory
        super.init(router: router)
    }
        
    override func start(with option: DeepLinkType?) {
        //This is the first thing to be called.
        if UserDefaults.standard.isLoggedIn {
            runHomeFlow()
        } else {
            runAuthFlow()
        }
    }
    
    //MARK: - Run
    
    private func runHomeFlow(){
        let coordinator = coordinatorFactory.makeHomeCoordinator(router: router)
        
        coordinator.finishFlow = { [weak self] item in
            self?.removeDependency(coordinator)
            self?.start()
        }
        
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runAuthFlow(){
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
        
        coordinator.finishFlow = { [weak self] item in
            self?.removeDependency(coordinator)
            self?.start()
        }
        
        addDependency(coordinator)
        coordinator.start()
    }
}
