//
//  Int+DegreesToRadians.swift
//  6dof-vr
//
//  Created by Bartłomiej Nowak on 24/10/2017.
//  Copyright © 2017 Bartłomiej Nowak. All rights reserved.
//

import Foundation
import CoreGraphics

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
}

extension Float {
    var degreesToRadians: Float { return self * .pi / 180 }
}

extension Double {
    var degreesToRadians: Double { return self * .pi / 180 }
}
