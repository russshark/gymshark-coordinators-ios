//
//  ProductCoordinator.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 11/02/2021.
//

import Foundation

final class ProductCoordinator: BaseCoordinator, CoordinatorOutput {
    
    //MARK: -
    
    var finishFlow: ((CoordinatorOutputResult?) -> Void)?
    
    //MARK: -
    
    private let moduleFactory: ModuleFactory
    private let productId: Int
    
    //MARK: - Init
    
    init(productId: Int, router: Router, moduleFactory: ModuleFactory){
        self.productId = productId
        self.moduleFactory = moduleFactory
        super.init(router: router)
    }
    
    override func start(with option: DeepLinkType?) {
        //This is the first thing to be called.
        showProductModule(productID: productId)
    }
    
    private func showProductModule(productID: Int){
        let module = moduleFactory.makeProductModule(productID: productID)
        
        module.goToNext = { [weak self] in
            self?.showProductModule(productID: productID)
        }
        
        module.openHelp = { [weak self] in
            self?.showHelpModule()
        }
        
        module.collapseAll = { [weak self] in
            self?.router.popToRoot()
            self?.finishFlow?(nil)
        }

        router.show(module) { [weak self] in
            self?.finishFlow?(nil)
        }
    }
    
    private func showHelpModule(){
        let module = moduleFactory.makeHelpModule()
        
        module.onHide = { [weak self] in
            self?.router.dismiss()
        }
        
        router.present(module, style: .pageSheet)
    }
}
