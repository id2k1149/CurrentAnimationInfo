//
//  ViewController.swift
//  CurrentAnimationInfo
//
//  Created by Max Franz Immelmann on 11/27/22.
//

import UIKit
import SpringAnimation

class MainViewController: UIViewController {

    @IBOutlet var infoView: SpringView!
    @IBOutlet var runButton: SpringButton!
    
    @IBOutlet var infoCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRandomAnimation()
    }
    
    @IBAction func runButtonTapped(_ sender: SpringButton) {
        
        if runButton.currentTitle == "Run" {
            getInfoValues()
            infoView.animate()
            guard let animation = DataSource.shared.animations.randomElement() else {return}
            runButton.setTitle("Run \(animation)", for: .normal)
        } else {
            guard let buttonTitle = runButton.currentTitle else { return }
            guard let currentAnimation = buttonTitle.components(separatedBy: " ").last else { return }
            
            infoView.animation = currentAnimation
            
            guard let curve = DataSource.shared.curves.randomElement() else { return }
            infoView.curve = curve
            
            let force = round(CGFloat(Float.random(in: 0...2)) * 100) / 100
            infoView.force = force
            
            let duration = round(CGFloat(Float.random(in: 0...2)) * 100) / 100
            infoView.duration = duration
            
            let delay = round(CGFloat(Float.random(in: 0...2)) * 100) / 100
            infoView.delay = delay
            
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
}

// MARK: - Private Methods
extension MainViewController {
    
    private func setRandomAnimation() {
        
        guard let animation = DataSource.shared.animations.randomElement() else {return}
//        runButton.setTitle("Run \(animation)", for: .normal)
        guard let curve = DataSource.shared.curves.randomElement() else { return }
        
        let force = round(CGFloat(Float.random(in: 0...2)) * 100) / 100
        let duration = round(CGFloat(Float.random(in: 0...2)) * 100) / 100
        let delay = round(CGFloat(Float.random(in: 0...2)) * 100) / 100
        
        infoCollection.forEach { info in
            
            guard let infoText = info.text?.components(separatedBy: ":").first else {return}
            
            switch infoText {
            case "preset":
                info.text = "preset: \(animation)"
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
    
    private func getInfoValues() {
        
        infoCollection.forEach { info in
            
            guard let infoText = info.text?.components(separatedBy: ": ").first else {return}
            
            switch infoText {
            case "preset":
                guard let animation = info.text?.components(separatedBy: ": ").last else {return}
                infoView.animation = animation
            case "curve":
                guard let curve = info.text?.components(separatedBy: ": ").last else {return}
                infoView.curve = curve
            case "force":
                guard let doubleValue = Double(info.text?.components(separatedBy: ": ").last ?? "0") else {return}
                let force = CGFloat(doubleValue)
                infoView.force = force
            case "duration":
                guard let doubleValue = Double(info.text?.components(separatedBy: ": ").last ?? "0") else {return}
                let duration = CGFloat(doubleValue)
                infoView.duration = duration
            case "delay":
                guard let doubleValue = Double(info.text?.components(separatedBy: ": ").last ?? "0") else {return}
                let delay = CGFloat(doubleValue)
                infoView.delay = delay
            default:
                info.text = "N/A"
            }
            
        }
    }
}
