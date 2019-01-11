//
//  ViewControllerReactor.swift
//  translator
//
//  Created by Sreypich Phan on 1/9/19.
//  Copyright © 2019 Sreypich Phan. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift
//import RxCocoa

class ViewControllerReactor: Reactor {
    var initialState: ViewControllerReactor.State
    
    enum Action {
        case cameraBtn
    }
    enum Mutation {
        
    }
    var router: ViewControllerRouter
    struct State {
        
    }
    init(router: ViewControllerRouter){
        self.router = router
        initialState = State()
    }
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
        case .cameraBtn:
            self.router.navigateToCamera()
        }
        return Observable.empty()
    }
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        switch mutation {
       
        }
    }
    
}
