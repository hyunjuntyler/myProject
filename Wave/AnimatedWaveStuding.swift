import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        ZStack {
                HStack {
                    AnimatedWave()
                    }
                
            }
        }
    }


struct AnimatedWave: View {
    @State private var animated = false
    var w : CGFloat = 900
    var h : CGFloat = 500
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 254/255, green: 251/255, blue: 224/255))
                .frame(width: w, height: h)
            Wave(offset: Angle(degrees: animated ? 360 : 0), percent: 0.66)
                .fill(Color(red: 255/255, green: 175/255, blue: 204/255, opacity: 0.3))
                .frame(width: w, height: h)
            // animation
            // 생각할것 : sin 그래프를 여러개 겹칠수 없을까
                .animation(.linear(duration: 0.8).repeatForever(autoreverses: false), value: animated)
            //이 친구들은 필요함 뷰가 나타날때 animated를 true로 한다? 이건 진짜 모르겠다.
                            .onAppear {
                                animated = true
                            }
            //162, 210, 255
            //이것까지 없어도 되는데...
//                            .onDisappear {
//                                animated = false
//                            }
            
            Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.3)
                .fill(Color(red: 162/255, green: 210/255, blue: 1, opacity: 0.5))
                .opacity(0.2)
                .frame(width: w, height: h)
                .animation(.linear(duration: 0.7).repeatForever(autoreverses: false), value: animated)
            
            Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.33)
                .fill(Color(red: 162/255, green: 210/255, blue: 1, opacity: 0.5))
                .opacity(0.5)
                .frame(width: w, height: h)
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: animated)
            Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.33)
                .fill(Color(red: 33/255, green: 158/255, blue: 1, opacity: 0.5))
                .opacity(0.5)
                .frame(width: w, height: h)
                .animation(.linear(duration: 0.7).repeatForever(autoreverses: false), value: animated)
            
            Wave(offset: Angle(degrees: animated ? -180 : 180), percent: 0.66)
                .fill(Color(red: 255/255, green: 200/255, blue: 221/225, opacity: 0.5))
                .opacity(0.5)
                .frame(width: w, height: h)
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: animated)
        }
        
        // 이 친구들의 역할이 뭐지?
        //        .onAppear {
        //            animated = true
        //        }
        //        .onDisappear {
        //            animated = false
        //        }
    }
}

struct Wave: Shape {
    
    // 변수 선언
    var offset: Angle
    var percent: Double
    
    // get, set 사용 get으로 각도를 받고 Angle로 내보냄 Angle로 부를 수 있음
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }
    
    // path 함수 선언 CGRect : 좌표와 크기를 모두 포함하고 있는 사각형 변수
    // Path는 그림을 그릴 수 있는 패키지 (정말 자유롭게 그릴 수 있음)
    func path(in rect: CGRect) -> Path {
        
        // p 가 Path() 함수가 되네요? 이게 뭐죠?
        var p = Path()
        
        // rect를 받으면 높이의 0.02가 wave 높이가 되는군요
        let waveHeight = 0.02 * rect.height
        // percent를 받으면 그것이 wave y좌표의 위치가 되겠군요!
        
        // 자 이 식은 뭘까요. waveHeight는 0.02 rect.height니까
        // 뒤에는 * 0.92 rect.height + 0.04 rect.height 가 되겠군요. 왜죠? - 지워도 되네요.
        let yOffset = CGFloat(1 - percent) * (rect.height)
        
        let startAngle = offset
        let endAngle = offset + Angle(degrees:360)
        
        //드디어 나오네요 이동이 y축으로 어쩌구 이동을 한다고 합니다. 사인값이네요. 이걸 왜 앞에 뒀을까요? for문이 있었네요
        p.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(sin(offset.radians))))
        
        // from, through...? stride?? zzzz
        // form 부터 through 까지 5씩 늘어나는 함수네요 그것이 angle에 들어가고
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 2) {
            // x 를 선언해주네요...? 그래서 x가 늘어나고 줄어드는 군요
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            
            // Path함수를 써주는 건데 왜이렇게 어렵게 만들까요 ~_~ 라고 햇지만 Path()를 붙여주니까
            // 바로 에러등장
            // 이것은 그려주는 것이군요! 함수를 그려주는 것입니다. 이것으로 나중에 네모를 그려도 좋겠군요
            p.addLine(to: CGPoint(x: x, y: yOffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()
        
        return p
    }
}

//landscapeView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
