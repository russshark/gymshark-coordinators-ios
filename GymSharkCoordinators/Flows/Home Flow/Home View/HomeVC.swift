//
//  HomeVC.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 10/02/2021.
//

import UIKit

protocol HomeModule: BaseModule {
    var didLogOut: VoidCompletion? { get set }
    var openProduct: ((Int) -> Void)? { get set }
    var openSettings: VoidCompletion? { get set }
}

final class HomeVC: UIViewController, HomeModule {
    
    //MARK: - Module
    
    var didLogOut: VoidCompletion?
    var openProduct: ((Int) -> Void)?
    var openSettings: VoidCompletion?

    //MARK: - UI
    
    private let button1: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        button.setTitle("Settings", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    private let button3: UIButton = {
        let button = UIButton()
        button.setTitle("Open PDP", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    private let button4: UIButton = {
        let button = UIButton()
        button.setTitle("Open PDP", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .orange
        return button
    }()

    //MARK: - Init
    
    init(viewModel: HomeVM){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "HOME"
        setConstraints()
    }
    
    //MARK: - Actions
    
    @objc func action1(){
        UserDefaults.standard.isLoggedIn = false
        didLogOut?()
    }
    
    @objc func action2(){
        openSettings?()
    }
    
    @objc func action3(){
        openProduct?(123456)
    }
    
    //MARK: -
    
    private func setConstraints(){
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button1.widthAnchor.constraint(equalToConstant: 100),
            
            button2.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button2.widthAnchor.constraint(equalToConstant: 100),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 80),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button3.heightAnchor.constraint(equalToConstant: 100),
            
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 30),
            button4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button4.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
        button1.addTarget(self, action: #selector(action1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(action2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(action3), for: .touchUpInside)
        button4.addTarget(self, action: #selector(action3), for: .touchUpInside)
    }
}
