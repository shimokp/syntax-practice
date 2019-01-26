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
import Mockingjay

@testable import tdd_practice

class ViewModelSpec: QuickSpec {
    override func spec() {
        var scheduler: TestScheduler!

        beforeEach {
            scheduler = TestScheduler(initialClock: 0)

            let userJson = "{\"id\": 1, \"name\": \"test-user\"}"
            self.stub(uri("https://api.example.com/users/1"), jsonData(userJson.data(using: .utf8)!))
        }

        describe("テキストが整数かどうか") {
            it("テキストが整数の場合はtrue", closure: {
                let xs: TestableObservable<String?> = scheduler.createHotObservable([
                    Recorded.next(210, ""),
                    Recorded.next(220, "123"),
                    Recorded.next(230, "abc"),
                    ])

                let res = scheduler.start {
                    ViewModel(text: xs.asObservable(),
                              buttonTapped: .empty(),
                              fetchUser: .empty())
                        .textIsInteger
                }

                expect(res.events).to(equal([
                    Recorded.next(210, false),
                    Recorded.next(220, true),
                    Recorded.next(230, false),
                    ]))
            })
        }

        describe("アラートの表示") {
            it("100", closure: {
                let xs = scheduler.createHotObservable([
                    Recorded.next(210, ()),
                    ])

                let res = scheduler.start {
                    return ViewModel(text: .empty(),
                                     buttonTapped: xs.asObservable(),
                                     fetchUser: .empty()).showAlert
                }

                expect(res.events).to(equal([
                    Recorded.next(210, "Button Tapped!"),
                    ]))
            })
        }

        describe("API") {
            it("fetch user") {
                let viewModel = ViewModel(text: .empty(),
                                          buttonTapped: .empty(),
                                          fetchUser: Observable.of(1))

                expect(try! viewModel.user.toBlocking().toArray())
                    .to(equal(["""
{"id": 1, "name": "test-user"}
"""
                        ]))
            }
        }
    }
}

extension Recorded: Equatable where Value: Equatable {}
extension Event: Equatable where Element: Equatable {}
