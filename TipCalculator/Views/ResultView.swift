//
//  ResultView.swift
//  TipCalculator
//
//  Created by Denis Efremov on 2023-10-25.
//

import UIKit

class ResultView: UIView {

    init() {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        backgroundColor = .gray
    }

}