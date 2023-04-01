//
//  AppCoordinator.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 31/03/2023.
//

import UIKit

class AppCoordinator: Coordinator {
    
    static let shared = AppCoordinator(navigationController: UINavigationController())
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // launch leagues view controller
        goToRepositories()
    }
    
    func goToRepositories() {
        // Instantiate RepositoriesVC
        let repositoriesVC = RepositoriesVC()
        // Instantiate ViewModel
        let repositoriesVM = RepositoriesVM(repositoriesRequest: RepositoriesRequest())
        // Set the ViewModel to ViewController
        repositoriesVC.viewModel = repositoriesVM
        repositoriesVC.title = "Repositories"
        // Push it.
        navigationController.pushViewController(repositoriesVC, animated: true)
        Constants.window?.rootViewController = navigationController
        Constants.window?.makeKeyAndVisible()
    }
    
    func goToRepositoryDetails(repository: Repository) {
        // Instantiate RepositoryDetailsVC
        let repositoryDetailsVC = RepositoryDetailsVC()
        // Set the id to the ViewController
        repositoryDetailsVC.repository = repository
        // Push it.
        navigationController.pushViewController(repositoryDetailsVC, animated: true)
    }
}
