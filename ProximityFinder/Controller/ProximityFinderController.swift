//
//  ViewController.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/18/23.
//

import UIKit

// MARK: - Proximity Finder Controller

/// The view controller responsible for the Proximity Finder functionality.
class ProximityFinderController: UIViewController {

    @IBOutlet weak var coordinatePlane: UIView!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var pointsCountLable: UILabel!
    @IBOutlet weak var closestDistanceLabel: UILabel!
    
    let closestPairCalculator = ClosestPairCalculator()
    
    var points: [CGPoint] = []
    var pointsCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        generatePoints()
        calculatePoints()
    }
    
    /// Updates the label value and recalculates the points.
    /// - Parameter sender: A control for selecting count of points.
    @IBAction func UpdateLabelValue(_ sender: UISlider) {
        pointsCountLable.text = String(lroundf(sender.value) + 1)
        pointsCount = lroundf(sender.value)
        
        coordinatePlane.removePointViews()
        points.removeAll()
        
        generatePoints()
        calculatePoints()
    }
    
    /// Performs initial setup.
    func setup() {
        slider.setThumbImage(UIImage(named: "thumb".localized), for: .normal)
        pointsCount = lroundf(slider.value)
    }

    /// Generates random points and displays them on the coordinate plane.
    func generatePoints() {
        for _ in 0...pointsCount {
            points.append(CGPoint(x: Int.random(in: 0...Int(coordinatePlane.bounds.width)),
                                  y: Int.random(in: 0...Int(coordinatePlane.bounds.height))))
        }
        
        coordinatePlane.drawPoint(from: points, withColor: traitCollection.userInterfaceStyle == .light ?
            .black : .white)
    }
    
    /// Calculates the closest pair of points and updates the coordinate plane.
    func calculatePoints() {
        let closestPair = closestPairCalculator.closestPair(points)
        
        if let closestPair {
            coordinatePlane.drawPoint(from: [closestPair.point1, closestPair.point2], withColor: .red)
            
            var distance = String(format: "accuracy_of_one_decimal".localized, closestPair.distance)
            
            if distance.hasSuffix("whole_number_suffix".localized) {
                distance.removeLast(2)
            }
            
            closestDistanceLabel.text = distance
        }
    }
}

