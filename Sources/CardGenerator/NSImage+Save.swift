//
//  NSImage+Save.swift
//  CardGenerator
//
//  Created by Dylan Elliott on 8/5/21.
//

import AppKit

extension NSImage {
    func savePNG(path:String) {
        let imageRep = NSBitmapImageRep(data: self.tiffRepresentation!)!
        let pngData = imageRep.representation(using: .png, properties: [:])!
        let url = URL(fileURLWithPath: path)
        try! pngData.write(to: url)
    }

}
