//
//  LaunchScreenViewController.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/23/23.
//
import UIKit
import Lottie

class LaunchScreenController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLottieView()
    }
    
    func showLottieView() {
        let animationView = LottieAnimationView(name: traitCollection.userInterfaceStyle == .light ?
                                            "LaunchScreen-Light" : "LaunchScreen-Dark")
        
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "ProximityFinder", sender: nil)
        }
    }
}
