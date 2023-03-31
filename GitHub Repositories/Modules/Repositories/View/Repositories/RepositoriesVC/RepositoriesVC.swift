//
//  RepositoriesVC.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 31/03/2023.
//

import UIKit
import Combine

class RepositoriesVC: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: RepositoriesVM!
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        viewModel.getRepositories()
    }
    
    func setupViews() {
        setupTableView()
    }
    
    func setupSearchTextField() {
//        searchTextField.delegate = self
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Cells.RepositoryCell.rawValue, bundle: nil), forCellReuseIdentifier: Cells.RepositoryCell.rawValue)
        
        viewModel.$repositories
                    .receive(on: DispatchQueue.main)
                    .sink { [weak self] _ in
                        self?.tableView.reloadData()
                    }
                    .store(in: &cancellables)
    }
}

extension RepositoriesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension RepositoriesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.RepositoryCell.rawValue, for: indexPath) as! RepositoryCell
        cell.configure(repository: viewModel.repositories[indexPath.row])
        return cell
    }
}
