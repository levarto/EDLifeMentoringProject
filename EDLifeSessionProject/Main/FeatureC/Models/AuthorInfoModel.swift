//
//  AuthorInfoModel.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation

struct AuthorInfoModel: Codable {
    let avatarURL: String?
    let fullName: String
    let birthday: Date
}
