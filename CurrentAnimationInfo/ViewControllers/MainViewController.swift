//
//  ViewController.swift
//  CurrentAnimationInfo
//
//  Created by Max Franz Immelmann on 11/27/22.
//

import UIKit
import SpringAnimation

class MainViewController: UIViewController {
    
    // MARK: @IBOutlet
    @IBOutlet var infoView: SpringView!
    @IBOutlet var animationInfo: UILabel! {
        didSet {
            animationInfo.text = animation.info
        }
    }
    
    // MARK: private var
    private var animation = Animation.getAnimation()
    
    // MARK: @IBAction
    @IBAction func runButtonTapped(_ sender: SpringButton) {
        animationInfo.text = animation.info
        
        infoView.animation = animation.preset
        infoView.curve = animation.curve
        infoView.force = animation.force
        infoView.duration = animation.duration
        infoView.delay = animation.delay
        
        infoView.animate()
        
        animation = Animation.getAnimation()
        sender.setTitle("Run \(animation.preset)", for: .normal)
    }
}
