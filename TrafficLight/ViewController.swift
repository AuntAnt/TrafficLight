//
//  ViewController.swift
//  TrafficLight
//
//  Created by Anton Kuzmin on 29.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var actionButton: UIButton!
    
    private var condition: Condition = .stop;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCircle(views: redLightView, yellowLightView, greenLightView)
        setAlphaToViews(redAlpha: 0.3, yellowAlpha: 0.3, greenAlpha: 0.3)
        setSettings(to: actionButton)
    }

    @IBAction func switchLight() {
        actionButton.configuration?.title = "NEXT"
        
        switch condition {
        case .stop:
            setAlphaToViews(redAlpha: 1, yellowAlpha: 0.3, greenAlpha: 0.3)
            condition = .ready
        case .ready:
            setAlphaToViews(redAlpha: 0.3, yellowAlpha: 1, greenAlpha: 0.3)
            condition = .go
        default:
            setAlphaToViews(redAlpha: 0.3, yellowAlpha: 0.3, greenAlpha: 1)
            condition = .stop
        }
    }
}

extension ViewController {
    
    private func makeCircle(views: UIView...) {
        views.forEach { $0.layer.cornerRadius = $0.frame.width / 2 }
    }
    
    private func setSettings(to button: UIButton) {
        button.layer.cornerRadius = 12
    }
    
    private func setAlphaToViews(redAlpha: Double, yellowAlpha: Double, greenAlpha: Double) {
        redLightView.alpha = redAlpha
        yellowLightView.alpha = yellowAlpha
        greenLightView.alpha = greenAlpha
    }
    
    enum Condition {
    
        case stop, ready, go
    }
}
