//
//  FeatureProcessingWorker.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import Foundation

protocol FeatureProcessingWorker {
    func startProcessing()
    func set(delegate: FeatureProcessingWorkerDelegate)
}

protocol FeatureProcessingWorkerDelegate: AnyObject {
    func didEndProcessing()
}
