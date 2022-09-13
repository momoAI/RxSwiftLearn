//
//  ViewModel.swift
//  RxSwiftLearn
//
//  Created by luxu on 2022/9/8.
//

import Foundation
import RxSwift

struct ViewModel {
    let mo = Model(title: "", detail: "")
    
    let data = Observable.just([
        Model(title: "a", detail: "11111"),
        Model(title: "b", detail: "22222"),
        Model(title: "c", detail: "33333")
    ])
}

