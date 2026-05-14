//
//  NetworkManager.swift
//  TestingLab
//
//  Created by Moaz Osama on 13/05/2026.
//

import Foundation

protocol NetworkManagerProtocol {
 
    func loadUsers( completionHandler: @escaping([User]? , Error?)-> Void)
    
}

class NetworkManager: NetworkManagerProtocol {
    func loadUsers( completionHandler: @escaping ([User]?,  Error?) -> Void) {
        
        guard let url = URL(string: "https://dummyjson.com/users") else {
            completionHandler(nil , NSError())
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data , response , error in
            guard let data = data else {
                completionHandler(nil , NSError())
                           return
                       }
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil , error)
                
            }else{
                let result = try? JSONDecoder().decode(ApiResponse.self, from: data)
                completionHandler(result?.users , nil)
            }
            
        }
        
        task.resume()
    }
    
}
