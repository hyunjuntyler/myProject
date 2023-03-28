import SwiftUI

struct ContentView: View {
    @State var animate : Bool = false
    @State var tag:Int? = nil
    
    
    //이모지를 넣어주세요 마지막값을 목표값으로 넣어주세요
    @State var emoji1 : [String] = ["😒", "😕", "😗", "😙", "💪", "😌", "🍎", "🌼", "🤓"]
    @State var emoji2 = ["😨", "🤭", "😲", "😆", "🥳", "🤩", "🥳", "😶‍🌫️", "😈"]
    @State var emoji3 = ["😰", "🤔", "🤓", "😎", "😔", "😇", "🐤", "🤗", "🤭"]
    @State var emoji4 = ["👻", "😟", "😲", "😆", "🤩", "😅", "🫥", "😉", "⭐️"]
    @State var emoji5 = ["😳", "🥶", "🤩", "😄", "😁", "🥳", "👻", "👾", "😋"]
    @State var emoji6 = ["🤩", "🧐", "🌪️", "🍔", "🎂", "🍻", "😆", "😉", "🔥"]
    
    var body: some View {
        VStack {
            Spacer()
            Text("ACT")
            //Rolling을 넣어준다
            HStack {
                Rolling(font: .system(size: 70), emoji: $emoji1, animate: $animate)
                Rolling(font: .system(size: 70), emoji: $emoji2, animate: $animate)
                Rolling(font: .system(size: 70), emoji: $emoji3, animate: $animate)
                Rolling(font: .system(size: 70), emoji: $emoji4, animate: $animate)
                Rolling(font: .system(size: 70), emoji: $emoji5, animate: $animate)
                Rolling(font: .system(size: 70), emoji: $emoji6, animate: $animate)
            }
            Spacer()
            // 버튼
            HStack{
                ZStack{
                        NavigationLink(destination: mainView(), tag: 1, selection: self.$tag ) {
                          EmptyView()
                        }
                      
                      Button( action : {
                        self.tag = 1
                      }) {
                        Text("back")
                    }
                        .padding()
                        .foregroundColor(Color(.white))
                        .background(Color(.black))
                        .clipShape(Capsule())
                        
                    }
                    
                    
                    Spacer()
                    Button("Button"){
                        animate.toggle()
                    }
                    .padding()
                    .foregroundColor(Color(.white))
                    .background(Color(.black))
                    .clipShape(Capsule())
                    Spacer()
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
