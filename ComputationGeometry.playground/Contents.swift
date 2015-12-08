//: Playground - noun: a place where people can play

import Foundation

let p1 = Point(x: 1, y: 1)
let p2 = Point(x: 1, y: -1)
let p3 = Point(x: -1, y: 1)
let p4 = Point(x: -1, y: -1)
let p5 = Point(x: 10, y: 1)

let l1 = Line(p1: p1, p2: p2)

let l2 = Line(p1: p3, p2: p4)

let l3 = Line(p1: p4, p2: p1)

let l4 = Line(p1: p2, p2: p3)

let l5 = Line(p1: p1, p2: p3)

let l6 = Line(p1: p5, p2: p1)

l1.crossPoint(l2)
l3.crossPoint(l4)
l5.crossPoint(l6)


l4.angle(l3)
l1.angle(l2)
l5.angle(l6)


