//
//  ModuleFactory.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 10/02/2021.
//

import Foundation

protocol ModuleFactory {
    func makeHomeModule() -> HomeModule
    func makeLoginModule() -> LoginModule
    func makeProductModule(productID: Int) -> ProductModule
    func makeSettingsModule() -> SettingsModule
    func makeHelpModule() -> HelpModule
}
