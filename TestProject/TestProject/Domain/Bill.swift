//
//  Bill.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 13.07.2022.
//

import Foundation

class Bill{
    private let price: Double
    private let people: Int
    private let ciubuc: Double
    
    init(price: Double, people: Int, ciubuc: Double){
        self.price = price
        self.people = people
        self.ciubuc = ciubuc
    }
    
    func computeWithCiubuc() -> Double{
        return price + (ciubuc * price)
    }
    
    func getCiubuc() -> Double{
        return ciubuc
    }
    
    func getPrice() -> Double{
        return price
    }
    
    func getPeople() -> Int{
        return people
    }
    
    func splitBill() -> some Numeric{
        return computeWithCiubuc() / Double(self.people)
    }
}
