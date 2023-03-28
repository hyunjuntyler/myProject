import SwiftUI

struct ContentView: View {
    @State var animate : Bool = false
    @State var tag:Int? = nil
    @State var tap1 = false
    @State var tap2 = false
    @State private var animated = false
    @State var w : CGFloat = 860
    @State var h : CGFloat = 420
    @State var d : CGFloat = 2
    
    //이모지를 넣어주세요 마지막값을 목표값으로 넣어주세요
    @State var emoji1 : [String] = ["😒", "😕", "😗", "😙", "💪", "😌", "🍎", "🌼", "🤓"]
    @State var emoji2 = ["😨", "🤭", "😲", "😆", "🥳", "🤩", "🥳", "😶‍🌫️", "😈"]
    @State var emoji3 = ["😰", "🤔", "🤓", "😎", "😔", "😇", "🐤", "🤗", "🤭"]
    @State var emoji4 = ["👻", "😟", "😲", "😆", "🤩", "😅", "🫥", "😉", "⭐️"]
    @State var emoji5 = ["😳", "🥶", "🤩", "😄", "😁", "🥳", "👻", "👾", "😋"]
    @State var emoji6 = ["🤩", "🧐", "🌪️", "🍔", "🎂", "🍻", "😆", "😉", "🔥"]
    
    var body: some View {
        ZStack{
            ZStack {
                Rectangle()
                    .fill(Color(red: 189/255, green: 224/255, blue: 254/255))
                    .opacity(0.5)
                    .frame(width: w, height: h)
                Wave(offset: Angle(degrees: animated ? 360 : 0), percent: 0.66)
                    .fill(Color(red: 255/255, green: 200/255, blue: 201/255, opacity: 0.6))
                    .frame(width: w, height: h)
                
                    .animation(.linear(duration: d-0.2).repeatForever(autoreverses: false), value: animated)
                    .onAppear {
                        animated = true
                    }
                
                Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.66)
                    .fill(Color(red: 255/255, green: 175/255, blue: 204/255, opacity: 0.6))
                    .opacity(0.2)
                    .frame(width: w, height: h)
                    .animation(.linear(duration: d-0.4).repeatForever(autoreverses: animate), value: animated)
                
                Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.33)
                    .fill(Color(red: 254/255, green: 250/255, blue: 224/255, opacity: 0.5))
                    .opacity(0.5)
                    .frame(width: w, height: h)
                    .animation(.linear(duration: d-0.6).repeatForever(autoreverses: false), value: animated)
                Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.33)
                    .fill(Color(red: 221/255, green: 161/255, blue: 94/255, opacity: 0.5))
                    .opacity(0.5)
                    .frame(width: w, height: h)
                    .animation(.linear(duration: d-0.8).repeatForever(autoreverses: false), value: animated)
                
                Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.33)
                    .fill(Color(red: 188/255, green: 108/255, blue: 37/225, opacity: 0.5))
                    .opacity(0.5)
                    .frame(width: w, height: h)
                    .animation(.linear(duration: d-1).repeatForever(autoreverses: false), value: animated)
                
                HStack{
                    ForEach(1..<7, id:\.self){_ in
                        Rectangle()
                            .frame(width: 90, height: 90)
                            .opacity(0.5)
                            .cornerRadius(15)
                            .foregroundColor(self.animate ? Color(.systemGreen) : Color(.systemGray2))
                            .animation(.easeIn(duration: 1).delay(1), value: animate)
                            .padding(8)
                            .offset(y:+12)
                    }
                    
                }
                
                HStack {
                    Text("Claire")
                        .frame(width:70)
                        .padding(18)
                    Text("Helia")
                        .frame(width:70)
                        .padding(18)
                    Text("Tyler")
                        .frame(width:70)
                        .padding(18)
                    Text("Rash")
                        .frame(width:70)
                        .padding(18)
                    Text("Goggins")
                        .frame(width:70)
                        .padding(18)
                    Text("Zett")
                        .frame(width:70)
                        .padding(18)
                }
                    .offset(y:+70)
                
                
                VStack {
                    Text("Event!?")
                        .bold()
                        .padding(.top, 42)
                        .font(.system(size: 40))
                    //Rolling을 넣어준다
                    HStack {
                        Rolling(font: .system(size: 70), emoji: $emoji1, animate: $animate).padding()
                        Rolling(font: .system(size: 70), emoji: $emoji2, animate: $animate).padding()
                        Rolling(font: .system(size: 70), emoji: $emoji3, animate: $animate).padding()
                        Rolling(font: .system(size: 70), emoji: $emoji4, animate: $animate).padding()
                        Rolling(font: .system(size: 70), emoji: $emoji5, animate: $animate).padding()
                        Rolling(font: .system(size: 70), emoji: $emoji6, animate: $animate).padding()
                    }
                    .mask(LinearGradient(
                                gradient: Gradient(stops: [
                                    Gradient.Stop(color: .clear, location: 0),
                                    Gradient.Stop(color: .black, location: 0.4),
                                    Gradient.Stop(color: .black, location: 0.6),
                                    Gradient.Stop(color: .clear, location: 1.0)]),
                                startPoint: .top,
                                endPoint: .bottom))
                    .padding()
                    // 버튼
                    HStack{
                        ZStack{
                            NavigationLink(destination: mainView(), tag: 1, selection: self.$tag ) {
                                EmptyView()
                            }
                            Button( action : {
                                self.tag = 1
                                tap1 = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    tap1 = false
                                }
                            }) {
                                Text("Back")
                            }
                            .font(.system(size: 24))
                            .padding()
                            .foregroundColor(Color(.white))
                            .background(Color(.black))
                            .clipShape(RoundedRectangle(cornerRadius: 17.0))
                            .padding()
                            .scaleEffect(tap1 ? 1.05 : 1)
                            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: tap1)
                            .shadow(color: .black.opacity(tap1 ? 0.5 : 0.2), radius: tap1 ? 5 : 3, x: 0, y: tap1 ? 4 : 6)
                            
                        }
                        
                        Button("What's on your mind"){
                            animate.toggle()
                            tap2 = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                tap2 = false
                            }
                        }
                        .font(.system(size: 24))
                        .padding()
                        .foregroundColor(Color(.white))
                        .background(Color(.systemRed))
                        .clipShape(RoundedRectangle(cornerRadius: 17.0))
                        .padding()
                        .scaleEffect(tap2 ? 1.05 : 1)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: tap2)
                        .shadow(color: .red.opacity(tap2 ? 0.8 : 0.5), radius: tap2 ? 5 : 3, x: 0, y: tap2 ? 4 : 6)
                    }
                }
            }
        }
    }
}
        
        
        //landscapeView
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView().previewInterfaceOrientation(.landscapeRight)
            }
        }

