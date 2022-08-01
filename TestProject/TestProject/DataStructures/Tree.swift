//
//  Tree.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 27.07.2022.
//

import Foundation
import SwiftUI

//
//class Node {
//    var value: String = ""
//    var parent: Node? = nil
//    var children: [Node] = []
//
//    init(value: String) {
//        self.value = value
//    }
//}
//
//class Tree {
//    var root: Node
//    var currentNode: Node
//
//    init(root: Node) {
//        self.root = root
//        self.root.parent = nil
//        self.currentNode = root
//    }
//
//    func insert(node: Node) {
//        currentNode.children.insert(node, at: currentNode.children.count)
//    }
//
//    func goUp() {
//        guard self.currentNode.parent == nil else{
//            self.currentNode = self.currentNode.parent!
//            return
//        }
//        self.currentNode = root
//    }
//
//    func goDown() {
//        if self.currentNode.children.count != 0 {
//            self.currentNode = self.currentNode.children[0]
//        }
//    }
//
//}
//
//var root = Node(value: "VStack")
//
//var tree = Tree(root: root)
//var newNode = Node(value: "HStack")
//
//
//struct SomeView: View {
//    var root = Node(value: "VStack")
//
//    var tree:Tree
//    var newNode = Node(value: "HStack")
//    var array = ["HStack","HStack","VStack","VStack","HStack"].shuffled()
//    var body: some View {
//        VStack{
//            ForEach((0..<array.count), id: \.self) {
//                if array[$0] == "HStack"{
//
//                    HStack {
//                        Color.blue
//                        Color.mint
//                        Color.green
//                        Color.cyan
//                    }
//                }
//                else {
//                    VStack {
//                        Color.yellow
//                        Color.red
//                        Color.pink
//                        Color.brown
//                    }
//                }
//            }
//            Button("dada") {
//                print("ksfjngs")
//            }
//        }
//    }
//
//    init() {
//
//        self.tree = Tree(root: self.root)
//        tree.insert(node: newNode)
//        print(tree)
//    }
//}

struct TreeView: View {
    var body: some View {
        ZStack {
            
        }
    }
}

class Node {
    var ID = UUID()
    var value: AnyView
    weak var parent: Node?
    var children: [Node] = []
    
    init(value: AnyView, parent: Node?) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: Node) {
        self.children.append(child)
    }
    
    func getView() -> some View {
        ForEach(children, id:\.ID) {child in
            child.value
        }
    }
}

class Tree {
    var root: Node
    var currentNode: Node
    var lastAdded: Node
    
    init(root: Node) {
        self.root = root
        self.currentNode = self.root
        self.lastAdded = self.root
    }
    
    func add(newNode: Node) {
        self.currentNode.children.insert(newNode, at: currentNode.children.count)
        self.lastAdded = newNode
        self.lastAdded.parent = currentNode
    }
    func getView() -> some View {
        print("Aicea")
        return ForEach(root.children, id:\.ID) {child in
            child.value
            child.getView()
        }
    }
    
    func commitSection() {
        self.currentNode = self.lastAdded
        print("Went down")
    }
}


struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        TreeView()
    }
}
