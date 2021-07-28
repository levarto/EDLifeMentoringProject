//
//  FeatureAState.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

struct FeatureAResponse: Codable {
    var friendsListModel: FriendsListModel?
    var friendInfoModel: FriendInfoModel?
    var searchPeopleModel: SearchPeopleModel?
}

struct FeatureAState: Codable, FeatureState {
    let history: [FeatureAScreenTags]
    let data: FeatureAResponse?

    var stack: [FeatureTagged] {
        return history.map { $0.screenTag }
    }
}

extension FeatureAState {
    static var startStub: Self {
        return .init(
            history: [.friendsList],
            data: .init(
                friendsListModel: .init(
                    friends: [
                        .init(
                            avatarUrl: "",
                            fullName: "John Appleseed",
                            birthday: .init()
                        )
                    ]
                ),
                friendInfoModel: nil,
                searchPeopleModel: nil
            )
        )
    }

    static var nextStub: Self {
        return .init(
            history: [.friendsList, .friendInfo],
            data: .init(
                friendsListModel: .init(
                    friends: [
                        .init(
                            avatarUrl: "",
                            fullName: "John Appleseed",
                            birthday: .init()
                        )
                    ]
                ),
                friendInfoModel: nil,
                searchPeopleModel: nil
            )
        )
    }
}
