//
//  ViewControllerSubview.swift
//  translator
//
//  Created by Sreypich Phan on 1/3/19.
//  Copyright © 2019 Sreypich Phan. All rights reserved.
//

import Foundation
import SnapKit
import Then

class ViewControllerSubview {
    
    let label = UILabel().then {
        $0.text = "Hello"
    }
    
    let voiceBtn = UIButton().then {
        $0.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        $0.setImage(UIImage(named: "microphone"), for: .normal)
    }
    let textBtn = UIButton().then {
        $0.setImage(UIImage(named: "keyboard"), for: .normal)

    }
    let cameraBtn = UIButton().then {
        $0.setImage(UIImage(named: "camera"), for: .normal)
    }
    
    let chatBtn = UIButton().then {
        $0.setImage(UIImage(named: "chat"), for: .normal)
    }
    
    func updateConstraints() {
        self.label.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.voiceBtn.snp.top).offset(-150)
        
        }
        self.voiceBtn.snp.makeConstraints { (make) in
//            make.width.equalTo(100)
//            make.height.equalTo(100)
            make.center.equalToSuperview()
        }
        self.textBtn.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(150)
//            make.left.equalTo(self.voiceBtn.snp.bottom)
//            make.left.equalTo(self.voiceBtn.snp.left).offset(10)
            make.top.equalTo(self.voiceBtn.snp.bottom)
            make.left.equalToSuperview()
            
            
        }
        self.cameraBtn.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(300)
//            make.center.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(self.voiceBtn.snp.bottom)
        }
        self.chatBtn.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(150)
            //            make.center.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.voiceBtn.snp.bottom)
        }
    }
    
}
