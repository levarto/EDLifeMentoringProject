//
//  FeatureBModuleFactory.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 28.07.2021.
//

import UIKit

protocol FeatureBModuleFactory {
    func getInitial(coordinator: FeaturesCoordinator) -> UIViewController
    func getModule(tag: FeatureTagged, coordinator: FeaturesCoordinator) -> UIViewController?
}

class FeatureBModuleFactoryImplementation: FeatureBModuleFactory {
    private let assembly: FeatureModuleAssembly = .init()
    func getInitial(coordinator: FeaturesCoordinator) -> UIViewController {
        return assembly.build(
            coordinator: coordinator,
            tag: .init(
                tagValue: .featureB,
                rawValue: FeatureBScreenTags.store.rawValue
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
