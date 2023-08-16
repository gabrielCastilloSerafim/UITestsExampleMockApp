//
//  MockAppUITests.swift
//  MockAppUITests
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//

import XCTest

final class MockAppUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
    }

    override func tearDownWithError() throws {
        
    }
    
    func testLoginFlowSuccess() throws {
        
        // Lauch application
        let app = XCUIApplication()
        app.launch()
        
        // Find user name text field and write on it
        let userNameTextFields = app
            .descendants(matching: .textField)
            .matching(identifier: "userNameTextField")
            .element
        
        XCTAssertTrue(userNameTextFields.exists, "Could not find the UIElement, please check identifier")
        
        userNameTextFields.tap()
        userNameTextFields.typeText("Gabriel")
        
        // Find password text field and write on it
        let passwordTextField = app
            .descendants(matching: .secureTextField)
            .matching(identifier: "passwordTextField")
            .element
        XCTAssertTrue(passwordTextField.exists, "Could not find the UIElement, please check identifier")
        
        passwordTextField.tap()
        passwordTextField.typeText("12345678")
        
        // Hide keyborad
        passwordTextField.typeText("\n")
        
        // Find and press login button
        let loginButton = app
            .descendants(matching: .button)
            .matching(identifier: "homeButton")
            .element
        
        XCTAssertTrue(loginButton.exists, "Could not find the UIElement, please check identifier")
        
        loginButton.tap()
        
        // Find secondScreenLabel label and wait for its existence
        let secondScreenLabel = app
            .descendants(matching: .staticText)
            .matching(identifier: "secondScreenLabel")
            .element
        
        let expectation = expectation(
            for: NSPredicate(format: "exists == true"),
            evaluatedWith: secondScreenLabel,
            handler: .none
        )

        let result = XCTWaiter.wait(for: [expectation], timeout: 10.0)
        
        // After result expectation is fulfilled assert result is completed
        // otherwise expectation timed out and login failed
        XCTAssertEqual(result, .completed, "Login failed")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
}
