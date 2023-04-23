import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Rounding Corners")
                .frame(width: 180, height: 70)
                .foregroundColor(Color.white)
                .background(Color.black)
                .roundingCorner(20, corners : [.topLeft, .topRight])
                .padding()
            Text("Rounding Corners")
                .frame(width: 180, height: 70)
                .foregroundColor(Color.white)
                .background(Color.black)
                .roundingCorner(20, corners : [.topLeft, .bottomRight])
                .padding()
            Text("Rounding Corners")
                .frame(width: 180, height: 70)
                .foregroundColor(Color.white)
                .background(Color.black)
                .roundingCorner(20, corners : [.bottomLeft, .bottomRight])
                .padding()
        }
    }
}

extension View {
    func roundingCorner(_ radius : CGFloat, corners : UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner : Shape {
    var radius : CGFloat
    var corners : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
