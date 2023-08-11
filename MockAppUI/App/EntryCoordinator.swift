//
//  EntryCoordinator.swift
//  MockAppUI
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//

import UIKit

class EntryCoordinator {
    
    func start(navigationController: UINavigationController) {
        
        let planetsView = HomeRouter.createModule()
        planetsView.view.backgroundColor = .white
        navigationController.viewControllers = [planetsView]
    }
}
