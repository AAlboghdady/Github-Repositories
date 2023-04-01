//
//  StringExntensions.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 01/04/2023.
//

import Foundation

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz"
        let dateFromString : Date = dateFormatter.date(from: self)!
        return dateFromString
    }
    
    func getCustomDate() -> String {
        let date = self.toDate()
        if Date().months(from: date) > 6 {
            // Thursday, Oct 22, 2020
            return date.dateString
        } else {
            // 4 month ago
            return  date.timeAgoDisplay
        }
    }
}
