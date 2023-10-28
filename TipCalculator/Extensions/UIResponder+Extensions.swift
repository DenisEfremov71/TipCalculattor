//
//  UIResponder+Extensions.swift
//  TipCalculator
//
//  Created by Denis Efremov on 2023-10-28.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        next as? UIViewController ?? next?.parentViewController
    }
}
