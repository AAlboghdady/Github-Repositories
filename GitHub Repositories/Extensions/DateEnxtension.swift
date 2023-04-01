//
//  DateEnxtension.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 01/04/2023.
//

import Foundation

extension Date {
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        
        return formatter.string(from: self)
    }
    
    var timeAgoDisplay: String {
//        let calendar = Calendar.current
//        let minuteAgo = calendar.date(byAdding: .minute, value: -1, to: Date())!
//        let hourAgo = calendar.date(byAdding: .hour, value: -1, to: Date())!
//        let dayAgo = calendar.date(byAdding: .day, value: -1, to: Date())!
//        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
//
//        if minuteAgo < self {
//            let diff = Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
//            return "\(diff) sec ago"
//        } else if hourAgo < self {
//            let diff = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
//            return "\(diff) min ago"
//        } else if dayAgo < self {
//            let diff = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
//            return "\(diff) hrs ago"
//        } else if weekAgo < self {
//            let diff = Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
//            return "\(diff) days ago"
//        }
//        let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
//        return "\(diff) weeks ago"
        
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
