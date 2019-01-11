////
////  ViewControllerRouter.swift
////  translator
////
////  Created by Sreypich Phan on 1/9/19.
////  Copyright © 2019 Sreypich Phan. All rights reserved.
////
//
import Foundation
import UIKit

final class ViewControllerRouter {
    
    weak var viewController: ViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func navigateToCamera() -> Void {
        self.viewController?.present(CameraViewController(), animated: true, completion: nil)
    }
    
}
