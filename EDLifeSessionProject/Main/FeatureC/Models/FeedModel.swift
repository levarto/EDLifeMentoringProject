//
//  FeedModel.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation

struct FeedModel: Codable {
    struct ShortPostInfo: Codable {
        let imageUrl: String?
        let title: String
        let shortText: String
        let likesCount: Int
    }

    let feed: [ShortPostInfo]
}
