//
//  TopAlbumsRequestManagerUnitTests.swift
//  AppleMusicTests
//
//  Created by Luke Martin-Resnick on 8/21/21.
//

import XCTest
@testable import AppleMusic

class TopAlbumsRequestManagerUnitTests: XCTestCase {

    /// - Description: Tests  to make sure URL and body of request manager is correct
    func testInit() throws {
        let requestManager = TopAlbumsRequestManager(ResultAmount.ten)
        // Test Request Manager URL
        XCTAssertEqual(requestManager.urlRequest.url?.scheme, "https")
        XCTAssertEqual(requestManager.urlRequest.url?.host, "rss.itunes.apple.com")
        XCTAssertEqual(requestManager.urlRequest.url?.path, "/api/v1/us/apple-music/top-albums/all/10/explicit.json")
    }
    
    /// - Description: Tests to make sure decodable is parsing correctly
    func testDecodableNoError() throws {
        let testJSON =
            "{\"data\":{\"token\":\"0069018aece8c54471782e10e1880722952IADGS/rduTJIhh/drzFkET4kAZ4TswtIa/e4veqQszF4luPWRZ1ivaMnIgCjGrlC+wMDYQQAAQCLwAFhAgCLwAFhAwCLwAFhBACLwAFh\"},\"error\":null,\"success\":true}"
            .data(using: .utf8)!
        let decoded = try TopAlbumsRequestManager(ResultAmount.ten).decodeResponse(data: testJSON)
        
        // Success
//        XCTAssertEqual(decoded.feed, true)
//
//        // Data
//        XCTAssertEqual(decoded.data.token, "0069018aece8c54471782e10e1880722952IADGS/rduTJIhh/drzFkET4kAZ4TswtIa/e4veqQszF4luPWRZ1ivaMnIgCjGrlC+wMDYQQAAQCLwAFhAgCLwAFhAwCLwAFhBACLwAFh")
//
//        // ErrorModel
//        XCTAssertEqual(decoded.error.message, "")
//        XCTAssertEqual(decoded.error.status, "")
    }
    
    /// - Description: Tests to make sure decodable is parsing correctly when there is an error
//    func testDecodableWithErrorModel() throws {
//        let testJSON = "{\"data\":null,\"error\":{\"message\":\"1 or more parms are missing.\",\"status\":\"INVALID_ARGUMENT\"},\"success\":false}".data(using: .utf8)!
//        let decoded = try AgoraTokenRequestManager("hi").decodeResponse(data: testJSON)
//
//        // Success
//        XCTAssertEqual(decoded.success, false)
//
//        // Data
//        XCTAssertEqual(decoded.data.token, "")
//
//        // ErrorModel
//        XCTAssertEqual(decoded.error.message, "1 or more parms are missing.")
//        XCTAssertEqual(decoded.error.status, "INVALID_ARGUMENT")
//    }
}
