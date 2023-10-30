//
//  TipCalculatorSnapshotTests.swift
//  TipCalculatorTests
//
//  Created by Denis Efremov on 2023-10-30.
//

import XCTest
import SnapshotTesting
@testable import TipCalculator

final class TipCalculatorSnapshotTests: XCTestCase {

    private var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }

    func testLogoView() {
        // given
        let size = CGSize(width: screenWidth, height: 48)

        // when
        let view = LogoView()

        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
    }

    func testInitialResultView() {
        // given
        let size = CGSize(width: screenWidth, height: 224)

        // when
        let view = ResultView()

        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
    }

    func testBillInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56)

        // when
        let view = BillInputView()

        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
    }

    func testTipInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56+56+16)

        // when
        let view = TipInputView()

        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
    }

    func testSplitInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56)

        // when
        let view = SplitInputView()

        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
    }

}
