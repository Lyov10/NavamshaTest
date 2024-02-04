//
//  ViewController.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import UIKit

class MainViewController: UIViewController {
    
    let viewModel: MainViewModel
    
    lazy var openSheetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Открыть список мантр", for: .normal)
        button.backgroundColor = .buttonBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setRadius(radius: 22)
        button.titleLabel?.font = .nunitoBold(size: 16)
        button.addTarget(self, action: #selector(presentMantrList), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
   private func configureView() {
        
        view.backgroundColor = .mainViewBackground
        
        NSLayoutConstraint.activate([
            openSheetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openSheetButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openSheetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            openSheetButton.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    @objc func presentMantrList() {
        viewModel.presentMantrList()
    }
}

