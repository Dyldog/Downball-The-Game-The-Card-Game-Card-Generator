//
//  Direction.swift
//  CardGenerator
//
//  Created by Dylan Elliott on 8/5/21.
//

import Foundation

enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
    case upLeft
    case upRight
    case downLeft
    case downRight
    
    var angle: CGFloat {
        switch self {
        
        case .up: return 0
        case .upRight: return Direction.up.angle - 45
        case .right: return 270
        case .downRight: return Direction.right.angle - 45
        case .down: return 180
        case .downLeft: return Direction.down.angle - 45
        case .left: return 90
        case .upLeft: return Direction.left.angle - 45
        }
    }
    
    var name: String {
        switch self {
            case .up: return "Up"
            case .upRight: return "UpRight"
            case .right: return "Right"
            case .downRight: return "DownRight"
            case .down: return "Down"
            case .downLeft: return "DownLeft"
            case .left: return "Left"
            case .upLeft: return "UpLeft"
        }
    }
    
    var isCardinalDirection: Bool {
        switch self {
        case .up, .down, .left, .right: return true
        default: return false
        }
    }
}
