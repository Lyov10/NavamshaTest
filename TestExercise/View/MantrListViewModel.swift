//
//  MantrListViewModel.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import Foundation

class MantrListViewModel {
    
    let dataManager: DataManager
    var dataSource : [Mantra] {
        didSet {
            self.updateTableView()
        }
    }
    var updateTableView: () -> Void = {}
    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
        dataSource = dataManager.fetchData() ?? []
    }
    
    func shuffleDataSource() {
        dataSource = dataSource.shuffled()
    }
}
