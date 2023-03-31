//
//  RepositoriesRequest.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 31/03/2023.
//

import Foundation
import Combine

class RepositoriesRequest: Service {
    
    func checkConnection() -> Bool {
        switch Reachability().connectionStatus() {
        case .unknown, .offline:
            return false
        case .online(_):
            return true
        }
    }
    
    func get<T>(url: URL, model: T.Type) -> AnyPublisher<T, Error> where T : Codable {
        if !checkConnection() {
            return Fail(error: NSError(domain: "No internet connection", code: -100, userInfo: nil)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
                    .map { $0.data }
                    .decode(type: model.self, decoder: JSONDecoder())
                    .eraseToAnyPublisher()
    }
}
