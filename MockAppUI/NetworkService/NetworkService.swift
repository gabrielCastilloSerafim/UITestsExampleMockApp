//
//  NetworkService.swift
//  MockAppUI
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//

import Foundation

class NetworkService {
    
    static var shared = NetworkService()
    
    private init() {}
    
    func performLogin(name: String, password: String, completion: @escaping (Bool) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            if name == "Gabriel", password == "12345678" {
                
                completion(true)
                return
            }
            
            completion(false)
        }
    }
}
