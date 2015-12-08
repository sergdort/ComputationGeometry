import Foundation

public struct Line { //ax + by + c = 0
   public let a:Double
   public let b:Double
   public let c:Double
   public let vector:Vector
   
   public init(p1:Point, p2:Point) {
      a = p2.y - p1.y
      b = p1.x - p2.x
      c = p1.x * (-a) + p1.y * (-b)
      vector = Vector(p1: p1, p2: p2)
   }
}

extension Line:CustomStringConvertible {
   public var description:String {
      return "Line a = \(a), b = \(b), c = \(c) v.len = \(vector.length)"
   }
}

extension Line:Equatable {
}

public func == (this:Line, that:Line) -> Bool {
   /*
       |a1 b1|
   D = |a2 b2|
   
   */
   
   let D = this.a * that.b - this.b * that.a
   
   /*
   |-c1 b1|
   Dx = |-c2 b2|
   
   */
   
   let Dx = (-this.c) * that.b + this.b * that.c
   
   
   /*
   |a1 -c1|
   Dy = |a2 -c2|
   
   */
   
   let Dy = this.a * (-that.c) + this.c * that.a
   
   return D == 0 && Dx == 0 && Dy == 0
}

extension Line {
   
   public func crossPoint(that:Line) -> CrossPointResult {
      
      /*
      |a1 b1|
      D = |a2 b2|
      
      */
      
      let D = a * that.b - b * that.a
      
      /*
      |-c1 b1|
      Dx = |-c2 b2|
      
      */
      
      let Dx = (-c) * that.b + b * that.c
      
      
      /*
      |a1 -c1|
      Dy = |a2 -c2|
      
      */
      
      let Dy = a * (-that.c) + c * that.a
      
      if self == that {
         return .SameLine
      } else if D == 0 {
         return .Parallel
      } else {
         return .Some(Point(x: Dx/D, y: Dy/D))
      }
      
   }
   
   public func angle(that:Line) -> Double {
      let vectorProduct = a * that.b - b * that.a
      
      /*        A1*B2 - A2*B1
      tgA = ---------------
      A1*A2 + B1*B2
      */
      
      if self == that {
         
         let cos = self.vector * that.vector / self.vector.length / that.vector.length
         let alpha = acos(cos)
         
         return alpha * 180 / M_PI
         
         
      } else {
         let tan = (self.a * that.b - that.a * self.b) / (self.a * that.a + self.b * that.b)
         let alpha = atan(fabs(tan)) * 180 / M_PI
         
         return vectorProduct >= 0 ? alpha : (360 - alpha)
      }
   }
   
}





