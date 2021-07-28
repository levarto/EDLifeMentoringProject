//
//  FeatureModuleLogic.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation

protocol FeatureModuleLogic {
    func startFeature(path: UserPath)
    func proceedFeature(path: UserPath)
}

class FeatureModuleLogicImp: FeatureModuleLogic {
    weak var view: FeatureModuleDisplayLogic?
    private let coordinator: FeaturesCoordinator
    private let worker: Worker

    init(
        coordinator: FeaturesCoordinator,
        worker: Worker
    ) {
        self.coordinator = coordinator
        self.worker = worker
    }

    func startFeature(path: UserPath) {
        worker.startFeature(path: path) { [weak self] state in
            self?.coordinator.handle(state: state)
        }
    }

    func proceedFeature(path: UserPath) {
        worker.proceedFeature(path: path) { [weak self] state in
            self?.coordinator.handle(state: state)
        }
    }
}
