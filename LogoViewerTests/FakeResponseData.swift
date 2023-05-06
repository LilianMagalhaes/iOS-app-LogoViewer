//
//  FakeResponseData.swift
//  LogoViewerTests
//
//  Created by Lilian MAGALHAES on 2023-04-14.
//

import Foundation

class FakeResponseData {
    // MARK: - Data
    static let imageData = "image".data(using: .utf8)!

    // MARK: - Response
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!


    // MARK: - Error
    class LogoError: Error {}
    static let error = LogoError()
}
