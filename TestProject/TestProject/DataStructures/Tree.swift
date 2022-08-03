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
    var type: StripeType = .horizontal
    weak var parent: Node?
    var children: [Node] = []
    
    init(value: Color, parent: Node?,type: StripeType) {
        self.value = value
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
            self.lastAdded = root
            self.rootWasPopulated = true
            self.currentNode = root
        }
    }
    @ViewBuilder
    func getView() -> some View {
        getNodeView(root)
    }
    
    @ViewBuilder
    func getNodeView(_ node: Node) -> some View {
        if node.children.count == 0 {
            switch node.type {
            case .horizontal:
                AnyView(
                    HStack(spacing: 0) {
                        node.value
                    })
            case .vertical:
                AnyView(
                    VStack(spacing: 0) {
                        node.value
                    })
            }
            
        }
        else {
            switch node.type {
            case .horizontal:
                AnyView(
                    HStack(spacing: 0) {
                        ForEach(node.children, id:\.ID) { [self] child in
                            getNodeView(child)
                        }
                    })
            case .vertical:
                AnyView(
                    VStack(spacing: 0) {
                        ForEach(node.children, id:\.ID) { [self] child in
                            getNodeView(child)
                        }
                    })
            }
        }
    }
    
    func commitSection() {
        self.currentNode = self.lastAdded
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
