//
//  main.swift
//  roulette
//
//  Created by 김현준 on 2023/03/28.
//
import SwiftUI

struct mainView: View {
    @State var tag:Int? = nil
    
    var body: some View {
        
        ZStack{
            NavigationLink(destination: ContentView(), tag: 2, selection: self.$tag ) {
                EmptyView()
            }
            
            Button( action : {
                self.tag = 2
            }) {
                Text("Button")
            }
        }
    }
}

//landscapeView
struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView().previewInterfaceOrientation(.landscapeRight)
    }
}
