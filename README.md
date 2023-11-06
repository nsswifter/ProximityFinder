# ProximityFinder
The project implements the `Nearest Pair of Points algorithm` that finds the closest pair of points in a 2D screen using a time complexity of `O(n log n)`. The algorithm is implemented in an iOS application using the `MVC` architectural pattern.

![Demo In Light Mode](Documentation/DemoLight.mov)
![Demo In Dark Mode](Documentation/DemoDark.mov)

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [License](#license)
- [Acknowledgments](#acknowledgments)
- [Contact](#contact)

## Overview

This is an innovative iOS application designed to demonstrate the power of efficient algorithms in solving real-world problems. This app showcases an algorithm that efficiently finds the nearest pair of points in a 2D screen with an impressive time complexity of `O(nlogn)`, where `n` is the number of points. 

<p> <img src="Documentation/TimeComplexityGraph.png" style="border: 1px solid purple" width="250" height="250"/> </p>

Upon launching the app, you'll be greeted with a captivating `Lottie` view displaying a mesmerizing launch screen video, setting the stage for an engaging and interactive experience. As the animation fades, you'll find yourself in the heart of the application, ready to explore the world of point optimization.

In the center of the screen, you'll notice a captivating view filled with points scattered across the 2D plane. These points represent a set of coordinates that you can manipulate using a convenient slider located below. Adjusting the slider will dynamically generate a new set of points, allowing you to explore the algorithm's efficiency with varying input sizes.

With each adjustment, the app springs to life, immediately recalculating and displaying the nearest pair of points in real-time. The distance between the two closest points is prominently showcased, providing you with a visual representation of the algorithm's effectiveness.

Curious to learn more? Just tap the button at the top of the screen to access a dedicated documentation view. Here, you'll find detailed explanations and insights into how the algorithm works its magic, empowering you with a deeper understanding of the underlying principles. Explore the algorithm's time complexity, the mechanisms behind the nearest pair detection, and gain a greater appreciation for the significance of efficient algorithms in various fields.

Whether you're a curious learner, an algorithm enthusiast, or a student of algorithm design, the Nearest Pair Finder app offers an engaging, visually captivating, and educational experience. Dive into the world of efficient algorithms, witness their impact firsthand, and unlock new dimensions of computational problem-solving.

## Features

- Calculates the Euclidean distance between two points in a 2D coordinate system.
- Finds the nearest pair of points in a given array of `CGPoint` using `CoreGraphics`.
- Uses a `divide-and-conquer` algorithm to recursively find the closest pair of points.
- Provides a graphical user interface to visualize the points and display the closest pair.

![Demo of Algorithm](Documentation/Algorithm.png)

## Installation

To run the Nearest Pair of Points algorithm application, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the application on the iOS simulator or a connected device.

## Usage

1. Launch the application on your iOS device.
2. The application displays a launch screen with a Lottie animation.
3. After the launch screen, you will see a view with a slider and a points view in the middle.
4. Use the slider to set the count of points on the screen.
5. The application will generate random points and find the closest pair.
6. The closest pair of points will be displayed on the screen with their distance.
7. You can tap the `documentation` button on the top leading of the screen to view more information about the algorithm and the application.

## Project Structure

```bash
.
├── AppDelegate.swift
├── Assets.xcassets
│   ├── AccentColor.colorset
│   │   └── Contents.json
│   ├── AppIcon.appiconset
│   │   ├── Contents.json
│   │   └── icon.png
│   ├── BlurBackground.colorset
│   │   └── Contents.json
│   ├── Contents.json
│   ├── LaunchScreenBackground.imageset
│   │   ├── Contents.json
│   │   └── LaunchScreenBackground.png
│   ├── ProximityFinderBackground.imageset
│   │   ├── Contents.json
│   │   └── ProximityFinderBackground.png
│   ├── Shadow.colorset
│   │   └── Contents.json
│   ├── SliderColor.colorset
│   │   └── Contents.json
│   └── Thumb.imageset
│       ├── Contents.json
│       ├── Thumb@2x.png
│       └── Thumb@3x.png
├── Controller
│   ├── DetailViewController.swift
│   ├── LaunchScreenController.swift
│   ├── LaunchScreenViewController.swift
│   └── ProximityFinderController.swift
├── Info.plist
├── Model
│   ├── ClosestPair.swift
│   └── ClosestPairCalculator.swift
├── SceneDelegate.swift
├── Utils
│   ├── CustomBlurView.swift
│   ├── CustomUIView.swift
│   ├── Extentions
│   │   ├── String.swift
│   │   └── UIView.swift
│   ├── Localizable.strings
│   └── LottieAnimation
│       ├── LaunchScreen-Dark.json
│       └── LaunchScreen-Light.json
└── View
    ├── Base.lproj
    │   └── Main.storyboard
    └── DynamicLinearGradientView.swift
```
The project follows the MVC architectural pattern and is structured as follows:

- **Model**: Contains the model classes and algorithms.
  - **ClosestPair.swift**: Represents the closest pair of points.
  - **ClosestPairCalculator.swift**: Provides the algorithm to find the closest pair of points.
- **View**: Contains the view-related files.
  - **Base.lproj/Main.storyboard**: The main storyboard file containing the application's interface.
  - **DynamicLinearGradientView.swift**: Provides a swiftUI view with a dynamic linear gradient.
- **Controller**: Contains view controllers responsible for managing different screens.
  - **DetailViewController.swift**: Manages the detail view screen.
  - **LaunchScreenViewController.swift**: Manages the launch screen view.
  - **ProximityFinderController.swift**: Manages the proximity finder screen.
- **Utils**: Contains utility classes and extensions.
  - **CustomBlurView.swift**: Provides a custom blur view.
  - **CustomUIView.swift**: Provides a custom UIView.
  - **Extensions**: Contains extensions for String and UIView.
  - **Localizable.strings**: Contains localized strings for the application.
  - **LottieAnimation**: Contains Lottie animation JSON files.


## Dependencies

The project has the following dependencies:

- [Lottie iOS](https://github.com/airbnb/lottie-ios.git)

## License

The Nearest Pair of Points algorithm project is licensed under the [MIT License](LICENSE).

## Contributing

Contributions to the project are welcome. If you find any issues or have suggestions for improvement, please open an issue or submit a pull request.

## Acknowledgments

The `Nearest Pair of Points` algorithm project is developed by [Mehdi Karami](https://www.github.com/nsswifter).

## Contact

For additional information or inquiries, please contact mehdi2003karami@gmail.com.
