import Foundation

public struct Vector {
   public let x:Double
   public let y:Double
   
   public var length:Double {
      get {
         return sqrt(x * x + y * y)
      }
   }
   
   public init(p1:Point, p2:Point) {
      x = p2.x - p1.x
      y = p2.y - p2.y
   }
}

extension Vector:CustomStringConvertible {
   public var description:String {
      return "Point (\(x), \(y))"
   }
}

public func * (v1:Vector, v2:Vector) -> Double {
   return v1.x * v2.x + v1.y * v2.y
}
