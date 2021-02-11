//
//  ModuleFactoryImp.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 09/02/2021.
//  Copyright © 2021 Russell Warwick. All rights reserved.
//

import Foundation

final class ModuleFactoryImp: ModuleFactory {
    func makeLoginModule() -> LoginModule {
        return LoginVC()
    }
    
    func makeHomeModule() -> HomeModule {
        return HomeVC(viewModel: HomeVM())
    }
    
    func makeProductModule(productID: Int) -> ProductModule {
        return ProductVC(viewModel: ProductVM(productID: productID))
    }
    
    func makeSettingsModule() -> SettingsModule {
        return SettingsVC()
    }
    
    func makeHelpModule() -> HelpModule {
        return HelpVC()
    }
}
