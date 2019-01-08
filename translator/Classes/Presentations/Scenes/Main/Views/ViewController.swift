//
//  ViewController.swift
//  translator
//
//  Created by Sreypich Phan on 1/3/19.
//  Copyright © 2019 Sreypich Phan. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    var subview: ViewControllerSubview = ViewControllerSubview()
    
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

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
//         Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.subview.label)
        self.view.addSubview(self.subview.voiceBtn)
        self.view.addSubview(self.subview.textBtn)
        self.view.addSubview(self.subview.cameraBtn)
        self.view.addSubview(self.subview.chatBtn)
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundImage")!)
        let historyViewController = HistoryViewController()
        historyViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "history"), selectedImage: UIImage(named: "history_selected"))
        
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "setting"), selectedImage: UIImage(named: "setting_selected"))
        
        let pinViewController = PinViewController()
        pinViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "pin"), selectedImage: UIImage(named: "pin_selected"))
        
        let viewControllerList = [ historyViewController, pinViewController, settingViewController ]
        viewControllers = viewControllerList
    }
    
    override func viewDidLayoutSubviews() {
        self.subview.updateConstraints()
    }
}

