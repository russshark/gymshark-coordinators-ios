//
//  HelpVC.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 11/02/2021.
//

import UIKit

protocol HelpModule: BaseModule {
    var onHide: VoidCompletion? { get set }
}

final class HelpVC: UIViewController, HelpModule {
    
    //MARK: -
    
    var onHide: VoidCompletion?

    //MARK: - UI
    
    private let button1: UIButton = {
        let button = UIButton()
        button.setTitle("Hide me", for: .normal)
        button.setTitleColor(.red, for: .normal)
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
        title = "HELP"
        setConstraints()
    }
    
    //MARK: - Actions
    
    @objc func action1(){
        onHide?()
    }
    
    //MARK: -
    
    private func setConstraints(){
        view.addSubview(button1)

        button1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        button1.addTarget(self, action: #selector(action1), for: .touchUpInside)
    }
}
