//
//  ViewController.swift
//  morse-code
//
//  Created by 下村一将 on 2018/01/04.
//  Copyright © 2018年 kazu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let container = BinaryCodeContainer(codes: [.o, .i, .i])
		print(container.description)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

