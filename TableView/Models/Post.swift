//
//  Post.swift
//  TableView
//
//  Created by Veronika on 18.01.2022.
//
import Foundation
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
