//
//  tdd_practiceTests.swift
//  tdd-practiceTests
//
//  Created by 下村一将 on 2018/10/08.
//  Copyright © 2018 下村一将. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
import RxTest

@testable import tdd_practice

class ViewModelSpec: QuickSpec {
    override func spec() {
        var scheduler: TestScheduler!
        let disposeBag = DisposeBag()

        beforeEach {
            scheduler = TestScheduler(initialClock: 0)
        }

        describe("テキストが整数かどうか") {
            it("テキストが整数の場合はtrue", closure: {
                let xs: TestableObservable<String?> = scheduler.createHotObservable([
                    Recorded.next(10, ""),
                    Recorded.next(20, "123"),
                    Recorded.next(30, "abc"),
                    ])

                let observer = scheduler.createObserver(Bool.self)

                ViewModel(text: xs.asObservable())
                    .textIsInteger
                    .subscribe(observer)
                    .disposed(by: disposeBag)

                scheduler.start()

                expect(observer.events).to(equal([
                    Recorded.next(10, false),
                    Recorded.next(20, true),
                    Recorded.next(30, false),
                    ]))
            })
        }
    }
}

extension Recorded: Equatable where Value: Equatable {}
extension Event: Equatable where Element: Equatable {}
