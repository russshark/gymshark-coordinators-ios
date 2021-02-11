//
//  CoordinatorFactoryImp.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 09/02/2021.
//  Copyright © 2021 Russell Warwick. All rights reserved.
//

import Foundation

struct CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeHomeCoordinator(router: Router) -> Coordinator & CoordinatorOutput {
        return HomeCoordinator(router: router, coordinatorFactory: CoordinatorFactoryImp(), moduleFactory: ModuleFactoryImp())
    }
    
    func makeAuthCoordinator(router: Router) -> Coordinator & CoordinatorOutput {
        return AuthCoordinator(router: router, coordinatorFactory: CoordinatorFactoryImp(), moduleFactory: ModuleFactoryImp())
    }

    func makeProductCoordinator(productId: Int, router: Router) -> Coordinator & CoordinatorOutput {
        return ProductCoordinator(productId: productId, router: router, moduleFactory: ModuleFactoryImp())
    }
}
