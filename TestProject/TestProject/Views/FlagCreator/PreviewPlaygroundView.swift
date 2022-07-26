////
////  PreviewPlaygroundView.swift
////  TestProject
////
////  Created by Preoteasa Ioan-Silviu on 26.07.2022.
////
//
//import SwiftUI
//
//class MyModel: ObservableObject {
//    @Published var anytext = Color.green
//}
//
//
//
//struct PreviewPlaygroundView: View {
//    var someViews:[Any] = [HStack{}, VStack{VStack{HStack{}}}]
//    @StateObject private var model = MyModel()
//    var body: some View {
//        TestingSmthView().environmentObject(model)
////        Button("Add VSTack"){
////            addViews(view: VStack())
////        }
////        Button("Add HStack") {
////            addViews(view: HStack<AnyView>( content: () -> AnyView))
////        }
//        ForEach(someViews) { stack in
//            ZStack{
//                stack
//            }
//        }
//    }
//    
//    mutating func addViews(view: AnyView) {
//        self.someViews.insert(view, at: someViews.count)
//    }
//}
//
//struct TestingSmthView: View {
//    @EnvironmentObject private var model: MyModel
//    var body: some View{
//        VStack{
//            ColorPicker("Write text", selection: $model.anytext)
//            TestingSmthInTheRectangle()
//        }
//    }
//}
//
//struct TestingSmthInTheRectangle: View {
//    @EnvironmentObject private var model: MyModel
//    var body: some View {
//        Text("ce ai fratelli")
//            .foregroundColor(model.anytext)
//    }
//}
//
//
//struct PreviewPlaygroundView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewPlaygroundView()
//    }
//}
