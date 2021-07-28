//
//  ProductInfoModel.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation

struct ProductInfoModel: Codable {
    let imageUrl: String?
    let title: String
    let description: String
    let price: String
    let author: AuthorInfoModel
}
