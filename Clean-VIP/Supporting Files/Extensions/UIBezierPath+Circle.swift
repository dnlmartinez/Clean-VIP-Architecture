//
//  UIBezierPath+Circle.swift
//  MaterialActivityIndicator
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit

extension UIBezierPath {
    convenience init(center: CGPoint, radius: CGFloat) {
        self.init(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(.pi * 2.0), clockwise: true)
    }
}
