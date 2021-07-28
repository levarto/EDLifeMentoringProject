//
//  StoreModel.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation

struct StoreModel: Codable {
    struct Product: Codable {
        let imageUrl: String?
        let title: String
        let description: String
        let price: String
        let authorName: String
    }

    let productList: [Product]
}
