//
//  Bit.swift
//  CardGenerator
//
//  Created by Dylan Elliott on 8/5/21.
//

import Foundation

enum Bit: UInt8, CustomStringConvertible {
    case zero, one

    var value: Int {
        switch self {
        case .zero: return 0
        case .one: return 1
        }
    }
    var description: String {
        switch self {
        case .one:
            return "1"
        case .zero:
            return "0"
        }
    }
}

extension UInt8 {
    var bits: [Bit] {
        var byte = self
        var bits = [Bit](repeating: .zero, count: 8)
        for i in 0..<8 {
            let currentBit = byte & 0x01
            if currentBit != 0 {
                bits[i] = .one
            }

            byte >>= 1
        }

        return bits
    }
}
