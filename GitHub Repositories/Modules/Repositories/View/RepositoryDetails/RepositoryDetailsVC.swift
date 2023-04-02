//
//  RepositoryDetailsVC.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 02/04/2023.
//

import UIKit

class RepositoryDetailsVC: UIViewController {

    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var repoView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var openIssuesLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var licenceLabel: UILabel!
    
    var repository: Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupViews()
    }

    func setupViews() {
        // set repo name to navigation title
        title = repository?.name
        
        ownerImageView.round()
        
        repoView.round(8)
        
        ownerImageView.loadImage(from: repository?.owner?.avatar_url ?? "")
        ownerNameLabel.text = repository?.owner?.login
        descriptionLabel.text = repository?.description
        languageLabel.text = repository?.language
        openIssuesLabel.text = String(repository?.open_issues ?? 0)
        watchersLabel.text = String(repository?.watchers ?? 0)
        scoreLabel.text = String(repository?.score ?? 0)
        creationDateLabel.text = repository?.created_at?.getCustomDate()
        licenceLabel.text = repository?.license?.name
    }
}
