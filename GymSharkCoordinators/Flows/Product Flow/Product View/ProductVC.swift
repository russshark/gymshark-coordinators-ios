//
//  ProductVC.swift
//  GymSharkCoordinators
//
//  Created by Russell Warwick on 10/02/2021.
//

import UIKit

protocol ProductModule: BaseModule {
    var goToNext: VoidCompletion? { get set }
    var openHelp: VoidCompletion? { get set }
    var collapseAll: VoidCompletion? { get set }
}

final class ProductVC: UIViewController, ProductModule {
    
    //MARK: - Module
    
    var goToNext: VoidCompletion?
    var openHelp: VoidCompletion?
    var collapseAll: VoidCompletion?

    //MARK: - UI
    
    private let label: UILabel = {
        let l = UILabel()
        l.text = "This is a product page \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        l.textAlignment = .center
        l.textColor = .black
        l.numberOfLines = 0
        return l
    }()
    
    private let helpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Help?", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next item", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    private let collapseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Collapse all", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    //MARK: - Dependencies
    
    private let viewModel: ProductVM
    
    //MARK: - Init
    
    init(viewModel: ProductVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "PRODUCT"
        setConstraints()
    }
    
    func nextVC(){
        
        let dataId = 12345

        let vc = ProductVC(viewModel: ProductVM(productID: dataId))

        vc.navigationController?.show(vc, sender: self)
    }
    
    @objc func action(){
        goToNext?()
    }
    
    @objc func help(){
        openHelp?()
    }
    
    @objc func action2(){
        collapseAll?()
    }
    
    //MARK: -
    
    private func setConstraints(){
        view.addSubview(nextButton)
        view.addSubview(label)
        view.addSubview(helpButton)
        view.addSubview(collapseButton)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        collapseButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            helpButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            helpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            helpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            collapseButton.topAnchor.constraint(equalTo: helpButton.bottomAnchor, constant: 20),
            collapseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            collapseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        nextButton.addTarget(self, action: #selector(action), for: .touchUpInside)
        helpButton.addTarget(self, action: #selector(help), for: .touchUpInside)
        collapseButton.addTarget(self, action: #selector(action2), for: .touchUpInside)
    }
}
