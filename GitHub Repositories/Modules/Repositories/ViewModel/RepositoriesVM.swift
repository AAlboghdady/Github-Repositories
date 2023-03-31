//
//  RepositoriesVM.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 31/03/2023.
//

import Foundation
import Combine

class RepositoriesVM{
    
    @Published var repositories: [Repository] = []
    @Published var error: String = ""

    func getRepositories() {
        let request = URLRequest(url: URL(string: Constants.repositoriesURL)!)
        let repositoriesRequest = RepositoriesRequest(networkService: NetworkService(), urlRequest: request)
        repositoriesRequest.getRepositories { [weak self] response in
            switch response {
            case .failure(let error):
                self?.error = error.localizedDescription
            case .success(let repositories):
                self?.repositories = repositories
            }
        }
    }
}
