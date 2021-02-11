//
//  AuthCoordinator.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 10/02/2021.
//

import Foundation

final class AuthCoordinator: BaseCoordinator, CoordinatorOutput {
    
    //MARK: -
    
    var finishFlow: ((CoordinatorOutputResult?) -> Void)?
    
    //MARK: -
    
    private let coordinatorFactory: CoordinatorFactory
    private let moduleFactory: ModuleFactory // ViewCOntrollerFactroy
    
    //MARK: - Init
    
    init(router: Router, coordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactory){
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
        super.init(router: router)
    }
    
    override func start(with option: DeepLinkType?) {
        //This is the first thing to be called.
        showLoginModule()
    }
    
    //MARK: - Show
    
    private func showLoginModule(){
        let module = moduleFactory.makeLoginModule()
        
        module.didLogin = { [weak self] in
            self?.finishFlow?(nil)
        }
        
        router.setRoot(module)
    }
}
