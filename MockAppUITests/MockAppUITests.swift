//
//  MockAppUITests.swift
//  MockAppUITests
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//

import XCTest

final class MockAppUITests: XCTestCase {
    
    let testsQueue = DispatchQueue(label: Bundle.main.bundleIdentifier ?? "testsQueue")

    override func setUpWithError() throws {
        
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
    }

    override func tearDownWithError() throws {
        
    }

    func testLoginFlowSuccess() throws {
        
        //MARK: Lauch application
        let app = XCUIApplication()
        app.launch()
        
        //MARK: Fill Up login textField
        let loginTextField = app.textFields["Login"]
        XCTAssertTrue(loginTextField.exists, UITestErrors.couldNotFindUIElement.rawValue)
        
        loginTextField.tap()
        loginTextField.typeText("Gabriel")
        
        //MARK: Fill Up password textFields
        let passWordTextField = app.secureTextFields["password"]
        XCTAssertTrue(passWordTextField.exists, UITestErrors.couldNotFindUIElement.rawValue)
        
        passWordTextField.tap()
        passWordTextField.typeText("12345678")
        
        // Hide keyborad
        passWordTextField.typeText("\n")
        
        //MARK: Press login button
        let loginButton = app/*@START_MENU_TOKEN@*/.buttons["Log In"].staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        XCTAssertTrue(loginButton.exists, UITestErrors.couldNotFindUIElement.rawValue)
        
        loginButton.tap()
        
        //MARK: Wait for login action response with a timeOut
        // Create expectation to be waited
        let myExpectation = XCTestExpectation(description: "Get getMockData expectation")
        
        // Enable expectation for needed time
        testsQueue.asyncAfter(deadline: .now() + 2.1) {
            
            myExpectation.fulfill()
        }
        
        // Set wait for expectation
        wait(for: [myExpectation])
        
        //MARK: Check if login succeeded
        let loginSuccessLabel = app.staticTexts["Login Success!"]
        XCTAssertTrue(loginSuccessLabel.exists, UITestErrors.networkFailedOrTimeOut.rawValue)
    }
    
    func testLoginFlowFail() throws {
        
        //MARK: Lauch application
        let app = XCUIApplication()
        app.launch()
        
        //MARK: Fill Up login textField
        let loginTextField = app.textFields["Login"]
        XCTAssertTrue(loginTextField.exists, UITestErrors.couldNotFindUIElement.rawValue)
        
        loginTextField.tap()
        loginTextField.typeText("Matheus")
        
        //MARK: Fill Up password textFields
        let passWordTextField = app.secureTextFields["password"]
        XCTAssertTrue(passWordTextField.exists, UITestErrors.couldNotFindUIElement.rawValue)
        
        passWordTextField.tap()
        passWordTextField.typeText("12345678")
        
        // Hide keyborad
        passWordTextField.typeText("\n")
        
        //MARK: Press login button
        let loginButton = app/*@START_MENU_TOKEN@*/.buttons["Log In"].staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        XCTAssertTrue(loginButton.exists, UITestErrors.couldNotFindUIElement.rawValue)
        
        loginButton.tap()
        
        //MARK: Wait for login action response with a timeOut
        // Create expectation to be waited
        let myExpectation = XCTestExpectation(description: "Get getMockData expectation")
        
        // Enable expectation for needed time
        testsQueue.asyncAfter(deadline: .now() + 2.1) {
            
            myExpectation.fulfill()
        }
        
        // Set wait for expectation
        wait(for: [myExpectation])
        
        //MARK: Check if login failed
        let loginSuccessLabel = app.staticTexts["Login Success!"]
        XCTAssertFalse(loginSuccessLabel.exists, UITestErrors.networkFailedOrTimeOut.rawValue)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    enum UITestErrors: String {
        
        case couldNotFindUIElement = "Could not find the UIElement, please check property name or title"
        case networkFailedOrTimeOut = "The network call failed to get a response or hit timeOut"
    }
}
