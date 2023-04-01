//
//  File.swift
//  GitHub RepositoriesTests
//
//  Created by Abdurrahman Alboghdady on 01/04/2023.
//

import Foundation
import Combine
@testable import GitHub_Repositories

class MockRepositoriesRequest: Service {
    var shouldFail = false
    var isSearching = false
    
    func get<T: Codable>(url: URL, model: T.Type) -> AnyPublisher<T, Error> {
        if shouldFail {
            return Fail(error: NSError(domain: "Error", code: 0, userInfo: nil)).eraseToAnyPublisher()
        }
        var repository = Repository()
        repository.name = "Repository name"
        var owner = Owner()
        owner.login = "user name"
        repository.owner = owner
        repository.created_at = "2015-05-07T15:47:47Z"
        let repositories = [repository]
        if isSearching {
            var repositoriesSearch = RepositoriesSearch()
            repositoriesSearch.items = repositories
            return Just(repositoriesSearch as! T)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Just(repositories as! T)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
