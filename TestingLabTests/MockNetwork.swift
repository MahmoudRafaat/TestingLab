//
//  MockNetwork.swift
//  TestingLabTests
//
//  Created by Moaz Osama  on 13/05/2026.
//

import Foundation
@testable import TestingLab

class MockNetworkManager: NetworkManagerProtocol {
    var shouldReturnWithError: Bool
    
    let fakeUsers = [
        User(id: 10, username: "moazzz", password: "fsaf", email: "fsafasfsaf"),
        User(id: 20, username: "moazzzzz", password: "456",  email: "asfsfaf")
    ]
    
    init(shouldReturnWithError: Bool) {
        self.shouldReturnWithError = shouldReturnWithError
    }
    
    func loadUsers(completionHandler: @escaping ([User]?, Error?) -> Void) {
        if shouldReturnWithError {
            // Simulate a network failure
            let error = NSError(domain: "NetworkError", code: 404, userInfo: nil)
            completionHandler(nil, error)
        } else {
            // Simulate a successful response with fake data
            completionHandler(fakeUsers, nil)
        }
    }
}
