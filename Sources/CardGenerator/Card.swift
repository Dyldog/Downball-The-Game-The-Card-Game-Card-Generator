//
//  Card.swift
//  CardGenerator
//
//  Created by Dylan Elliott on 8/5/21.
//

import AppKit

struct Card {
    let direction: Direction
    private let dotsIndex: UInt8
    
    var dots: [Bit] { return Array(dotsIndex.bits[0..<4]) }
    
    init(direction: Direction, dots: UInt8) {
        self.direction = direction
        self.dotsIndex = dots
    }
    
    var image: NSImage {
        let finalImage = NSImage(size: arrow.size)
        finalImage.lockFocus()
        
        border.draw(in: NSMakeRect(0, 0, arrow.size.width, arrow.size.height))
        
        arrow.rotated(by: direction.angle).draw(in: NSMakeRect(0, 0, arrow.size.width, arrow.size.height))
        
        dots.enumerated().filter { $0.element.value == 1 }.map { $0.offset * 90 }.forEach {
            dot.rotated(by: CGFloat($0)).draw(in: NSMakeRect(0, 0, arrow.size.width, arrow.size.height))
        }
        
        finalImage.unlockFocus()
        
        return finalImage
    }
    
    var name: String {
        return "\(direction.name)\(dots.title)"
    }
}
