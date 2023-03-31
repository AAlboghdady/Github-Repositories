//
//  Service.swift
//  GitHub Repositories
//
//  Created by Abdurrahman Alboghdady on 31/03/2023.
//

import Foundation
import Combine

/// An abstract service type that can have multiple implementation for example - a NetworkService that gets a resource from the Network or a DiskService that gets a resource from Disk
protocol Service {
    func get<T: Codable>(url: URL, model: T.Type) -> AnyPublisher<T, Error>
}
