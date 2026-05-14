//
//  TestingLabTests.swift
//  TestingLabTests
//
//  Created by Moaz Osama on 12/05/2026.
//
import XCTest
@testable import TestingLab

final class NetworkManagerLiveTests: XCTestCase {
    
    var mockNetwork: MockNetworkManager!

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    }
    override  func setUp() {
        mockNetwork = MockNetworkManager(shouldReturnWithError: false)

    }

    func testLoadUsersSuccess() {
       
        mockNetwork.loadUsers { users, error in
            // Then
            XCTAssertNil(error, "Error should be nil ")
            XCTAssertNotNil(users, "Users not nill")
            XCTAssertEqual(users?.count, 2, " 2 users")
            XCTAssertEqual(users?.first?.username, "moazzz")
        }
    }
   
    func testLoadUsersFailure() {
       
        mockNetwork.shouldReturnWithError = true
       
        mockNetwork.loadUsers { users, error in
          
            XCTAssertNotNil(error, "Error should not be nil")
            XCTAssertNil(users, "Users nill")
        }
    }
}
