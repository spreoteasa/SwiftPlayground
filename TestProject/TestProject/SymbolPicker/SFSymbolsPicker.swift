//
//  SFSymbolsPicker.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 02.08.2022.
//

import SwiftUI
import Foundation

struct SFSymbolsPicker: View {
    // MARK: - View properties
    @Environment(\.presentationMode) var presentationMode
    @Binding public var icon: String
    let category: Category = .nature

    var body: some View {
        ScrollView {
            LazyVStack {
                Button(action: {
                    self.icon = ""
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack{
                        Image(systemName: "empty")
                        Text("NO ICON")
                        Spacer()
                    }
                }
                ForEach(symbols[category.rawValue]!, id: \.self) { icon in
                    Button(action: {
                        self.icon = icon
//                        print(self.icon)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: icon)
                            Text(icon)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                    }
                }
            }
        }
        
    }
}
    
    
    
    
//    struct SFSymbolsPicker_Previews: PreviewProvider {
//        static var previews: some View {
//            SFSymbolsPicker(isPresented: .constant(true), icon: .constant(""), category: .commerce, axis: .horizontal)
//        }
//    }
