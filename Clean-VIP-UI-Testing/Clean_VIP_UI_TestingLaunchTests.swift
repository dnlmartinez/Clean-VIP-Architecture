//
//  Clean_VIP_UI_TestingLaunchTests.swift
//  Clean-VIP-UI-Testing
//
//  Created by daniel martinez gonzalez on 6/4/22.
//  Copyright © 2022 Zafar. All rights reserved.
//

import XCTest

class Clean_VIP_UI_TestingLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
