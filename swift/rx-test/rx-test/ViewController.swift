//
//  ViewController.swift
//  rx-test
//
//  Created by 下村一将 on 2018/01/21.
//  Copyright © 2018年 kazu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
	let disposeBag = DisposeBag()

	let kkk = PublishSubject<String>()

	override func viewDidLoad() {
		super.viewDidLoad()

		let strings: [String] = ["1","2","3"]
		let nums: [Int] = strings.flatMap { _ in Optional<Int>(4) }
		print(nums) // [1,2,3]

		let _: [Int?] = strings.map { Int($0) }

		let _: Int? = Int("a")

		let numArrays: [[Int]] = [[1,2], [2,3,4]]
		let bool = numArrays.flatMap({ (a: [Int]) -> Bool in
			return a.count > 2
		})
		print(bool) // false, true

		let optValue: Int? = 3
		let _ : String? = optValue.flatMap( { num -> String in
			return num.description
		})

		let observableValue: Observable<String> = Observable.just("value")
		_ = observableValue.flatMap { _ in Driver.just("hoge") } // Observable.flatMap の返り値は Observable。中で何を返そうがObservable



		//		let subject = PublishSubject<String>()
		//		let observable: Observable<String> = subject
		//		observable.subscribe(onNext: { (value) in
		//
		//		}, onError: <#T##((Error) -> Void)?##((Error) -> Void)?##(Error) -> Void#>, onCompleted: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onDisposed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
		//
		//		let jjj: PublishSubject<String> = Observable<String>.create { ( observer) -> Disposable in
		//			observer.onNext("")
		//			return Disposables.create()
		//			} as! PublishSubject<String>
		//
		//		jjj.onNext("aaa")
		//		jjj.onNext("bbb")
		//
		//		jjj.subscribe(onNext: { (value) in
		//			print(value)
		//		}, onError: { (error) in
		//
		//		})

		let doubleObservable: Observable<Observable<String>> = .just(kkk)
		let converted = doubleObservable.flatMap( { (s: Observable<String>) -> Observable<String> in
			return s.map {
				print("called", $0)
				return $0
			}
		})
		converted.subscribe()
			.disposed(by: disposeBag)

		kkk.onNext("alkdfj")


		// Observable はイベントのハッカが決まっているもの、主に内部から発火させる
		// 外側からPublishSubject


		//		observableValue.flatMap( { str -> Variable<String> in
		//			print(type(of: str))
		//			return Variable("hoge")
		//		})
		//		.subscribe()
		//		.disposed(by: disposeBag)
	}

	var num = 0
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		kkk.onNext("\(num)")
		num += 1
	}
}
