//
//  String.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/24/23.
//

import Foundation

extension String {
    /// Localizes the string using the system's localization settings.
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
