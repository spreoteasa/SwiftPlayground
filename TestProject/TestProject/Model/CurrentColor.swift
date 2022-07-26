//
//  Color.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 26.07.2022.
//

import Foundation
import SwiftUI

class CurrentColor : ObservableObject {
    @Published var currentColor = Color.green
    
    func set(newColor: Color) {
        self.currentColor = newColor
    }
}
