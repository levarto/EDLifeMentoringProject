//
//  FeatureCState.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

struct FeatureCResponse: Codable {
    var feedModel: FeedModel?
    var postDetailModel: PostDetailModel?
    var authorInfoModel: AuthorInfoModel?
    var commentsModel: CommentsModel?
}

struct FeatureCState: Codable, FeatureState {
    let history: [FeatureCScreenTags]
    let data: FeatureCResponse?

    var stack: [FeatureTagged] {
        return history.map { $0.screenTag }
    }
}

extension FeatureCState {
    static var startStub: Self {
        return .init(
            history: [.feed],
            data: .init(
                feedModel: .init(
                    feed: [
                        .init(
                            imageUrl: nil,
                            title: "Garden news",
                            shortText: "Great big apple harvest",
                            likesCount: 25
                        )
                    ]
                ),
                postDetailModel: nil,
                authorInfoModel: nil,
                commentsModel: nil
            )
        )
    }

    static var nextStub: Self {
        return .init(
            history: [.feed, .postDetail],
            data: .init(
                feedModel: .init(
                    feed: [
                        .init(
                            imageUrl: nil,
                            title: "Garden news",
                            shortText: "Great big apple harvest",
                            likesCount: 25
                        )
                    ]
                ),
                postDetailModel: .init(
                    imageUrl: nil,
                    title: "Garden news",
                    text: "‘The Big Apple’ festival staged every year in the parish of Much Marcle in Herefordshire is well known to British visitors to the Fruit Forum web-site, but not so familiar to fruit lovers on the Continent and elsewhere. Below we print an account of this year’s festival at Much Marcle, as seen through the eyes of a Belgian visitor, Jean Pierre Billen.",
                    likesCount: 25
                ),
                authorInfoModel: nil,
                commentsModel: nil
            )
        )
    }
}
