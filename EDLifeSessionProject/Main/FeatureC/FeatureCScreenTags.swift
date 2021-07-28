//
//  FeatureCScreenTags.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

enum FeatureCScreenTags: String, Codable {
    case feed = "FEED"
    case postDetail = "POST_DETAIL"
    case authorInfo = "AUTHOR_INFO"
    case comments = "COMMENTS"
}

extension FeatureCScreenTags: FeatureScreenIdentifiable {
    var screenTag: FeatureTagged {
        return .init(tagValue: .featureC, rawValue: rawValue)
    }
}
