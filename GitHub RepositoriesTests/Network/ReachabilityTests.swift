//
//  ReachabilityTests.swift
//  GitHub RepositoriesTests
//
//  Created by Abdurrahman Alboghdady on 02/04/2023.
//

import XCTest
@testable import GitHub_Repositories

final class ReachabilityTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testConnectionStatusWhenOffline() {
        switch MockReachability(status: .offline).connectionStatus() {
        case .offline:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testConnectionStatusWhenUnknown() {
        switch MockReachability(status: .unknown).connectionStatus() {
        case .unknown:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testConnectionStatusWhenWiFi() {
        switch MockReachability(status: .online(.wiFi)).connectionStatus() {
        case .online(.wiFi):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testConnectionStatusWhenWWAN() {
        switch MockReachability(status: .online(.wwan)).connectionStatus() {
        case .online(.wwan):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }
}
