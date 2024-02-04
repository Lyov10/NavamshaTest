//
//  MantrListViewController.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import UIKit

class MantrListViewController: UIViewController {
    
    let viewModel: MantrListViewModel
    private let mantraCellName = "MantrTableViewCell"
    
    lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.text = "Список мантр"
        titleLabel.font = .peachiBlack(size: 36)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        return titleLabel
    }()
    
    lazy var mantrTabelView: UITableView = {
        
        let mantrTabelView = UITableView()
        mantrTabelView.delegate = self
        mantrTabelView.dataSource = self
        mantrTabelView.register(MantrTableViewCell.self, forCellReuseIdentifier: mantraCellName)
        mantrTabelView.translatesAutoresizingMaskIntoConstraints = false
        mantrTabelView.backgroundColor = .clear
        view.addSubview(mantrTabelView)
        return mantrTabelView
    }()
    
    lazy var shuffleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Перемешать", for: .normal)
        button.setImage(UIImage(named: "ic_shuffle"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setRadius(radius: 22)
        button.titleLabel?.font = .nunitoBold(size: 16)
        button.addBorder(color: .white.withAlphaComponent(0.07))
        button.addTarget(self, action: #selector(shuffleList), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()
    
    init(viewModel: MantrListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        updateTableView()
    }
    
    func updateTableView() {
        viewModel.updateTableView = {[weak self] in
            guard let self = self else {return}
            self.mantrTabelView.reloadData()
        }
    }
    
    private func configureView() {
        view.backgroundColor = .backgrounColor
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: mantrTabelView.topAnchor, constant: -30),
            
            mantrTabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mantrTabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mantrTabelView.bottomAnchor.constraint(equalTo: shuffleButton.topAnchor, constant: 0),
            
            shuffleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shuffleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            shuffleButton.heightAnchor.constraint(equalToConstant: 62),
            shuffleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
        ])
    }
    
    @objc private func shuffleList() {
        viewModel.shuffleDataSource()
    }
}

extension MantrListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mantraCellName, for: indexPath) as! MantrTableViewCell
        cell.setupCell(mantra: viewModel.dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
