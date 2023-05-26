//
//  UIView.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/25/23.
//

import UIKit

extension UIView {
    func drawPoint(from points: [CGPoint], withColor color: UIColor = .black) {
        for point in points {
            let pointView = UIView(frame: CGRect(x: point.x, y: point.y, width: 10, height: 10))
            pointView.center = point
            pointView.layer.cornerRadius = pointView.frame.width / 2
            pointView.backgroundColor = color
            self.addSubview(pointView)
        }
    }
    
    func removePointViews() {
        for subview in subviews {
            if subview.backgroundColor != nil {
                subview.removeFromSuperview()
            }
        }
    }
}
