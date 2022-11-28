//
//  Animation.swift
//  CurrentAnimationInfo
//
//  Created by Max Franz Immelmann on 11/27/22.
//

class Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var info: String {
"""
preset: \(preset)
curve: \(curve)
force: \(force)
duration: \(duration)
delay: \(delay)
"""
    }
    
    init(preset: String,
         curve: String,
         force: Double,
         duration: Double,
         delay: Double) {
        self.preset = preset
        self.curve = curve
        self.force = force
        self.duration = duration
        self.delay = delay
    }
}

extension Animation {
    
    static func getAnimation() -> Animation {
        let preset = DataStore.shared.animations.randomElement()
        let curve = DataStore.shared.curves.randomElement()
        let force = Double.random(in: 1...2)
        let duration = Double.random(in: 0...2)
        let delay = Double.random(in: 0...2)
        
        let animation = Animation(
            preset: preset ?? "pop",
            curve: curve ?? "easeIn",
            force: force,
            duration: duration,
            delay: delay
        )
        
        return animation
    }
    
}
