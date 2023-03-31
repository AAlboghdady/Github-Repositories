//
//  UIImageViewExtension.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 31/03/2023.
//

import UIKit

extension UIImageView {
    func loadImage(from url: String, withPlaceHolder: UIImage? = nil) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.image = withPlaceHolder
                }
                return
            }
            guard let data = data,
                  let downloadedImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = downloadedImage
            }
        }).resume()
    }
}
