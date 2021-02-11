//
//  HomeCoordinator.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 09/02/2021.
//  Copyright © 2021 Russell Warwick. All rights reserved.
//

import Foundation

final class HomeCoordinator: BaseCoordinator, CoordinatorOutput {
    
    //MARK: -
    
    var finishFlow: ((CoordinatorOutputResult?) -> Void)?
    
    //MARK: -
    
    private let coordinatorFactory: CoordinatorFactory
    private let moduleFactory: ModuleFactory
    
    //MARK: - Init
    
    init(router: Router, coordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactory){
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
        super.init(router: router)
    }
    
    override func start(with option: DeepLinkType?) {
        //This is the first thing to be called.
        showHomeModule()
    }
    
    //MARK: - Show
    
    private func showHomeModule(){
        let module = moduleFactory.makeHomeModule()
        
        module.didLogOut = { [weak self] in
            self?.finishFlow?(nil)
        }
        
        module.openProduct = { [weak self] id in
            self?.runProductFlow(productID: id)
        }
        
        module.openSettings = { [weak self] in
            self?.showSettingsModule()
        }

        router.setRoot(module)
    }
    
    private func showSettingsModule(){
        let module = moduleFactory.makeSettingsModule()

        module.openProduct = { [weak self] in
            self?.router.pop()
            self?.runProductFlow(productID: 123456)
        }
        
        module.openHelp = { [weak self] in
            self?.showHelpModule()
        }

        router.show(module) { [weak self] in
            self?.finishFlow?(.normal)
        }
    }
    
    private func showHelpModule(){
        let module = moduleFactory.makeHelpModule()
        
        module.onHide = { [weak self] in
            self?.router.dismiss()
        }
        
        router.present(module, style: .pageSheet)
    }

    //MARK: - Run
    
    private func runProductFlow(productID: Int){
        let coordinator = coordinatorFactory.makeProductCoordinator(productId: productID, router: router)
        
        coordinator.finishFlow = { [weak self] item in
            self?.removeDependency(coordinator)
        }
        
        addDependency(coordinator)
        coordinator.start()
    }

}
