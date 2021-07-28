//
//  Store.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 28.07.2021.
//

import Foundation

class Store<T: FeatureState> {
    static func create() -> Store<T> {
        return Store<T>()
    }

    var stateStore: T?

    func clear() {
        stateStore = nil
    }

    func update(state: FeatureState) {
        guard let storableState = state as? T else {
            assertionFailure("[BPMStore] Wrong state type")
            return
        }
        stateStore = storableState
    }
}

extension Store where T == FeatureAState {
    static let shared = Store<T>()
    static func create() -> Store<T> {
        return shared
    }
}

extension Store where T == FeatureBState {
    static let shared = Store<T>()
    static func create() -> Store<T> {
        return shared
    }
}

extension Store where T == FeatureCState {
    static let shared = Store<T>()
    static func create() -> Store<T> {
        return shared
    }
}
