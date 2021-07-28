//
//  FeatureCModuleFactory.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 28.07.2021.
//

import UIKit

protocol FeatureCModuleFactory {
    func getInitial(coordinator: FeaturesCoordinator) -> UIViewController
    func getModule(tag: FeatureTagged, coordinator: FeaturesCoordinator) -> UIViewController?
}

class FeatureCModuleFactoryImplementation: FeatureCModuleFactory {
    private let assembly: FeatureModuleAssembly = .init()
    func getInitial(coordinator: FeaturesCoordinator) -> UIViewController {
        return assembly.build(
            coordinator: coordinator,
            tag: .init(
                tagValue: .featureC,
                rawValue: FeatureCScreenTags.feed.rawValue
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
