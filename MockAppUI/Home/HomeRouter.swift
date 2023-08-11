//
//  HomeRouter.swift
//  MockAppUI
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//  
//

import UIKit

class HomeRouter: HomeRouterProtocol {

    // MARK: Builder
    static func createModule() -> UIViewController {

        let view: HomeViewProtocol = HomeView()
        let presenter: HomePresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomeRouterProtocol = HomeRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
            
        return view
    }

    // MARK: Methods
    func goToSecondScreen(fromVC: UIViewController) {
        
        let secondVC = SecondRouter.createModule()
        
        fromVC.navigationController?.pushViewController(secondVC, animated: true)
    }
}
