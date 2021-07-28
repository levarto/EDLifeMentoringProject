//
//  FeatureModuleAssembly.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import UIKit

class FeatureModuleAssembly {
    func build(
        coordinator: FeaturesCoordinator,
        tag: FeatureTagged
    ) -> UIViewController {
        let logic = FeatureModuleLogicImp(
            coordinator: coordinator,
            worker: Worker()
        )
        let view = FeatureModuleView(
            logic: logic,
            tag: tag
        )
        logic.view = view
        return view
    }
}
