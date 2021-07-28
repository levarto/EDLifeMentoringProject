//
//  FeatureBScreenTags.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

enum FeatureBScreenTags: String, Codable {
    case store = "STORE"
    case productInfo = "PRODUCT_INFO"
    case purchaseProgress = "PURCHASE_PROGRESS"
    case purchaseSuccess = "PURCHASE_SUCCESS"
    case purchaseFailure = "PURCHASE_FAILURE"
}

extension FeatureBScreenTags: FeatureScreenIdentifiable {
    var screenTag: FeatureTagged {
        return .init(tagValue: .featureB, rawValue: rawValue)
    }
}
