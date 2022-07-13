//
//  Bill.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 13.07.2022.
//

import Foundation

class Bill{
    private var price: Double
    private var people: Int
    private var ciubuc: Double
    
    init(price: Double, people: Int, ciubuc: Double){
        self.price = price
        self.people = people
        self.ciubuc = ciubuc
    }
    
    convenience init(){
        self.init(price:0,people:1,ciubuc:0)
      
    }
    
    func computeWithCiubuc() -> Double{
        return price + (ciubuc/100 * price)
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
    
    func setPeople(newP: Int){
        self.people = newP
    }
    
    func setPrice(newP: Double){
        self.price = newP
    }
    
    func setCiubuc(newC: Double){
        self.ciubuc = newC
    }
    
    func splitBill() -> Double{
        return computeWithCiubuc() / Double(self.people)
    }
}
