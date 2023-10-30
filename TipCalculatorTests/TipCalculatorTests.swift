//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by Denis Efremov on 2023-10-24.
//

import XCTest
import Combine
@testable import TipCalculator

final class TipCalculatorTests: XCTestCase {

    private var sut: CalculatorViewModel!
    private var cancellables: Set<AnyCancellable>!

    private let viewTapSubject = PassthroughSubject<Void, Never>()
    private let logoViewTapSubject = PassthroughSubject<Void, Never>()

    override func setUp() {
        sut = CalculatorViewModel()
        cancellables = Set<AnyCancellable>()
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        cancellables = nil
    }

    func testResultWithoutTipForOnePerson() {
        // given
        let bill: Double = 100.0
        let tip: Tip = .none
        let split: Int = 1
        let input = buildInput(bill: bill, tip: tip, split: split)

        // when
        let output = sut.transform(input: input)

        // then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 100.0)
            XCTAssertEqual(result.totalBill, 100.0)
            XCTAssertEqual(result.totalTip, 0.0)
            
        }.store(in: &cancellables)
    }

    func testResultWithoutTipForTwoPersons() {
        // given
        let bill: Double = 100.0
        let tip: Tip = .none
        let split: Int = 2
        let input = buildInput(bill: bill, tip: tip, split: split)

        // when
        let output = sut.transform(input: input)

        // then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 50.0)
            XCTAssertEqual(result.totalBill, 100.0)
            XCTAssertEqual(result.totalTip, 0.0)

        }.store(in: &cancellables)
    }

    func testResultWithTenPercentTipForTwoPersons() {
        // given
        let bill: Double = 100.0
        let tip: Tip = .tenPercent
        let split: Int = 2
        let input = buildInput(bill: bill, tip: tip, split: split)

        // when
        let output = sut.transform(input: input)

        // then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 55.0)
            XCTAssertEqual(result.totalBill, 110.0)
            XCTAssertEqual(result.totalTip, 10.0)

        }.store(in: &cancellables)
    }

    func testResultWithCustomTipForFourPersons() {
        // given
        let bill: Double = 200.0
        let tip: Tip = .custom(value: 201)
        let split: Int = 4
        let input = buildInput(bill: bill, tip: tip, split: split)

        // when
        let output = sut.transform(input: input)

        // then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 100.25)
            XCTAssertEqual(result.totalBill, 401.0)
            XCTAssertEqual(result.totalTip, 201)

        }.store(in: &cancellables)
    }

    private func buildInput(bill: Double, tip: Tip, split: Int) -> CalculatorViewModel.Input {
        return .init(
            billPublisher: Just(bill).eraseToAnyPublisher(),
            tipPublisher: Just(tip).eraseToAnyPublisher(),
            splitPublisher: Just(split).eraseToAnyPublisher(),
            viewTapPublisher: viewTapSubject.eraseToAnyPublisher(),
            logoViewTapPublisher: logoViewTapSubject.eraseToAnyPublisher()
        )
    }

}
