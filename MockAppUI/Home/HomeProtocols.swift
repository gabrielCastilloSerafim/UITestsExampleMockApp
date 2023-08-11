//
//  HomeProtocols.swift
//  MockAppUI
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//  
//

import UIKit

// MARK: (PRESENTER -> VIEW)
protocol HomeViewProtocol: AnyObject, UIViewController {
    
    // MARK: Properties
    var presenter: HomePresenterProtocol? { get set }

    // MARK: Methods
    func showActivityIndicator()
    func hideActivityIndicator()
    func loginError()
}

// MARK: (PRESENTER -> ROUTER)
protocol HomeRouterProtocol: AnyObject {
	
    // MARK: Methods
    static func createModule() -> UIViewController

    func goToSecondScreen(fromVC: UIViewController)
}

// MARK: (VIEW -> PRESENTER)
protocol HomePresenterProtocol: AnyObject {

    // MARK: Properties
    var view: HomeViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    // MARK: Methods
    func viewDidLoad()
    func goToSecondScreen(name: String, password: String)

}

// MARK: (INTERACTOR -> PRESENTER)
protocol HomeInteractorToPresenterProtocol: AnyObject {

    // MARK: Properties

    // MARK: Methods

}

// MARK: (PRESENTER -> INTERACTOR)
protocol HomePresenterToInteractorProtocol: AnyObject {

    // MARK: Properties
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    
    // MARK: Methods
    func performLogin(name: String, password: String, completion: @escaping (Bool) -> Void)
}
