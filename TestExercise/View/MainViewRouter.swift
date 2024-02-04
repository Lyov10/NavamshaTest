//
//  MainViewRouter.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import Foundation
import UIKit

class MainViewRouter {
    
    var viewController: UIViewController?
}

protocol MainViewRouterProtocol {
    
    func routeToMantrListScreen()
}

extension MainViewRouter: MainViewRouterProtocol {
    
    func routeToMantrListScreen() {
        
        let mantrList = MantrListViewController(viewModel: MantrListViewModel())
        viewController?.present(mantrList, animated: true)
    }
}
