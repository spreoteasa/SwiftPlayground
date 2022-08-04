//
//  Tree.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 27.07.2022.
//

import Foundation
import SwiftUI

struct TreeView: View {
    var body: some View {
        ZStack {
            
        }
    }
}

class Node {
    var ID = UUID()
    var value: Color = .red
    var icon: String = ""
    var type: StripeType = .horizontal
    weak var parent: Node?
    var children: [Node] = []
    
    init(value: Color, icon: String, parent: Node?, type: StripeType) {
        self.value = value
        self.icon = icon
        self.parent = parent
        self.type = type
    }
    
    func add(child: Node) {
        self.children.append(child)
    }
    
}

class Tree {
    var root: Node
    var currentNode: Node
    var lastAdded: Node
    var rootWasPopulated = false
    
    init(root: Node) {
        self.root = root
        self.currentNode = self.root
        self.lastAdded = self.root
    }
    func add(newNode: Node) {
        if rootWasPopulated {
            self.currentNode.children.insert(newNode, at: currentNode.children.count)
            self.lastAdded = newNode
            self.lastAdded.parent = currentNode
        }
        else {
            root = newNode
            root.type = newNode.type
            self.lastAdded = root
            self.rootWasPopulated = true
            self.currentNode = root
        }
        
        
    }
    func commitSection() {
        self.currentNode = self.lastAdded
        self.currentNode.ID = self.lastAdded.ID
        print("Went down")
    }
    func goUp() {
        if self.currentNode.ID != self.root.ID {
            self.currentNode = self.currentNode.parent!
        }
    }
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        TreeView()
    }
}
