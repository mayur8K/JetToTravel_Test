//
//  EmployeeManagementUITests.swift
//  EmployeeManagementUITests
//
//  Created by Mayur Kamthe on 23/02/20.
//  Copyright © 2020 Mayur Kamthe. All rights reserved.
//

import XCTest

class EmployeeManagementUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
    }

    func testdeleteEmployee() {
       let employeeTable = app.tables.matching(identifier: "identifier_employeeList").firstMatch
        waitFor(time: 1)
        let cell = employeeTable.cells.firstMatch
       var swipeCount = 0
       while (!cell.isHittable || (cell.frame.minY + cell.frame.height) > employeeTable.frame.maxY ) && swipeCount < 5 {
           employeeTable.swipeUp()
           swipeCount = swipeCount + 1
       }
        cell.swipeLeft()
        waitFor(time: 1)
        app.buttons["Delete"].tap()
        XCTAssert(true)
    }

    func waitFor(time : TimeInterval){
        XCTContext.runActivity(named: "Wait for \(time)") { _ in
            XCUIApplication().children(matching: .button).matching(identifier:"ButtonWhichWillNeverExist").firstMatch.waitForExistence(timeout: time)
        }
    }

    
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
