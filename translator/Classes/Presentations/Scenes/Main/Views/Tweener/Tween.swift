//
//  Tween.swift
//  translator
//
//  Created by Sreypich Phan on 1/8/19.
//  Copyright © 2019 Sreypich Phan. All rights reserved.
//

import Foundation
import UIKit

final class Tween {
    private let animator: UIViewPropertyAnimator
    
    init(duration: TimeInterval, closure: @escaping () -> (), commpletion: @escaping () -> () ) {
        let timing = UICubicTimingParameters(animationCurve: .easeOut)
        self.animator = UIViewPropertyAnimator(duration: duration, timingParameters: timing)
        self.animator.addAnimations {
            let greetings = ["Hello", "こんにちは", "ជំរាបសួរ", "你好", "नमस्ते", "ສະບາຍດີ", "Bonjour", "สวัสดี"]
            var txtAnimator: ViewControllerSubview = ViewControllerSubview()
            var i = 0
            func update() {
                if(i==8){
                    i=0
                }
                txtAnimator.label.text = greetings[i]
                i += 1
            }
        }
        self.animator.addCompletion { (positon) in
            if positon == .end {  commpletion() }
        }
    }
}


