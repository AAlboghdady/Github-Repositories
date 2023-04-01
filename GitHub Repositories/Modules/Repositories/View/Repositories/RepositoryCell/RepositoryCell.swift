//
//  RepositoryCell.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 31/03/2023.
//

import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ownerImageView.layer.cornerRadius = 8
    }
    
    func configure(repository: Repository) {
        // set Repository data
        ownerImageView.loadImage(from: repository.owner?.avatar_url ?? "")
        repositoryNameLabel.text = repository.name
        ownerNameLabel.text = repository.owner?.login
        if let created_at = repository.created_at {
            creationDateLabel.text = repository.created_at?.getCustomDate()
            creationDateLabel.isHidden = false
        } else {
            // hide creationDateLabel if no date returned
            creationDateLabel.isHidden = repository.created_at?.isEmpty ?? true
        }
    }
}
