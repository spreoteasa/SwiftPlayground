//
//  TimeConverter.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 14.07.2022.
//

import Foundation

class TimeConverter{
    var timeValue: Int = 0
    var initialState: TimeTypes = .second
    var finalState: TimeTypes = .second
    
    init(timeValue: Int, initialState: TimeTypes, finalState: TimeTypes){
        self.timeValue = timeValue
        self.initialState = initialState
        self.finalState = finalState
    }
    
    convenience init(){
        self.init(timeValue: 1,initialState: TimeTypes.minute,finalState: TimeTypes.minute)
    }
    
    func convert() -> String{
        var timeInSeconds = 0
        switch initialState{
            case .hour:
                timeInSeconds = self.timeValue * 3600
        case .minute:
            timeInSeconds = self.timeValue * 60
        case .second:
            timeInSeconds = self.timeValue
        }
        print(timeInSeconds)
        
        switch finalState{
        case .hour:
            timeInSeconds /= 3600
    case .minute:
        timeInSeconds /= 60
    case .second:
        break
        }
        
        return "\(timeInSeconds) \(self.finalState) "
    }
}
