//
//  MockReachability.swift
//  GitHub RepositoriesTests
//
//  Created by Abdurrahman Alboghdady on 01/04/2023.
//

import Foundation
@testable import GitHub_Repositories
import SystemConfiguration

class MockReachability: ReachabilityProtocol {
    private let status: ReachabilityStatus
    
    init(status: ReachabilityStatus) {
        self.status = status
    }
    
    func connectionStatus() -> ReachabilityStatus {
        return status
    }
}
