//
//  CalculatorScreen.swift
//  TipCalculatorUITests
//
//  Created by Denis Efremov on 2023-10-30.
//

import XCTest

class CalculatorScreen {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var totalAmountPerPersonValueLabel: XCUIElement {
        app.staticTexts[ScreenIdentifier.ResultView.totalAmountPerPersonValueLabel.rawValue]
    }

    var totalBillValueLabel: XCUIElement {
        app.staticTexts[ScreenIdentifier.ResultView.totalBillValueLabel.rawValue]
    }

    var totalTipValueLabel: XCUIElement {
        app.staticTexts[ScreenIdentifier.ResultView.totalTipValueLabel.rawValue]
    }
}
