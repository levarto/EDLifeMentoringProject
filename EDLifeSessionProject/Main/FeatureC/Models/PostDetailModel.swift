//
//  PostDetailModel.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation

struct PostDetailModel: Codable {
    let imageUrl: String?
    let title: String
    let text: String
    let likesCount: Int
}
