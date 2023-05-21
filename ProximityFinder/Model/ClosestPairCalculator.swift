//
//  ClosestPairCalculator.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/22/23.
//

import CoreGraphics

/// A utility struct for calculating the closest pair of points in a 2D coordinate system.
struct ClosestPairCalculator {
    
    /// Calculates the Euclidean distance between two points in a 2D coordinate system.
    /// - Parameters:
    ///   - point1: The first point.
    ///   - point2: The second point.
    /// - Returns: The distance between the two points.
    /// - Complexity: O(1)
    func distance(from point1: CGPoint, to point2: CGPoint) -> Double {
        let deltaX = point2.x - point1.x
        let deltay = point2.y - point1.y
        return sqrt(deltaX * deltaX + deltay * deltay)
    }
    
    /// Finds the closest pair of points in a given array of CGPoints.
    /// - Parameter points: An array of CGPoints.
    /// - Returns: An optional ClosestPair object representing the closest pair of points,
    ///   or nil if there are less than two points.
    /// - Complexity: The time complexity of the `closestPair` function depends on the time complexity
    ///   of the `closestPairRecursive` function and the initial sorting operation.
    ///   Assuming the `closestPairRecursive` function has a time complexity of O(n log n),
    ///   where n is the number of points, and the sorting operation has a time complexity of O(n log n),
    ///   the overall time complexity of the `closestPair` function can be approximated as O(n log n).
    func closestPair(_ points: [CGPoint]) -> ClosestPair? {
        guard points.count > 1 else {
            return nil
        }
        
        let sortedPoints = points.sorted { $0.x < $1.x }
        return closestPairRecursive(sortedPoints)
    }
    
    /// Recursively finds the closest pair of points within a given array using a divide-and-conquer algorithm.
    /// - Parameter points: An array of `CGPoint` objects representing the points to search for the closest pair.
    /// - Returns: An optional `ClosestPair` object representing the closest pair of points found, or `nil` if no pair was found.
    private func closestPairRecursive(_ points: [CGPoint]) -> ClosestPair? {
        
        // Base case: if the number of points is 2 or 3, brute force search is performed.
        guard points.count > 3 else {
            // Initialize the minimum distance and closest pair variables.
            var minDist = Double.infinity
            var closestPair: ClosestPair?
            
            // Iterate through each point pair, checking their distances.
            for i in 0..<points.count-1 {
                for j in i+1..<points.count {
                    // Calculate the distance between the current point pair.
                    
                    // Update the minimum distance and closest pair if a smaller distance is found.
                    let dist = distance(from: points[i], to: points[j])
                    if dist < minDist {
                        minDist = dist
                        closestPair = ClosestPair(point1: points[i], point2: points[j], distance: dist)
                    }
                }
            }
            
            return closestPair
        }
        
        // Divide the points into two halves.
        let midIndex = points.count / 2
        let leftPoints = Array(points[0..<midIndex])
        let rightPoints = Array(points[midIndex..<points.count])
        
        // Recursively find the closest pair in each half.
        let closestPairL = closestPairRecursive(leftPoints)
        let closestPairR = closestPairRecursive(rightPoints)
        
        // Initialize the minimum distance and closest pair variables for the combined pairs.
        var minDistLR = Double.infinity
        var closestPairLR: ClosestPair?
        
        // Update the minimum distance and closest pair if a smaller distance is found in the left pair.
        if let pairL = closestPairL, pairL.distance < minDistLR {
            minDistLR = pairL.distance
            closestPairLR = pairL
        }
        
        // Update the minimum distance and closest pair if a smaller distance is found in the right pair.
        if let pairR = closestPairR, pairR.distance < minDistLR {
            minDistLR = pairR.distance
            closestPairLR = pairR
        }
        
        // Calculate the dividing line and collect points within the specified distance from the line.
        let xMid = (points[midIndex - 1].x + points[midIndex].x) / 2
        var splitPoints = [CGPoint]()
        
        for point in points {
            if abs(point.x - xMid) <= minDistLR {
                splitPoints.append(point)
            }
        }
        
        // Find the closest pair among the points within the specified distance from the dividing line.
        let closestPairS = closestPairSplit(splitPoints, minDistLR)
        
        // Update the minimum distance and closest pair if a smaller distance is found in the split pair.
        if let pairS = closestPairS, pairS.distance < minDistLR {
            minDistLR = pairS.distance
            closestPairLR = pairS
        }
        
        return closestPairLR
    }
    
    /// Finds the closest pair of points within a given array, using a divide-and-conquer algorithm.
    /// - Parameters:
    ///   - points: An array of `CGPoint` objects representing the points to search for the closest pair.
    ///   - delta: A `Double` value representing the initial minimum distance between points.
    /// - Returns: An optional `ClosestPair` object representing the closest pair of points found, or `nil` if no pair was found.
    /// - Complexity: O(n log n), The dominant factor in the time complexity of the `closestPairSplit` function is the sorting operation.
    private func closestPairSplit(_ points: [CGPoint], _ delta: Double) -> ClosestPair? {
        
        // Initialize the minimum distance and closest pair variables.
        var minDist = delta
        var closestPair: ClosestPair?
        
        // Sort the points based on their y-coordinate.
        let sortedPoints = points.sorted { $0.y < $1.y }
        
        // Iterate through each point pair, checking their distances.
        for i in 0..<sortedPoints.count-1 {
            for j in i+1..<min(i+8, sortedPoints.count) {
                // Calculate the distance between the current point pair.
                let dist = distance(from: sortedPoints[i], to: sortedPoints[j])
                
                // Update the minimum distance and closest pair if a smaller distance is found.
                if dist < minDist {
                    minDist = dist
                    closestPair = ClosestPair(point1: sortedPoints[i], point2: sortedPoints[j], distance: dist)
                }
            }
        }
        
        return closestPair
    }
}
