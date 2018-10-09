//
//  ViewModel.swift
//  tdd-practice
//
//  Created by 下村一将 on 2018/10/09.
//  Copyright © 2018 下村一将. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {

    let textIsInteger: Observable<Bool>
    let showAlert: Observable<String>

    init(text: Observable<String?>) {
        let textIsInteger: Observable<Bool> = text.map {
            guard let text = $0 else { return false }
            return Int(text) != nil ? true : false
        }.share()
        self.textIsInteger = textIsInteger

        let showAlert = text
            .filter { $0 == "100" }
            .map { _ in "Text is 100" }
        self.showAlert = showAlert
    }
}
