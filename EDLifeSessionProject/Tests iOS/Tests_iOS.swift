//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Pavel Lavrik on 19.07.2021.
//

import XCTest

extension FeatureAState {
    static var dummyState: Self {
        return .init()
    }
}

class DummyWorker: FeatureAWorker {
    func start(completion: @escaping (FeatureState) -> Void) {
        completion(.dummyState)
    }
}

class FeatureAManagerTests: XCTestCase {
    private var sut: FeatureAManager!

    override func setUp() {
        super.setUp()
        sut = .init()
    }

    override func tearDown() {

        super.tearDown()
    }

    func testStartFetureA() throws {
        XCTAssertEqual(sut.supportedFeature, .featureA)
    }

    func testSupportedFeatureA() throws {
        XCTAssertEqual(sut.supportedFeature, .featureA)
    }

    func testSupportedFeatureA() throws {
        XCTAssertEqual(sut.supportedFeature, .featureA)
    }

    func testSupportedFeatureA() throws {
        XCTAssertEqual(sut.supportedFeature, .featureA)
    }

    func testSupportedFeatureA() throws {
        XCTAssertEqual(sut.supportedFeature, .featureA)
    }

    func testSupportedFeatureA() throws {
        XCTAssertEqual(sut.supportedFeature, .featureA)
    }

    func testSupportedFeatureA() throws {
        XCTAssertEqual(sut.supportedFeature, .featureA)
    }

    func canHandle(state: BPMState) -> Bool
    func endFlow(with result: String)
    func handle(state: BPMState)
    func set(controller: UINavigationController?)
    func set(coordinator: BPMCoordinator?)
    func startFlow(descriptor: BPMFlowDescriptor)
}
