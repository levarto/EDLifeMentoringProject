//
//  FeatureManager.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import UIKit

typealias FeatureController = UIViewController & FeatureScreenIdentifiable

protocol FeatureManager: AnyObject {
    var supportedPath: UserPath { get }
    func canHandle(state: FeatureState) -> Bool
    func handle(state: FeatureState)
    func set(pathStarter: UserPathStarter?)
    func set(endingDelegate: UserPathEndingDelegate?)
    func set(controller: UINavigationController?)
    func set(coordinator: FeaturesCoordinator?)
    func startFlow(descriptor: FeatureDescriptor)
    func endFlow(with result: UserPathEndResult)
}
