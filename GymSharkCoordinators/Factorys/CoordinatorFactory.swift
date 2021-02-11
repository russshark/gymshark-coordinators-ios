//
//  CoordinatorFactory.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 09/02/2021.
//  Copyright © 2021 Russell Warwick. All rights reserved.
//

import Foundation

protocol CoordinatorFactory {
    
    func makeAuthCoordinator(router: Router) -> Coordinator & CoordinatorOutput
    func makeHomeCoordinator(router: Router) -> Coordinator & CoordinatorOutput
    func makeProductCoordinator(productId: Int, router: Router) -> Coordinator & CoordinatorOutput
}
