//
//  VUMeter.swift
//  vu-meter
//
//  Created by 下村一将 on 2018/03/06.
//  Copyright © 2018年 kazu. All rights reserved.
//

import UIKit

class VUMeter: UIView {

    var picos: [CAShapeLayer] = []
            var index = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        backgroundColor = .clear


        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { (timer) in
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }

                self.picos[self.index].backgroundColor = UIColor.red.cgColor
                if self.index != 0 {
                    self.picos[self.index-1].backgroundColor = UIColor.green.cgColor
                } else {
                    self.picos.last?.backgroundColor = UIColor.green.cgColor
                }

                print(self.index)

                if self.picos.count < self.index+2 {
                    self.index = 0
                } else {
                    self.index += 1
                }
            }
        }.fire()
    }

    override func draw(_ rect: CGRect) {
        var originPointX = 0
        for _ in 0...9 {
            let pico = CAShapeLayer()
            pico.frame = CGRect(x: originPointX, y: 0, width: 6, height: 20)
            pico.backgroundColor = UIColor.green.cgColor
            layer.addSublayer(pico)
            picos.append(pico)
            originPointX += 12
        }
    }

}
