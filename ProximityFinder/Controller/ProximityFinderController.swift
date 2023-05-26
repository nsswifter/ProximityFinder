//
//  ViewController.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/18/23.
//

import UIKit

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
    
    @IBAction func UpdateLabelValue(_ sender: UISlider) {
        pointsCountLable.text = String(lroundf(sender.value) + 1)
        pointsCount = lroundf(sender.value)
        
        coordinatePlane.removePointViews()
        points.removeAll()
        
        generatePoints()
        calculatePoints()
    }
    
    func setup() {
        slider.setThumbImage(UIImage(named: "thumb".localized), for: .normal)
        pointsCount = lroundf(slider.value)
    }

    func generatePoints() {
        for _ in 0...pointsCount {
            points.append(CGPoint(x: Int.random(in: 0...Int(coordinatePlane.bounds.width)),
                                  y: Int.random(in: 0...Int(coordinatePlane.bounds.height))))
        }
        
        coordinatePlane.drawPoint(from: points, withColor: traitCollection.userInterfaceStyle == .light ?
            .black : .white)
    }
    
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

