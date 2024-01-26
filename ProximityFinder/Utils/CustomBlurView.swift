//
//  CustomBlurView.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/26/23.
//

import UIKit

@IBDesignable
class CustomBlurView: UIVisualEffectView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.cornerCurve = .continuous
            layer.masksToBounds = true
        }
    }
}
