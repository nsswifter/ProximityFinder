//
//  ViewController.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/18/23.
//

import UIKit

class ProximityFinderController: UIViewController {

    @IBOutlet weak var coordinatePlane: UIView!
    
    @IBOutlet weak var pointsCountLable: UILabel!
    @IBOutlet weak var closestDistanceLabel: UILabel!
    
    let closestPairCalculator = ClosestPairCalculator()
    
    var points: [CGPoint] = []
    var pointsCount = 24

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generatePoints()
        calculatePoints()
    }
    
    @IBAction func UpdateLabelValue(_ sender: UISlider) {
        print(sender.value)
        print(lroundf(sender.value))
        pointsCountLable.text = String(lroundf(sender.value) + 1)
        pointsCount = lroundf(sender.value)
        
        coordinatePlane.removePointViews()
        points.removeAll()
        
        generatePoints()
        calculatePoints()
    }

    func generatePoints() {
        for _ in 0...pointsCount {
            points.append(CGPoint(x: Int.random(in: 0...280), y: Int.random(in: 0...280)))
        }
        
        coordinatePlane.drawPoint(from: points, withColor: traitCollection.userInterfaceStyle == .light ?
            .black : .gray)
    }
    
    func calculatePoints() {
        let closestPair = closestPairCalculator.closestPair(points)
        
        if let closestPair {
            coordinatePlane.drawPoint(from: [closestPair.point1, closestPair.point2], withColor: .red)
            closestDistanceLabel.text = String(format: "%.2f", closestPair.distance)
        }
    }
}

