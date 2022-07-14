//
//  TemperatureConverter.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 14.07.2022.
//

import Foundation


class TemperatureConverter {
    var temperature: Double
    var initialType: TemperatureType
    
    init(){
        self.temperature = 0.0
        self.initialType = .celsius
    }
    
    func convert() -> String {
        //Celsius times 9 divided by 5 plus 32.
        
        var computedTemperature = 0.0
        var finalTemp: String
        
        switch initialType {
        case .celsius:
            computedTemperature = (self.temperature * 9) / 5 + 32
            finalTemp = TemperatureType.fahrenheit.rawValue
        case .fahrenheit:
            computedTemperature = ((self.temperature - 32) * 5) / 9
            finalTemp = TemperatureType.celsius.rawValue
        }
        
        
        return "\(computedTemperature) \(finalTemp)"
    }
}
