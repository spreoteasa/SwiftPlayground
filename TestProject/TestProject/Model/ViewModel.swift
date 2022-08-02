//
//  Color.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 26.07.2022.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var currentColor = Color.gray
    @Published var treeStructure: Tree
    @Published var chosenType: StripeType = .horizontal
    @Published var isPresented = false
    @Published var currentIcon = ""
    
    init(tree: Tree) {
        self.treeStructure = tree
    }
    
    func getWholeView() -> some View {
        self.treeStructure.getView()
    }
}
