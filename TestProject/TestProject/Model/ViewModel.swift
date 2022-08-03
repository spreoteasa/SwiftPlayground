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
    
    func getWholeView() -> some View {
        self.playSounds("Imnul Romaniei (Romanian Anthem).mp3")
        return self.getNodeView(self.treeStructure.root)
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
