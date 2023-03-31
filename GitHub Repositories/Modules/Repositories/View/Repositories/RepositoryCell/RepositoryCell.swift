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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(repository: Repository) {
        // set Repository data
        repositoryNameLabel.text = repository.name
        ownerNameLabel.text = repository.owner?.login
        creationDateLabel.text = repository.created_at
        ownerImageView.loadImage(from: repository.owner?.avatar_url ?? "")
    }
}
