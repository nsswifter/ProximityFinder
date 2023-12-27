//
//  DetailViewController.swift
//  ProximityFinder
//
//  Created by Mehdi Karami on 5/26/23.
//

import SwiftUI

// MARK: - Detail View Controller

/// A Detail View Controller to display information about the application functionality.
class DetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var overviewTitleLabel: UILabel!
    @IBOutlet weak var overviewDescriptionLabel: UILabel!
    @IBOutlet weak var overviewAlgorithmStepsLabel: UILabel!
    @IBOutlet weak var overviewTimeArchitectureLabel: UILabel!
    @IBOutlet weak var overviewAcknowledgmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwiftUIView(DynamicLinearGradientView(), to: backgroundView)
        
        setup()
    }
    
    /// Performs initial setup.
    func setup() {
        overviewTitleLabel.text = "overview_title".localized
        overviewDescriptionLabel.text = "overview_description".localized
        overviewAlgorithmStepsLabel.text = "overview_algorithm_steps".localized
        overviewTimeArchitectureLabel.text = "overview_time_architecture".localized
        overviewAcknowledgmentLabel.text = "overview_acknowledgment".localized
    }
    
    /// Adds a SwiftUI view to the specified view.
    /// - Parameters:
    ///   - swiftUIView: The SwiftUI view to be added.
    ///   - view: The UIKit view to which the SwiftUI view will be added.
    func addSwiftUIView(_ swiftUIView: some View, to view: UIView) {
        // Create a UIHostingController to wrap the SwiftUI view
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add the SwiftUI view as a subview to the UIKit view
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Setup constraints for the hosting controller's view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
