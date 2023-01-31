//
//  ViewController.swift
//  TrafficLight
//
//  Created by Anton Kuzmin on 29.01.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var switchLightButton: UIButton!
    
    private var condition: TrafficLightCondition = .off
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundCorners(of: redLightView, yellowLightView, greenLightView)
        setAlphaToViewsByCondition(condition)
        configureButton(switchLightButton)
    }

    @IBAction func switchLight() {
        if (switchLightButton.configuration?.title == "START") {
            switchLightButton.configuration?.title = "NEXT"
            condition = .stop
        }
        
        setAlphaToViewsByCondition(condition)
    }
    
    private func setAlphaToViewsByCondition(_ currentCondition: TrafficLightCondition) {
        switch currentCondition {
        case .stop: redLightView.alpha = 1
            greenLightView.alpha = 0.3
            condition = .ready
        case .ready: redLightView.alpha = 0.3
            yellowLightView.alpha = 1
            condition = .go
        case .go: yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
            condition = .stop
        default: redLightView.alpha = 0.3
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 0.3
        }
    }
}

extension ViewController {
    
    private enum TrafficLightCondition {
        
        case off, stop, ready, go
    }
}

extension ViewController {
    
    private func roundCorners(of views: UIView...) {
        views.forEach { $0.layer.cornerRadius = $0.frame.width / 2 }
    }
    
    private func configureButton(_ button: UIButton) {
        button.layer.cornerRadius = 12
    }
}
