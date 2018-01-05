//
//  BinaryCodeContainer.swift
//  morse-code
//
//  Created by 下村一将 on 2018/01/04.
//  Copyright © 2018年 kazu. All rights reserved.
//

import Foundation

public struct BinaryCodeContainer {
	
	public enum Code {
		case o // 0
		case i // 1
	}
	
	public static let empty = BinaryCodeContainer(codes: [])
	
	public let codes: [Code]
	
	public init(codes: [Code]) {
		self.codes = codes
	}
}

extension BinaryCodeContainer.Code: CustomStringConvertible {
	public var description: String {
		switch self {
		case .o:
			return "0"
			
		case .i:
			return "1"
		}
	}
}

extension BinaryCodeContainer: CustomStringConvertible {
	public var description: String {
		return self.codes.reduce("", { (description, code) -> String in
			return description + code.description
		})
	}
}
