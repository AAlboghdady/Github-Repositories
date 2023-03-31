//
//  RepositoriesRequest.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 31/03/2023.
//

import Foundation

class RepositoriesRequest: Request {
    var networkService: Service
    var urlRequest: URLRequest
    
    init(networkService: Service, urlRequest: URLRequest) {
        self.urlRequest = urlRequest
        self.networkService = networkService
    }
    
    func checkConnection() -> Bool {
        switch Reachability().connectionStatus() {
        case .unknown, .offline:
            return false
        case .online(_):
            return true
        }
    }
    
    func getRepositories(completion: @escaping (Result<[Repository], Error>) -> Void) {
        if !checkConnection() {
            completion(.failure(NSError(domain: "", code: 100)))
        }
        DispatchQueue.global().async {
            self.networkService.get(request: self) { response in
                switch response {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let data):
                    // parse the json
                    let jsonDecoder = JSONDecoder()
                    do {
                        let repositories = try jsonDecoder.decode([Repository].self, from: data)
                        completion(.success(repositories))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
