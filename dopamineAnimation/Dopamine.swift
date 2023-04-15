//
//  SwiftUIView.swift
//  
//
//  Created by hyunjun kim on 2023/04/10.
//

import SwiftUI

struct DopamineAnimation: View {
    
    @State private var goodThings = false
    @State private var stopper = true
    @State private var face = false
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                VStack {
                    Text("Good Things")
                    .foregroundColor(goodThings ? .yellow : .gray)
                    .animation(Animation.easeOut(duration: 1), value: goodThings)
                    Image(systemName: "brain.head.profile")
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .font(Font.system(.largeTitle))
                        .foregroundStyle(goodThings ? .yellow : .gray , .gray)
                        .animation(Animation.easeOut(duration: 1), value: goodThings)

                }
                .onTapGesture {
                    goodThings = true
                    stopper = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        face = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        stopper = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        face = false
                    }
                                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                        goodThings = false
                    }

                    
                }
                
                Image(systemName: "pills")
                    .font(Font.system(.title3))
                    .foregroundColor(Color.init(.systemGray))
                Image(systemName: "pills")
                    .font(Font.system(.title3))
                    .foregroundColor(.gray)

                Image(systemName: "pills")
                    .font(Font.system(.title3))
                    .foregroundColor(.gray)

                Image(systemName: "pills")
                    .font(Font.system(.title3))
                    .foregroundColor(.gray)

            }
            
            HStack {
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                        VStack{
                            Text("Dopamine")
                                .font(.title3)
                                .bold()
                            .foregroundColor(.yellow)
                            
                            Text("stopper")
                                .foregroundColor(goodThings ? .red : .clear)
                                .animation(Animation.easeOut(duration: 0.2).delay(4), value: !goodThings)
                        }
                    }
                }
                    HStack{
                        // between machine and smile
                        Circle()
                            .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(stopper ? .gray : .yellow)
                            .scaleEffect(stopper ? 1 : 1.2)
                            .animation(stopper ? .default : Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(0), value: stopper)
                        Circle()
                            .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(stopper ? .gray : .yellow)
                            .scaleEffect(stopper ? 1 : 1.2)
                            .animation(stopper ? .default : Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(0.3), value: stopper)
                        Circle()
                            .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(stopper ? .gray : .yellow)
                            .scaleEffect(stopper ? 1 : 1.2)
                            .animation(stopper ? .default : Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(0.6), value: stopper)
                        Circle()
                            .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(stopper ? .gray : .yellow)
                            .scaleEffect(stopper ? 1 : 1.2)
                            .animation(stopper ? .default : Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(0.9), value: stopper)
                    }


          
                ZStack{
                    Rectangle()
                        .frame(width: 50, height: 50, alignment: .bottom)
                        .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .foregroundColor(face ? .yellow : .gray)
                        .animation(Animation.easeInOut(duration: 1).delay(1.8), value: face)

                    
                    Image(systemName: "face.smiling")
                        .renderingMode(.template)
                        .foregroundStyle(.black, .clear)
                        .font(Font.system(.largeTitle))

                }
            }
        }
    }
}

struct DopamineAnimation_Previews: PreviewProvider {
    static var previews: some View {
        DopamineAnimation()
    }
}
