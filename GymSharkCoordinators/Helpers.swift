//
//  Helpers.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 10/02/2021.
//

import Foundation

typealias VoidCompletion = (() -> Void)

extension UserDefaults {
    var isLoggedIn: Bool {
        set { set(newValue, forKey: "is_logged_in") }
        get {
            guard let value = object(forKey: "is_logged_in") as? Bool else { return false }
            return value
        }
    }
}
