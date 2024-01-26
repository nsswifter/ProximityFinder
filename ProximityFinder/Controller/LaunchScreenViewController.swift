//
//  LaunchScreenViewController.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/23/23.
//

import UIKit
import Lottie

// MARK: - Launch Screen View Controller

/// The View Controller responsible for the launch screen.
class LaunchScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLottieView()
    }
}

// MARK: - Methods

// Private
private extension LaunchScreenViewController {
    /// Shows the Lottie animation view on the launch screen.
    func showLottieView() {
        let animationView = LottieAnimationView(name: traitCollection.userInterfaceStyle == .light ?
                                                "LaunchScreen-Light" : "LaunchScreen-Dark")
        
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "segue_to_proximityFinderVC".localized, sender: nil)
        }
    }
}
