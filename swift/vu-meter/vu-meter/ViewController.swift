//
//  ViewController.swift
//  vu-meter
//
//  Created by 下村一将 on 2018/03/06.
//  Copyright © 2018年 kazu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let meter = VUMeter(frame: CGRect(x: 20, y: 20, width: 150, height: 100))
        meter.backgroundColor = .black
        self.view.addSubview(meter)
    }
}

