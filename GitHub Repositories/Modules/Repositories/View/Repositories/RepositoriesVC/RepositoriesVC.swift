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
        setupSearchTextField()
        setupTableView()
        bindRepositoriesToTableView()
    }
    
    func setupSearchTextField() {
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Cells.RepositoryCell.rawValue, bundle: nil), forCellReuseIdentifier: Cells.RepositoryCell.rawValue)
    }
    
    func bindRepositoriesToTableView() {
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

extension RepositoriesVC {
    @objc func textFieldDidChange(_ textField: UITextField) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchRepositories), object: nil)
        perform(#selector(searchRepositories), with: nil, afterDelay: 0.5)
    }
    
    @objc func searchRepositories() {
        if searchTextField.text!.isEmpty {
            // if the search text is empty then it will load all repositories
            viewModel.getRepositories()
        } else if searchTextField.text!.count >= 2 {
            // add validation to search after the second Character is types
            let text = searchTextField.text!.filter { $0 != Character(" ") }
            print(text)
            viewModel.searchInRepositories(text: text)
        }
    }
}
