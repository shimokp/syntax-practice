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
    let user: Observable<String>

    init(text: Observable<String?>,
         buttonTapped: Observable<Void>,
         fetchUser: Observable<Int>) {
        let textIsInteger: Observable<Bool> = text.map {
            guard let text = $0 else { return false }
            return Int(text) != nil ? true : false
        }.share()
        self.textIsInteger = textIsInteger

        let showAlert = buttonTapped
            .map { _ in "Button Tapped!" }

        self.showAlert = showAlert

        let user = fetchUser
            .flatMap(ViewModel.fetch)
        self.user = user
    }

    static func fetch(by userId: Int) -> Single<String> {
        return Single.create { single in
            URLSession.shared.dataTask(
                with: URL(string: "https://api.example.com/users/\(userId)")!,
                completionHandler: { (data, resp, error) in
                    if let error = error {
                        single(.error(error))
                        return
                    }

                    if let data = data {
                        single(.success(String(data: data, encoding: .utf8)!))
                        return
                    }
                    single(SingleEvent.error(NSError()))
            }).resume()

            return Disposables.create()
        }
    }
}
