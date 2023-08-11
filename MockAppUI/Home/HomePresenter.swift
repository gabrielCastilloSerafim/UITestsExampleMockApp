//
//  HomePresenter.swift
//  MockAppUI
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomeRouterProtocol?
    
}

// MARK: (View -> Presenter)
extension HomePresenter: HomePresenterProtocol {

    func viewDidLoad() {

    }

    func goToSecondScreen(name: String, password: String) {
        
        guard let view = view else { return }
        
        view.showActivityIndicator()
        
        interactor?.performLogin(name: name, password: password) { success in
            
            view.hideActivityIndicator()
            
            if success {
                self.router?.goToSecondScreen(fromVC: view)
                return
            }
            
            view.loginError()
        }
    }
}

// MARK: (Presenter <- Interactor)
extension HomePresenter: HomeInteractorToPresenterProtocol {
	
}
