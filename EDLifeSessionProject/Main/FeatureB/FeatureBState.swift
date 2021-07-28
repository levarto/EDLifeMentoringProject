//
//  FeatureBState.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import UIKit

struct FeatureBResponse: Codable {
    var storeModel: StoreModel?
    var productInfoModel: ProductInfoModel?
    var purchaseProgressModel: PurchaseProgressModel?
    var purchaseSuccessModel: PurchaseStatusModel?
    var purchaseFailureModel: PurchaseStatusModel?
}

struct FeatureBState: Codable, FeatureState {
    let history: [FeatureBScreenTags]
    let data: FeatureBResponse?

    var stack: [FeatureTagged] {
        return history.map { $0.screenTag }
    }
}

extension FeatureBState {
    static var startStub: Self {
        return .init(
            history: [.store],
            data: .init(
                storeModel: .init(
                    productList: [
                        .init(
                            imageUrl: nil,
                            title: "Apple",
                            description: "Green",
                            price: "$1",
                            authorName: "John Appleseed"
                        )
                    ]
                ),
                productInfoModel: nil,
                purchaseProgressModel: nil,
                purchaseSuccessModel: nil,
                purchaseFailureModel: nil
            )
        )
    }

    static var nextStub: Self {
        return .init(
            history: [.store, .productInfo],
            data: .init(
                storeModel: .init(
                    productList: [
                        .init(
                            imageUrl: nil,
                            title: "Apple",
                            description: "Green",
                            price: "$1",
                            authorName: "John Appleseed"
                        )
                    ]
                ),
                productInfoModel: .init(
                    imageUrl: nil,
                    title: "Apple",
                    description: "Green",
                    price: "$1",
                    author: .init(
                        avatarURL: nil,
                        fullName: "John Appleseed",
                        birthday: Date()
                    )
                ),
                purchaseProgressModel: nil,
                purchaseSuccessModel: nil,
                purchaseFailureModel: nil
            )
        )
    }
}
