//
//  Stripes.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 01.08.2022.
//

import Foundation
import SwiftUI
enum StripeType {
    case horizontal
    case vertical
}

struct SimpleStripe: View {
    var color = Color.red
    var body: some View {
        color
    }
}

struct StackStripe: View {
    var stripe: SimpleStripe
    var type: StripeType = .horizontal
    
    var body: some View {
        switch self.type{
        case .horizontal:
            HStack {
                stripe
            }
        case .vertical:
            VStack {
                stripe
            }
        }
    }
}
