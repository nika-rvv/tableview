//
//  NetworkManager.swift
//  TableView
//
//  Created by Veronika on 18.01.2022.
//

import Foundation

final class NetworkManager {
    private init(){}
    static let shared = NetworkManager()
    func getData(url: URL, completion: @escaping (Result<[Post], Error>) ->()) {
        URLSession(configuration: .default).dataTask(with: url) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            let decoder = JSONDecoder()
            let decoded = try! decoder.decode([Post].self, from: data)
            completion(.success(decoded))
        }.resume()
    
    }
    
}
