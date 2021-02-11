//
//  LoginVC.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 10/02/2021.
//

import UIKit

protocol LoginModule: BaseModule {
    var didLogin: (() -> Void)? { set get }
}

final class LoginVC: UIViewController, LoginModule {
    
    //MARK: -
    
    var didLogin: (() -> Void)?
    
    //MARK: - UI
    
    private let label: UILabel = {
        let l = UILabel()
        l.text = "Welcome to coordinators"
        l.textAlignment = .center
        l.textColor = .black
        return l
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .purple
        return button
    }()
             
    //MARK: - Init
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
    }
    
    @objc func action(){
        UserDefaults.standard.isLoggedIn = true
        didLogin?()
    }
    
    //MARK: -
    
    private func setConstraints(){
        view.addSubview(label)
        view.addSubview(button)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
}
