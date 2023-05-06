//
//  LogoViewerTests.swift
//  LogoViewerTests
//
//  Created by Lilian MAGALHAES on 2023-04-14.
//

import XCTest
@testable import LogoViewer

class LogoViewerTests: XCTestCase {

    func testGetImageShouldPostFailedCallBackIfNoData() {
        // Given
        let logoService = LogoService(
            session: URLSessionFake(data: nil, response: nil, error: nil))

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        logoService.getLogo(domain: "openclassrooms.com") { (success, data) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(data)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetImageShouldPostFailedCallbackIfError() {
        // Given
        let logoService = LogoService(
            session: URLSessionFake(
                data: FakeResponseData.imageData,
                response: FakeResponseData.responseOK,
                error: FakeResponseData.error))

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        logoService.getLogo(domain: "openclassrooms.com") { (success, data) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(data)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetImageShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let logoService = LogoService(
            session: URLSessionFake(
                data: FakeResponseData.imageData,
                response: FakeResponseData.responseKO,
                error: FakeResponseData.error))

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        logoService.getLogo(domain: "openclassrooms.com") { (success, data) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(data)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetImageShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let logoService = LogoService(
            session: URLSessionFake(
                data: FakeResponseData.imageData,
                response: FakeResponseData.responseOK,
                error: nil))

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        logoService.getLogo(domain: "openclassrooms.com") { (success, data) in
            // Then
            XCTAssertTrue(success)
            XCTAssertNotNil(data)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
}
