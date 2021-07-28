//
//  FeatureModuleView.swift
//  EDLifeSessionProject (iOS)
//
//  Created by Pavel Lavrik on 26.07.2021.
//

import UIKit

protocol FeatureModuleDisplayLogic: AnyObject {}

class FeatureModuleView: UIViewController, FeatureScreenIdentifiable {
    private let logic: FeatureModuleLogic
    private let label: UILabel = .init()
    private let button: UIButton = .init()

    let screenTag: FeatureTagged
    
    init(
        logic: FeatureModuleLogic,
        tag: FeatureTagged
    ) {
        self.logic = logic
        screenTag = tag
        super.init(
            nibName: nil,
            bundle: nil
        )
    }

    override func viewDidLoad() {
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        view.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        label.text = screenTag.rawValue

        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.setTitle("Proceed", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(proceedAction), for: .touchUpInside)
    }

    @objc private func proceedAction(_ sender: UIButton) {
        logic.proceedFeature(path: screenTag.tagValue)
    }
}

extension FeatureModuleView: FeatureModuleDisplayLogic {
    
}
