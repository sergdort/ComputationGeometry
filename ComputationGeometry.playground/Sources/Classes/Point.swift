
public struct Point:Equatable {
   public let x:Double
   public let y:Double
   
   public init (x:Double, y:Double) {
      self.x = x
      self.y = y
   }
   
   public func inset(x:Double, y:Double) -> Point {
      return Point(x: self.x + x, y: self.y + y)
   }
}

public func == (p1:Point, p2:Point) -> Bool {
   return (p1.x == p2.x) && (p1.y == p2.y)
}

public func != (p1:Point, p2:Point) -> Bool {
   return !(p1 == p2)
}

extension Point:CustomStringConvertible {
   public var description:String {
      return "Point (\(x), \(y))"
   }
}