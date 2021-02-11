//
//  Router.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 09/02/2021.
//  Copyright © 2021 Russell Warwick. All rights reserved.
//

import UIKit

protocol Router {
    
    //MARK: - Set Module To Root Of Navigation Controller

    func setRoot(_ module: Presentable?)
    
    //MARK: - Present & Dismiss
    
    func present(_ module: Presentable?, style: UIModalPresentationStyle, animated: Bool)
    func dismiss(animated: Bool)
    
    //MARK: - Show & Pop Navigation Stack
    
    func show(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
}

extension Router {
    
    //Default behavior

    //MARK: - Present Module & Dismiss
    
    func present(_ module: Presentable?, style: UIModalPresentationStyle = .fullScreen, animated: Bool = true){
        self.present(module, style: style, animated: animated)
    }
    
    func dismiss(animated: Bool = true){
        self.dismiss(animated: animated)
    }
    
    //MARK: - Show Module & Pop Navigation Stack
    
    func show(_ module: Presentable?, animated: Bool = true, completion: (() -> Void)? = nil){
        self.show(module, animated: animated, completion: completion)
    }

    func pop(animated: Bool = true){
        self.pop(animated: animated)
    }
    
    func popToRoot(animated: Bool = true){
        self.popToRoot(animated: animated)
    }
}
