//
//  RepositoriesVM.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 31/03/2023.
//

import Foundation
import Combine

class RepositoriesVM {
    
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    @Published var error: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    private var repositoriesRequest = RepositoriesRequest()
    
    func getRepositories() {
        isLoading = true
        repositoriesRequest.get(url: URL(string: Constants.repositoriesURL)!, model: [Repository].self)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] repositories in
                    self?.isLoading = false
                    self?.repositories = repositories
                }
            )
            .store(in: &cancellables)
    }
    
    func searchInRepositories(text: String) {
        for cancellable in cancellables {
            cancellable.cancel()
            print("canceled")
        }
        cancellables = []
        let url = Constants.repositoriesSearchURL + "?" +
        "q=" + text +
        "&page=1" +
        "&per_page=100"
        isLoading = true
        repositoriesRequest.get(url: URL(string: url)!, model: RepositoriesSearch.self)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] repositories in
                    self?.isLoading = false
                    self?.repositories = repositories.items ?? []
                }
            )
            .store(in: &cancellables)
    }
}
