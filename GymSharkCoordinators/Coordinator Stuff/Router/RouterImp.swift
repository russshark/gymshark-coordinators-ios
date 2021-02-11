//
//  RouterImp.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 09/02/2021.
//  Copyright © 2021 Russell Warwick. All rights reserved.
//

import UIKit

final class RouterImp: NSObject, Router {

    //MARK: - Dependencies

    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
    
    //MARK: - Init
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        self.completions = [:]
        super.init()
        self.rootController?.delegate = self
    }

    //MARK: - Set Module To Root Of Navigation Controller

    func setRoot(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
    }
    
    //MARK: - Present Module & Dismiss
    
    func present(_ module: Presentable?, style: UIModalPresentationStyle, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        controller.modalPresentationStyle = style

        rootController?.present(controller, animated: animated, completion: nil)
    }

    func dismiss(animated: Bool){
        rootController?.dismiss(animated: animated, completion: nil)
    }
    
    //MARK: - Show Module & Pop Navigation Stack
    
    func show(_ module: Presentable?, animated: Bool, completion: (() -> Void)?){
        
        guard let controller = module?.toPresent() else { return }
        
        if let completion = completion {
            completions[controller] = completion
        }
                
        rootController?.show(controller, sender: self)
    }

    func pop(animated: Bool)  {
        if let poppedViewController = rootController?.popViewController(animated: animated) {
            runCompletion(for: poppedViewController)
        }
    }
    
    func popToRoot(animated: Bool){
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
}

extension RouterImp: UINavigationControllerDelegate {
    
    //This handles what happens when a navigation stack is dismiss out of our control
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(poppedViewController) else { return }

        runCompletion(for: poppedViewController)
    }

    func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}
