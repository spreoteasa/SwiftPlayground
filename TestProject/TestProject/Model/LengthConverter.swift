//
//  LengthConverter.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 14.07.2022.
//

import Foundation

class LengthConverter{
    var length: Int = 0
    var initialLengthType: LengthType = .centimeter
    var finalLengthType: LengthType = .centimeter
    
    func compute() -> String {
        var lengthInCemtimeters = 0
        
        switch initialLengthType {
        case .centimeter:
            lengthInCemtimeters = self.length
        case .meter:
            lengthInCemtimeters = self.length * 100
        case .kilometer:
            lengthInCemtimeters = self.length * 1000
        }
        
        switch finalLengthType {
        case .centimeter:
            break
        case .meter:
            lengthInCemtimeters /= 100
        case .kilometer:
            lengthInCemtimeters /= 1000
        }
        
        
        return "\(lengthInCemtimeters) \(self.finalLengthType)"
    }
}
