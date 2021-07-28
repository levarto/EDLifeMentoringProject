//
//  Worker.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 21.07.2021.
//

import Foundation

class Worker {
    private func getStartState(for path: UserPath) -> FeatureState {
        switch path {
        case .featureA:
            return FeatureAState.startStub
        case .featureB:
            return FeatureBState.startStub
        case .featureC:
            return FeatureCState.startStub
        }
    }

    private func getUpdatedState(for path: UserPath) -> FeatureState {
        switch path {
        case .featureA:
            return FeatureAState.nextStub
        case .featureB:
            return FeatureBState.nextStub
        case .featureC:
            return FeatureCState.nextStub
        }
    }

    func startFeature(path: UserPath, completion: @escaping (FeatureState) -> Void) {
        let resultState: FeatureState = getStartState(for: path)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(resultState)
        }
    }

    func proceedFeature(path: UserPath, completion: @escaping (FeatureState) -> Void) {
        let resultState: FeatureState = getUpdatedState(for: path)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(resultState)
        }
    }
}
