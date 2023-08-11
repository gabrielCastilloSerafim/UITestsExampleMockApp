//
//  HomeInteractor.swift
//  MockAppUI
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//  
//

import Foundation

class HomeInteractor: HomePresenterToInteractorProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorToPresenterProtocol?

    // MARK: Methods
    func performLogin(name: String, password: String, completion: @escaping (Bool) -> Void) {
        
        NetworkService.shared.performLogin(name: name, password: password, completion: completion)
    }
}
