import Foundation

public struct GrahamFilter {
   
   public static func filter(points:[Point]) -> [Point] {
      
      if points.count < 2 {
         return []
      }
      
      if let start = startPoint(points) {
         let sorted = points.filter(startFilter(start)).sort(comparator(start))
         var stack = [start, sorted.first!]
         
         for (var i = 1; i < sorted.count; i++) {
            while ( isLeft(stack[stack.count - 2]
               , b: stack[stack.count - 1],
               c: sorted[i]) == false && !stack.isEmpty ) {
                  stack.removeLast()
            }
            stack.append(sorted[i])
         }
         return stack
      }
      
      return []
   }
   
   private static func startFilter(start:Point)(other:Point) -> Bool {
      return start != other
   }
   
   private static func comparator(start:Point)(p1:Point, p2:Point) -> Bool {
      let line1 = Line(p1: start, p2: p1)
      let line2 = Line(p1: start, p2: p2)
      var angle1 = atan((start.y - p1.y) / (p1.x - start.x))
      var angle2 = atan((start.y - p2.y)/(p2.x - start.x))
      if angle1 < 0 {
         angle1 = M_PI + angle1
      }
      if angle2 < 0 {
         angle2 = M_PI + angle2
      }
      if angle1 == angle2 {
         return line1.vector.length > line2.vector.length
      } else {
         return angle1 > angle2
      }
   }
   
   private static func isLeft(a:Point, b:Point, c:Point) -> Bool {
      let uX = b.x - a.x;
      let uY = b.y - a.y;
      let vX = c.x - a.x;
      let vY = c.y - a.y;
      let result = uX*vY - vX*uY >= 0;
      
      return result;
      
   }
   
   private static func startPoint(points:[Point]) -> Point? {
      if let minY =  points.minElement({ $0.y < $1.y}),
         let start = points.filter({$0.y == minY.y})
                           .minElement({$0.x < $1.x}) {
               return start
      }
      return nil
   }
   
}

