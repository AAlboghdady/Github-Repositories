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
        ownerImageView.loadImage(from: repository.owner?.avatar_url ?? "")
        repositoryNameLabel.text = repository.name
        ownerNameLabel.text = repository.owner?.login
        if let created_at = repository.created_at {
            setDate(dateString: created_at)
        } else {
            // hide creationDateLabel if no date returned
        }
    }
    
    func setDate(dateString: String) {
        let date = dateString.toDate()
        if Date().months(from: date) > 6 {
            // Thursday, Oct 22, 2020
            creationDateLabel.text = date.dateString
        } else {
            // 4 month ago
            creationDateLabel.text = date.timeAgoDisplay
        }
    }
}
