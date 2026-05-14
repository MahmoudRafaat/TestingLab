//
//  NetworkManagerTests.swift
//  TestingLabTests
//
//  Created by Moaz Osama  on 13/05/2026.
//

import XCTest
@testable import TestingLab

final class NetworkManagerTests: XCTestCase {
    
    var networkManagerObj: NetworkManager!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    override func setUp() {
        networkManagerObj = NetworkManager()
    }
    func testLoadUsersFromAPI() {
        let exp = expectation(description: "Network Service test")
        
        networkManagerObj.loadUsers { users, error in
            if error != nil {
                XCTFail()
            } else {
                XCTAssertNotNil(users)
                XCTAssertGreaterThan(users?.count ?? 0, 0)
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10)
    }
}
