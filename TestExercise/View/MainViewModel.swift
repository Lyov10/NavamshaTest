//
//  MainViewModel.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import Foundation

class MainViewModel {
    
    let router: MainViewRouter
    
    init(router: MainViewRouter) {
        self.router = router
    }
    
    func presentMantrList() {
        router.routeToMantrListScreen()
    }
}
