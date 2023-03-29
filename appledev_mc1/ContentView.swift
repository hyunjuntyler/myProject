import SwiftUI

struct ContentView: View {
    @State var animate : Bool = false
    @State var tag:Int? = nil
    @State var tap1 = false
    @State var tap2 = false
    @State private var animated = false
    @State var w : CGFloat = 950
    @State var h : CGFloat = 420
    @State var d : CGFloat = 3
    
    //이모지를 넣어주세요 마지막값을 목표값으로 넣어주세요
    @State var emoji1 = ["🥹", "😕", "😗", "😙", "💪", "😌", "🍎", "🌼", "😕"]
    @State var emoji2 = ["😨", "🤭", "😲", "😆", "🥳", "🤩", "🥳", "😶‍🌫️", "🤭"]
    @State var emoji3 = ["😰", "🤔", "🤓", "😎", "😔", "😇", "🐤", "🤗", "🤔"]
    @State var emoji4 = ["👻", "😟", "😲", "😆", "🤩", "😅", "🫥", "😉", "😟"]
    @State var emoji5 = ["😳", "🥶", "🤩", "😄", "😁", "🥳", "👻", "👾", "🥶"]
    @State var emoji6 = ["🤩", "🧐", "🌪️", "🍔", "🎂", "🍻", "😆", "😉", "🧐"]
    
    var body: some View {
        // navigationView
        ZStack{
            ZStack {
                Image("island").opacity(0.6).offset(y:10)
                ZStack{
                    Image("cloud1").offset(x: animated ? 400 : -500, y: -100).animation(.linear(duration: 60).repeatForever(autoreverses: false), value: animated).opacity(0.6)
                    Image("cloud2").offset(x: animated ? -100 : -1000, y: -70).animation(.linear(duration: 60).repeatForever(autoreverses: false), value: animated).opacity(0.6)
                    Image("cloud3").offset(x: animated ? 200 : -700, y: -140).animation(.linear(duration: 60).repeatForever(autoreverses: false), value: animated).opacity(0.6)
                    Image("cloud1").offset(x: animated ? 800 : -100, y: -80).animation(.linear(duration: 80).repeatForever(autoreverses: false), value: animated).opacity(0.6)
                    Image("cloud2").offset(x: animated ? 700 : 120, y: -110).animation(.linear(duration: 60).repeatForever(autoreverses: false), value: animated).opacity(0.6)
                    Image("cloud3").offset(x: animated ? 900 : 250, y: -100).animation(.linear(duration: 60).repeatForever(autoreverses: false), value: animated).opacity(0.6)

                    
                }
                Rectangle()
                    .fill(Color(red: 189/255, green: 224/255, blue: 254/255))
                    .opacity(0)
                    .frame(width: w, height: h)
                Wave(offset: Angle(degrees: animated ? 360 : 0), percent: 0.3)
                    .fill(Color(red: 40/255, green: 160/255, blue: 207/255, opacity: 0.4))
                    .frame(width: w, height: h)
                    .animation(.linear(duration: d-0.2).repeatForever(autoreverses: false), value: animated)
                    .onAppear {
                        DispatchQueue.main.async {
                            animated = true
                        }
                    }
                
                Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.3)
                    .fill(Color(red: 220/255, green: 230/255, blue: 236/255, opacity: 0.4))
                    .opacity(0.5)
                    .frame(width: w, height: h)
                    .animation(.linear(duration: d-0.6).repeatForever(autoreverses: false), value: animated)
                Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.3)
                    .fill(Color(red: 80/255, green: 200/255, blue: 206/255, opacity: 0.4))
                    .opacity(0.5)
                    .frame(width: w, height: h)
                    .animation(.linear(duration: d-0.8).repeatForever(autoreverses: false), value: animated)
                
                Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.3)
                    .fill(Color(red: 0/255, green: 230/255, blue: 200/225, opacity: 0.4))
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
                            .padding(11.3)
                            .offset(x:20, y:-5)
                    }
                    
                }
                
                HStack {
                    Text("Claire")
                        .frame(width:70)
                        .padding(21)
                    Text("Helia")
                        .frame(width:70)
                        .padding(21)
                    Text("Tyler")
                        .frame(width:70)
                        .padding(21)
                    Text("Rash")
                        .frame(width:70)
                        .padding(21)
                    Text("Goggins")
                        .frame(width:70)
                        .padding(21)
                    Text("Zett")
                        .frame(width:70)
                        .padding(21)
                }
                .offset(x:20, y:+55)
                    .font(.system(size:18))
                
                
                VStack {
                    Text("First Meeting")
                        .bold()
                        .font(.system(size: 45))
                        .offset(x:20, y:40)
                        .shadow(color:.white, radius: 20)
                    //Rolling을 넣어준다
                    HStack {
                        Rolling(font: .system(size: 80), emoji: $emoji1, animate: $animate).padding()
                        Rolling(font: .system(size: 80), emoji: $emoji2, animate: $animate).padding()
                        Rolling(font: .system(size: 80), emoji: $emoji3, animate: $animate).padding()
                        Rolling(font: .system(size: 80), emoji: $emoji4, animate: $animate).padding()
                        Rolling(font: .system(size: 80), emoji: $emoji5, animate: $animate).padding()
                        Rolling(font: .system(size: 80), emoji: $emoji6, animate: $animate).padding()
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
                    .offset(x:19)
                    // 버튼
                    HStack{
//                        NavigationView{
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
                                .offset(x:-190)
                                
                            }.navigationBarHidden(true)
                            
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
                            .background(Color(.gray))
                            .clipShape(RoundedRectangle(cornerRadius: 17.0))
                            .padding()
                            .scaleEffect(tap2 ? 1.05 : 1)
                            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: tap2)
                            .shadow(color: .red.opacity(tap2 ? 0.8 : 0.5), radius: tap2 ? 5 : 3, x: 0, y: tap2 ? 4 : 6)
                            .offset(x: -40)
                        }
//                    }
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
