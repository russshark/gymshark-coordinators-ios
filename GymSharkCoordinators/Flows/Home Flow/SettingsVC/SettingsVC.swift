//
//  SettingsVC.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 10/02/2021.
//

import UIKit

protocol SettingsModule: BaseModule {
    var openHelp: VoidCompletion? { get set }
    var openProduct: VoidCompletion? { get set }
}

final class SettingsVC: UIViewController, SettingsModule {
    
    //MARK: - Module
    
    var openHelp: VoidCompletion?
    var openProduct: VoidCompletion?

    //MARK: - UI
    
    private let button1: UIButton = {
        let button = UIButton()
        button.setTitle("Help Section", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        button.setTitle("Show Product", for: .normal)
        button.setTitleColor(.purple, for: .normal)
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
        title = "SETTINGS"
        setConstraints()
    }
    
    //MARK: - Actions
    
    @objc func action1(){
        openHelp?()
    }
    
    @objc func action2(){
        openProduct?()
    }
    
    //MARK: -
    
    private func setConstraints(){
        view.addSubview(button1)
        view.addSubview(button2)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 40),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        button1.addTarget(self, action: #selector(action1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(action2), for: .touchUpInside)
    }
}
