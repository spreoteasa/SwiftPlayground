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
    var value: AnyView
    var type: StripeType = .horizontal
    weak var parent: Node?
    var children: [Node] = []
    
    init(value: AnyView, parent: Node?,type: StripeType) {
        self.value = value
        self.parent = parent
        self.type = type
    }
    
    func add(child: Node) {
        self.children.append(child)
    }
    @ViewBuilder
    func getView() -> some View {
        if self.children.count == 0 {
            switch self.type {
            case .horizontal:
                AnyView(
                    HStack(spacing: 0) {
                        self.value
                    })
            case .vertical:
                AnyView(
                    VStack(spacing: 0) {
                        self.value
                    })
            }
            
        }
        else {
            switch self.type {
            case .horizontal:
                AnyView(
                    HStack(spacing: 0) {
                        ForEach(children, id:\.ID) { child in
                            child.getView()
                        }
                    })
            case .vertical:
                AnyView(
                    VStack(spacing: 0) {
                        ForEach(children, id:\.ID) { child in
                            child.getView()
                        }
                    })
            }
        }
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
            self.currentNode.value
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
        root.getView()
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
