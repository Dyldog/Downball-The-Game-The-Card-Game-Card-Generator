import AppKit

let rootPath = "/Users/dylanelliott/Desktop"
let resourcesPath = "\(rootPath)/CardGenerator/Sources/CardGenerator/Resources"

let arrow = NSImage(contentsOfFile: "\(resourcesPath)/Arrow.png")!
let dot = NSImage(contentsOfFile: "\(resourcesPath)/Dot.png")!
let border = NSImage(contentsOfFile: "\(resourcesPath)/Border.png")!

let outPath = "\(rootPath)/GeneratedCards"

extension Array where Element == Bit {
    var title: String {
        return self.map { $0.description}.joined()
    }
}

(1..<15).forEach { dots in
    Direction.allCases.forEach { direction in
        let card = Card(direction: direction, dots: UInt8(dots))
        
        print("Saving \(card.name)...")
        
        card.image.savePNG(path: "\(outPath)/\(card.name).png")
        
        if card.direction.isCardinalDirection {
            card.image.savePNG(path: "\(outPath)/\(card.name).png")
        }
    }
}

