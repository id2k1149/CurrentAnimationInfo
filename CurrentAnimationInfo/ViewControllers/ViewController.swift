//
//  ViewController.swift
//  CurrentAnimationInfo
//
//  Created by Max Franz Immelmann on 11/27/22.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet var infoView: SpringView!
    @IBOutlet var runButton: SpringButton!
    
    @IBOutlet var infoCollection: [UILabel]!
    
    @IBAction func runButtonTapped(_ sender: SpringButton) {
        
        guard let buttonTitle = runButton.currentTitle else { return }
        guard let currentAnimation = buttonTitle.components(separatedBy: " ").last else { return }
        
        infoView.animation = currentAnimation
        
        guard let curve = DataSource.shared.curves.randomElement() else { return }
        infoView.curve = curve
        
        var randomFloat = Float.random(in: 0...2)
        let force = round(CGFloat(randomFloat) * 100) / 100
        infoView.force = force
        
        randomFloat = Float.random(in: 0...1)
        let duration = round(CGFloat(randomFloat) * 100) / 100
        infoView.duration = 1
        
        randomFloat = Float.random(in: 0...1)
        let delay = round(CGFloat(randomFloat) * 100) / 100
        infoView.delay = 1
        
        infoView.animate()
        
        guard let animation = DataSource.shared.animations.randomElement() else {return}
        runButton.setTitle("Run \(animation)", for: .normal)
        
        infoCollection.forEach { info in
            
            guard let infoText = info.text?.components(separatedBy: ":").first else {return}
            
            switch infoText {
            case "preset":
                info.text = "preset: \(currentAnimation)"
            case "curve":
                info.text = "curve: \(curve)"
            case "force":
                info.text = "force: \(force)"
            case "duration":
                info.text = "duration: \(duration)"
            case "delay":
                info.text = "delay: \(delay)"
            default:
                info.text = "N/A"
            }
            
        }
    }
}
