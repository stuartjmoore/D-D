//
//  Helpers.swift
//  D&D
//
//  Created by Moore, Stuart on 2/13/15.
//  Copyright (c) 2015 Stuart Moore. All rights reserved.
//

import Foundation

// TODO: Well this doesn’t make sense…
func roundup(a: Int) -> Int {
    return Int(ceil(Float(a)))
}

func rounddown(a: Int) -> Int {
    return Int(floor(Float(a)))
}

func random(range: Range<Int>) -> Int {
    return Int(arc4random_uniform(UInt32(range.endIndex - range.startIndex))) + range.startIndex
}
