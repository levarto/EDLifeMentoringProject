//
//  FeatureAModuleFactory.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import UIKit

protocol FeatureAModuleFactory {
    func getInitial(coordinator: FeaturesCoordinator) -> UIViewController
    func getModule(tag: FeatureTagged, coordinator: FeaturesCoordinator) -> UIViewController?
}

class FeatureAModuleFactoryImplementation: FeatureAModuleFactory {
    private let assembly: FeatureModuleAssembly = .init()
    func getInitial(coordinator: FeaturesCoordinator) -> UIViewController {
        return assembly.build(
            coordinator: coordinator,
            tag: .init(
                tagValue: .featureA,
                rawValue: FeatureAScreenTags.friendsList.rawValue
            )
        )
    }

    func getModule(tag: FeatureTagged, coordinator: FeaturesCoordinator) -> UIViewController? {
        return assembly.build(
            coordinator: coordinator,
            tag: tag
        )
    }
}
