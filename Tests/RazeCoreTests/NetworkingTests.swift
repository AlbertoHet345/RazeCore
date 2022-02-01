//
//  NetworkingTests.swift
//  RazeCoreTests
//
//  Created by Alberto Garcia Paul on 01/02/22.
//

import XCTest
import RazeCore

final class NetworkingTests: XCTestCase {
    func testLoadDataCall() {
        let manager = RazeCore.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        guard let url = URL(string: "https://raywenderlich.com") else {
            return XCTFail("Could not create URL properly")
        }
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData, "Response data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
