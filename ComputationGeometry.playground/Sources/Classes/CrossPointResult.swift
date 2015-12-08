import Foundation

public enum CrossPointResult {
   
   case Some(Point)
   case SameLine
   case Parallel
}

extension CrossPointResult:CustomStringConvertible {
   public var description:String {
      switch self {
      case let .Some(p): return p.description
      case .SameLine: return "Same Line"
      case .Parallel: return "Lines are Parallel"
      }
   }
}

extension CrossPointResult:Equatable {
}

public func == (left:CrossPointResult, right:CrossPointResult) -> Bool {
   switch (left, right) {
   case let (.Some(l), .Some(r)) : return l == r
   case (.SameLine, .SameLine): return true
   case (.Parallel, .Parallel): return true
   default : return false
   }
}
