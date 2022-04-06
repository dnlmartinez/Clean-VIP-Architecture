//
//  CGSize+Min.swift
//  MaterialActivityIndicator
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit

extension CGSize {
    var min: CGFloat {
        return CGFloat.minimum(width, height)
    }
}
