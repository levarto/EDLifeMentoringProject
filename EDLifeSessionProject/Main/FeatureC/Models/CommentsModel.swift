//
//  CommentsModel.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

struct CommentsModel: Codable {
    struct Comment: Codable {
        let authorName: String
        let commentText: String
    }

    let comments: [Comment]
}
