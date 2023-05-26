//
//  UIView.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/25/23.
//

import UIKit

extension UIView {
    /// Draws points on the view at the specified locations with the given color.
    /// - Parameters:
    ///   - points: An array of CGPoint representing the locations of the points.
    ///   - color: The color of the points. Default is black.
    func drawPoint(from points: [CGPoint], withColor color: UIColor = .black) {
        for point in points {
            let pointView = UIView(frame: CGRect(x: point.x, y: point.y, width: 10, height: 10))
            pointView.center = point
            pointView.layer.cornerRadius = pointView.frame.width / 2
            pointView.backgroundColor = color
            self.addSubview(pointView)
        }
    }
    
    /// Removes all point views from the view.
    func removePointViews() {
        for subview in subviews {
            if subview.backgroundColor != nil {
                subview.removeFromSuperview()
            }
        }
    }
}
