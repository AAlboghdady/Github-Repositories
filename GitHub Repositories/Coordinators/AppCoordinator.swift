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
        let repositoriesVM = RepositoriesVM.init()
        // Set the ViewModel to ViewController
        repositoriesVC.viewModel = repositoriesVM
        repositoriesVC.title = "Repositories"
        // Push it.
        navigationController.pushViewController(repositoriesVC, animated: true)
        Constants.window?.rootViewController = navigationController
        Constants.window?.makeKeyAndVisible()
    }
    
//    func goToTeams(league: Competition) {
//        // Instantiate TeamsViewController
//        let teamsVC = UIStoryboard.instantiate(.teams, .teams) as! TeamsViewController
//        // Set the id to the ViewController
//        teamsVC.league = league
//        // Instantiate ViewModel
//        let teamsViewModel = TeamsViewModel.init()
//        // Set the id to the ViewModel
//        teamsViewModel.competitionId = league.id!
//        // Set the ViewModel to ViewController
//        teamsVC.viewModel = teamsViewModel
//        // Push it.
//        navigationController.pushViewController(teamsVC, animated: true)
//    }
}
