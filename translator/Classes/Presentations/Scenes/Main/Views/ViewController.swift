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
    var viewController: ViewController  = ViewController()
    
    
    override func viewDidAppear(_ animated: Bool) {
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate() {
        let animate: CABasicAnimation = CABasicAnimation(keyPath: "text")
        animate.duration = 5.0
        animate.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animate.repeatCount = .infinity
        
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        self.view.layer.add(transition, forKey: nil)
        
        self.subview.label.layer.add(animate, forKey: "changeTextTransition")
        let greetings = ["Hello", "ជំរាបសួរ", "こんにちは", "வணக்கம்", "你好", "नमस्ते", "ສະບາຍດີ", "Bonjour", "สวัสดี", "مرحبا", "여보세요"]
        if let randomGretting = greetings.randomElement() {
            self.subview.label.text = randomGretting
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

