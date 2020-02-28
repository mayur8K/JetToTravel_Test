//
//  EmployeeManagementTests.swift
//  EmployeeManagementTests
//
//  Created by Mayur Kamthe on 23/02/20.
//  Copyright © 2020 Mayur Kamthe. All rights reserved.
//

import XCTest
@testable import EmployeeManagement

class EmployeeManagementTests: XCTestCase {
    
    var apiObject:EmployeeApiService?
    override func setUp() {
        apiObject = EmployeeApiService()
    }

    override func tearDown() {
    }

    func testServerResponse() {
        let expectation = self.expectation(description: "getDataForEmployees")
        apiObject?.getDataForEmployees(urlString: EmployeeApiService.url) { (results, error) in
            expectation.fulfill()
            XCTAssertFalse(results.data!.count > 0, "Data not populated for employess")
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
