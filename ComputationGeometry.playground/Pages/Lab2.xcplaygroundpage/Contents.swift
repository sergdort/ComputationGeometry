
import UIKit
import XCPlayground

let width = 400
let height = 400

let points:[Point] = (0...30).map({ _ in
   let x = 0 + arc4random_uniform(UInt32(width))
   let y = 0 + arc4random_uniform(UInt32(height))
   return Point(x: Double(x), y: Double(y))
})

let jarvisPoints = GrahamFilter.filter(points).map({CGPoint(x: $0.x, y: $0.y)})

let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
view.backgroundColor = UIColor.whiteColor()

let cgPoints = points.map({CGPoint(x: $0.x, y: $0.y)})

cgPoints.forEach { (p) -> () in
   let v = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
   v.backgroundColor = UIColor.redColor()
   v.center = p
   view.addSubview(v)
}

jarvisPoints.forEach { (p) -> () in
   let v = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
   v.backgroundColor = UIColor.blueColor()
   v.center = p
   view.addSubview(v)
}

view.playgroundLiveViewRepresentation()
