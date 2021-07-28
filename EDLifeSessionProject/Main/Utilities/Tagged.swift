//
//  Tagged.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

typealias FeatureTagged = Tagged<UserPath, String>

protocol FeatureScreenIdentifiable {
    var screenTag: FeatureTagged { get }
}

struct Tagged<Tag, RawValue> {
    var rawValue: RawValue
    var tagValue: Tag

    init(tagValue: Tag, rawValue: RawValue) {
        self.rawValue = rawValue
        self.tagValue = tagValue
    }
}

extension Tagged: Comparable where RawValue: Comparable, Tag: Equatable {
    static func < (lhs: Tagged, rhs: Tagged) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension Tagged: Equatable where RawValue: Equatable, Tag: Equatable {
    static func == (lhs: Tagged, rhs: Tagged) -> Bool {
        return lhs.rawValue == rhs.rawValue && lhs.tagValue == rhs.tagValue
    }
}

extension Tagged: CustomStringConvertible {
    var description: String {
        return String(describing: rawValue)
    }
}
