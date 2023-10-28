//
//  CalculatorViewModel.swift
//  TipCalculator
//
//  Created by Denis Efremov on 2023-10-27.
//

import Foundation
import Combine

class CalculatorViewModel {

    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }

    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }

    private var cancellables = Set<AnyCancellable>()

    func transform(input: Input) -> Output {

        input.tipPublisher.sink { tip in
            print("The tip: \(tip)")
        }.store(in: &cancellables)

        let result = Result(
            amountPerPerson: 500,
            totalBill: 100,
            totalTip: 50
        )

        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }

}
