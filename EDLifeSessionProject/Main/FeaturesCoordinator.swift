//
//  FeaturesCoordinator.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation
import UIKit

protocol FeaturesCoordinator: AnyObject {
    func endFlow(_ flow: UserPath, with result: UserPathEndResult)
    func handle(state: FeatureState)
}

class FeaturesCoordinatorImplementation: NSObject, UserPathStarter, FeaturesCoordinator {
    private weak var navigationController: UINavigationController?
    private let featureManagers: [FeatureManager]

    init(
        viewController: UINavigationController?,
        featureManagers: [FeatureManager]
    ) {
        navigationController = viewController
        self.featureManagers = featureManagers
        super.init()
        featureManagers.forEach({
            $0.set(pathStarter: self)
            $0.set(coordinator: self)
            $0.set(controller: viewController)
        })
    }

    func handle(state: FeatureState) {
        if let handler = featureManagers.first(where: { $0.canHandle(state: state) }) {
            handler.handle(state: state)
        } else {
            assertionFailure("[FeaturesCoordinatorImplementation] There's no handler for this state type")
        }
    }

    func startflow(descriptor: FeatureDescriptor) {
        featureManagers
            .first(where: { $0.supportedPath == descriptor.path })?
            .startFlow(descriptor: descriptor)
    }

    func endFlow(_ path: UserPath, with result: UserPathEndResult) {
        if let handler = featureManagers.first(where: { $0.supportedPath == path }) {
            handler.endFlow(with: result)
        }
    }
}
