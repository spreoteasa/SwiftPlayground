//
//  Color.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 26.07.2022.
//

import Foundation
import AVFoundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var currentColor = Color.gray
    @Published var treeStructure: Tree
    @Published var chosenType: StripeType = .vertical
    @Published var isPresented = false
    @Published var currentIcon = ""
    @State var audioPlayer: AVAudioPlayer!
    var sound = true
    init(tree: Tree) {
        self.treeStructure = tree
    }
    
    func add(newNode: Node) {
        if self.treeStructure.rootWasPopulated {
            self.treeStructure.currentNode.children.insert(newNode, at: self.treeStructure.currentNode.children.count)
            self.treeStructure.lastAdded = newNode
            self.treeStructure.lastAdded.parent = self.treeStructure.currentNode
            self.objectWillChange.send()
        }
        else {
            self.treeStructure.root = newNode
            self.treeStructure.root.type = newNode.type
            self.treeStructure.lastAdded = self.treeStructure.root
            self.treeStructure.rootWasPopulated = true
            self.treeStructure.currentNode = self.treeStructure.root
            self.objectWillChange.send()
        }
        
        
    }
    
    func getWholeView() -> some View {
        return self.getNodeView(self.treeStructure.root)
    }
    
    @ViewBuilder
    func getNodeView(_ node: Node) -> some View {
        if node.children.count == 0 {
            switch node.type {
            case .horizontal:
                AnyView(
                    HStack(spacing: 0) {
                        ZStack {
                            node.value
                            Image(systemName: node.icon)
                                .opacity(0.3)
                        }.border(node.ID == treeStructure.currentNode.ID ? .black : .clear, width: 4)
                    })
            case .vertical:
                AnyView(
                    VStack(spacing: 0) {
                        ZStack {
                            node.value
                            Image(systemName: node.icon)
                                .opacity(0.3)
                        }.border(node.ID == treeStructure.currentNode.ID ? .black : .clear, width: 4)
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
    
    func playSounds(_ soundFileName : String) {
        if sound == false {             // Have a toggle to mute sound in app
            guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
                fatalError("Unable to find \(soundFileName) in bundle")
            }

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            } catch {
                print(error.localizedDescription)
            }
            audioPlayer.play()
        }
    }
    
    
}
