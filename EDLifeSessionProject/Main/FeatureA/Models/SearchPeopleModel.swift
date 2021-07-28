//
//  SearchPeopleModel.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation

struct SearchPeopleModel: Codable {
    struct Person: Codable {
        let avatarUrl: String
        let fullName: String
    }

    let list: [Person]
}
