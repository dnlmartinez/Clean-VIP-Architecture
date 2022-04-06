//
//  CAPropertyAnimation+Key.swift
//  MaterialActivityIndicator
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit

extension CAPropertyAnimation {
    enum Key: String {
        var path: String {
            return rawValue
        }

        case strokeStart = "strokeStart"
        case strokeEnd = "strokeEnd"
        case strokeColor = "strokeColor"
        case rotationZ = "transform.rotation.z"
        case scale = "transform.scale"
    }

    convenience init(key: Key) {
        self.init(keyPath: key.path)
    }
}
