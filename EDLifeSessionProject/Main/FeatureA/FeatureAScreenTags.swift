//
//  FeatureAScreenTags.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

enum FeatureAScreenTags: String, Codable {
    case friendsList = "FRIENDS_LIST"
    case friendInfo = "FRIEND_INFO"
    case searchPeople = "SEARCH_PEOPLE"
}

extension FeatureAScreenTags: FeatureScreenIdentifiable {
    var screenTag: FeatureTagged {
        return .init(tagValue: .featureA, rawValue: rawValue)
    }
}
