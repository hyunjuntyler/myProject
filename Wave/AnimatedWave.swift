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

                .animation(.linear(duration: 0.8).repeatForever(autoreverses: false), value: animated)
                            .onAppear {
                                animated = true
                            }
            
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
        
struct Wave: Shape {
    
    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }

    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        
        let waveHeight = 0.02 * rect.height
        let yOffset = CGFloat(1 - percent) * (rect.height)
        
        let startAngle = offset
        let endAngle = offset + Angle(degrees:360)
        
        p.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 2) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
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
