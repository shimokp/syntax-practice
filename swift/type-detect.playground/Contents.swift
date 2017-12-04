//: Playground - noun: a place where people can play

import UIKit

protocol P {
	associatedtype Response
}

func typeDetect<T: P>(instance: T) {
	switch T.Response.self {
	case is String.Type:
		print("String")
	case is Int.Type:
		print("Int")
	default:
		print("else")
	}
}

class C1: P {
	typealias Response = String
}

class C2: P {
	typealias Response = Int
}

let c1 = C1()
let c2 = C2()

typeDetect(instance: c1)
typeDetect(instance: c2)

