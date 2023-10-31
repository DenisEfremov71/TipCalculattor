//
//  ScreenIdentifier.swift
//  TipCalculator
//
//  Created by Denis Efremov on 2023-10-30.
//

import Foundation

enum ScreenIdentifier {

    enum LogoView: String {
        case logoView
    }

    enum ResultView: String {
        case totalAmountPerPersonValueLabel
        case totalBillValueLabel
        case totalTipValueLabel
    }

    enum BillInputView: String {
        case textField
    }

    enum TipInputView: String {
        case tenPercentButton
        case fifteenPercentButton
        case twentyPercentButton
        case customTipButton
    }

    enum SplitInputView: String {
        case decrementButton
        case incrementButton
        case quantityValueLabel
    }

}
