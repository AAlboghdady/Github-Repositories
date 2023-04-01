//
//  UIViewExtension.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 02/04/2023.
//

import UIKit

extension UIView {
    func round(_ cornerRadius: CGFloat? = nil) {
        layer.masksToBounds = true
        layer.cornerRadius = ((cornerRadius == nil) ? layer.frame.height / 2 : cornerRadius)!
    }
}
