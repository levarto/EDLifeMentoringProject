//
//  AppDelegate.swift
//  EDLifeSessionProject
//
//  Created by Pavel Lavrik on 28.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        let initialViewController = UINavigationController()

        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()

        let coordinator = FeaturesCoordinatorImplementation(
            viewController: initialViewController,
            featureManagers: [
                FeatureAManager(moduleFactory: FeatureAModuleFactoryImplementation()),
                FeatureBManager(moduleFactory: FeatureBModuleFactoryImplementation()),
                FeatureCManager(moduleFactory: FeatureCModuleFactoryImplementation())
            ]
        )

        coordinator.startflow(
            descriptor: .init(
                path: .featureC,
                initializationData: nil,
                initiator: nil
            )
        )

        return true
    }
}

