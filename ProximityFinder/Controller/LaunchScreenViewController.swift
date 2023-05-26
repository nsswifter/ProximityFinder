//
//  LaunchScreenViewController.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/23/23.
//

import UIKit
import Lottie

// MARK: - Launch Screen Controller

/// The View Controller responsible for the launch screen.
class LaunchScreenController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLottieView()
    }
    
    /// Shows the Lottie animation view on the launch screen.
    func showLottieView() {
        let animationView = LottieAnimationView(name: traitCollection.userInterfaceStyle == .light ?
                                                "lottie_launch_screen_light".localized : "lottie_launch_screen_dark".localized)
        
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "segue_to_proximityFinderVC".localized, sender: nil)
        }
    }
}
