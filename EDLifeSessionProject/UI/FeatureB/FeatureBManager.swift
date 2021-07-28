//
//  FeatureBManager.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 28.07.2021.
//

import UIKit

class FeatureBManager: FeatureManager {
    private let store = Store<FeatureBState>.create()
    private let moduleFactory: FeatureBModuleFactory
    private weak var coordinator: FeaturesCoordinator?
    private weak var otherPathStarter: UserPathStarter?
    private weak var endingDelegate: UserPathEndingDelegate?
    private weak var navigationController: UINavigationController?

    init(moduleFactory: FeatureBModuleFactory) {
        self.moduleFactory = moduleFactory
    }

    var supportedPath: UserPath {
        return .featureB
    }

    func canHandle(state: FeatureState) -> Bool {
        return state is FeatureBState
    }

    func handle(state: FeatureState) {
        guard state is FeatureBState else {
            assertionFailure("[FeatureAManager] Wrong state type")
            return
        }
        guard let navigationController = navigationController else {
            assertionFailure("[FeatureAManager] Navigation controller not found")
            return
        }
        guard let coordinator = coordinator else {
            assertionFailure("[FeatureAManager] Coordinator not found")
            return
        }

        store.update(state: state)

        let flowControllers = navigationController.viewControllers
            .compactMap({ return $0 as? FeatureController })
            .filter({ isLinkedToCurrentFlow($0) })

        var modulesToAdd = state.stack
        var lastEqualPoint: FeatureController? = nil

        for (index, value) in state.stack.enumerated() {
            guard index < flowControllers.count,
                flowControllers[index].screenTag == value else {
                break
            }
            lastEqualPoint = flowControllers[index]
            modulesToAdd.removeFirst()
        }

        if let lastEqualModule = lastEqualPoint,
            navigationController.viewControllers.last != lastEqualModule {
            navigationController.popToViewController(lastEqualModule, animated: modulesToAdd.isEmpty)
        } else if lastEqualPoint == nil,
            let firstModule = flowControllers.first,
            let firstModuleIndex = navigationController.viewControllers.firstIndex(of: firstModule) {
            navigationController.popToViewController(navigationController.viewControllers[max(firstModuleIndex-1,0)], animated: modulesToAdd.isEmpty)
        }

        if !modulesToAdd.isEmpty {
            let additionalModules = modulesToAdd.compactMap {
                self.moduleFactory.getModule(tag: $0, coordinator: coordinator)
            }
            if additionalModules.count > 1 {
                navigationController.viewControllers = navigationController.viewControllers + additionalModules
            } else if let firstController = additionalModules.first {
                navigationController.pushViewController(firstController, animated: true)
            }
        }
    }

    private func isLinkedToCurrentFlow(_ controller: FeatureController) -> Bool {
        return supportedPath == controller.screenTag.tagValue
    }

    func set(pathStarter: UserPathStarter?) {
        otherPathStarter = pathStarter
    }

    func set(endingDelegate: UserPathEndingDelegate?) {
        self.endingDelegate = endingDelegate
    }

    func set(controller: UINavigationController?) {
        self.navigationController = controller
    }

    func set(coordinator: FeaturesCoordinator?) {
        self.coordinator = coordinator
    }

    func startFlow(descriptor: FeatureDescriptor) {
        guard let coordinator = coordinator else {
            assertionFailure("[FeatureAManager] Coordinator not found")
            return
        }
        let initialController = moduleFactory.getInitial(coordinator: coordinator)
        endingDelegate = descriptor.initiator
        navigationController?.pushViewController(initialController, animated: true)
    }

    func endFlow(with result: UserPathEndResult) {
        store.clear()
        dropFlowControllers()
    }

    private func dropFlowControllers() {
        guard let navigationController = navigationController else {
            assertionFailure("[FeatureAManager] Controller not found")
            return
        }
        let featureControllers = navigationController.viewControllers
            .compactMap({ return $0 as? FeatureController })
            .filter({ isLinkedToCurrentFlow($0) })
        if let firstModule = featureControllers.first,
        let firstModuleIndex = navigationController.viewControllers.firstIndex(of: firstModule) {
            navigationController.popToViewController(
                navigationController.viewControllers[max(firstModuleIndex-1,0)],
                animated: true
            )
        }
    }
}
