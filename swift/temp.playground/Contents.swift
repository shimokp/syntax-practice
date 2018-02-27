//: Playground - noun: a place where people can play

import UIKit

//func example<T>(_ type: T.Type) {
////    print(a.description)
//    print(type)
//}
//
////example(a: "a")
//
//example(Int.self)
//

//func example<T>(_ type: T.Type=T.self) -> (T) -> () {
//    return { arg in
//        print(arg)
//    }
//}

//let intFunction = example(Int.self)
//intFunction(4)
//intFunction(7)

//let intE = example(type: Int.self)
//example(String.self)("hoge")


//func test<T>(arg: T) -> () {
//    print(arg)
//}
//
//func test<T>(type: T.Type=T.self) -> (T) -> () {
//    return test
//}
//
//test(type: Int.self)(4)


//func example<T>(arg: T) -> () {
//    print(arg)
//}
//
//func example<T>(type: T.Type=T.self) -> (T) -> () {
//    return example
//}
//
//
//let intE = example(type: Int.self)


class Number {}
class Zero : Number {}
class Succ<N:Number> : Number {}

typealias One = Succ<Zero>
typealias Two = Succ<Succ<Zero>>
typealias Three = Succ<Succ<Succ<Zero>>>

class Eq<S: Number, T: Number> {}
class Add<S: Number, T:Number> : Number {}

// reflective : ( m = m  }
func reflective<S>(s:S.Type) -> Eq<S,S> { return Eq<S,S>() }

// symmetric : { m = n => n = m }
func symmetric<S,T>(s:S.Type, t:T.Type) -> (Eq<S,T>) -> Eq<T,S> { return {(e1:Eq<S,T>) -> Eq<T,S> in Eq<T,S>() } }

// transitive : s = t => t = r => r = s
func transitive<S,T,R>(s:S.Type, t:T.Type,r:R.Type) -> (Eq<S,T>) -> (Eq<T,R>) -> Eq<R,S> {
    return { (e1: Eq<S,T>) -> ((Eq<T,R>) -> Eq<R,S>) in
        { (e2: Eq<T,R>) -> Eq<R,S> in Eq<R,S>() }
    }
}

// axiom1 : s = t => succ(s) => succ(t)
func axiom1<S,T>(s:S.Type, t:T.Type) -> (Eq<S,T>) -> Eq<Succ<S>,Succ<T>>  {
    return { (x:Eq<S,T>) -> Eq<Succ<S>, Succ<T>> in Eq<Succ<S>, Succ<T>>() }
}

// axiom2 : s + 0 = s
func axiom2<S>(s:S.Type) -> Eq<Add<S,Zero>,S> { return Eq<Add<S,Zero>,S>() }

// axiom3 : s + succ(t) = succ(s + t)
func axiom3<S,T>(s:S.Type, t:T.Type) -> Eq<Add<S,Succ<T>>, Succ<Add<S,T>>>  { return Eq<Add<S,Succ<T>>, Succ<Add<S,T>>>()  }


// proof1 : succ(zero) + succ(zero) = succ(zero + succ(zero))
// use axiom3
let proof1 : Eq<Add<Succ<Zero>,Succ<Zero>>, Succ<Add<Succ<Zero>,Zero>>> = axiom3(s:Succ<Zero>.self, t:Zero.self)

// proof2 : succ(zero) + zero = succ(zero)
let proof2 : Eq<Add<Succ<Zero>, Zero>, Succ<Zero>> = axiom2(s:Succ<Zero>.self)

// proof3 : succ( succ(zero) + zero ) = succ(succ(zero))
let proof3 : Eq<Succ<Add<Succ<Zero>, Zero>>,Succ<Succ<Zero>>> = axiom1(s:Add<Succ<Zero>, Zero>.self,t:Succ<Zero>.self)(proof2)

// proof4 :  succ(succ(zero)) = succ(zero) + succ(zero)
let proof4 : Eq<Succ<Succ<Zero>>,Add<Succ<Zero>, Succ<Zero>>> = transitive(s:Add<Succ<Zero>,Succ<Zero>>.self,
                                                                           t: Succ<Add<Succ<Zero>, Zero>>.self,
                                                                           r: Succ<Succ<Zero>>.self)(proof1)(proof3)

// proof5 : succ(zero) + succ(zero) = succ(succ(zero)
let proof5 : Eq<Add<Succ<Zero>, Succ<Zero>>, Succ<Succ<Zero>>> = symmetric(s:Succ<Succ<Zero>>.self, t:Add<Succ<Zero>, Succ<Zero>>.self)(proof4)
