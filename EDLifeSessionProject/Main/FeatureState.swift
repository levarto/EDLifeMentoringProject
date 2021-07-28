//
//  FeatureState.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation

enum UserPath {
    case featureA
    case featureB
    case featureC
}

enum UserPathEndResult {
    case success
    case cancel
    case error
}

protocol FeatureState {
    var stack: [FeatureTagged] { get }
}

protocol UserPathEndingDelegate: AnyObject {
    func didFinishPath(with result: UserPathEndResult)
}

protocol UserPathStarter: AnyObject {
    func startflow(descriptor: FeatureDescriptor)
}

struct FeatureDescriptor {
    let path: UserPath
    let initializationData: Any?
    let initiator: UserPathEndingDelegate?
}
