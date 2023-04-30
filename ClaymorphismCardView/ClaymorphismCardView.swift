import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {           
            VStack {
                Text("Claymorphism CardView")
                    .frame(width: 300, height: 200)
                    .background(
                        /// continuous 스타일로 둥근모서리 만들기
                        RoundedRectangle(cornerRadius: 60, style: .continuous)
                            .fill(
                                /// inner Shadow
                                .shadow(.inner(color: Color(.systemGray5), radius: 5, x:2, y: 2))
                                .shadow(.inner(color: Color(.systemGray), radius: 10, x: -5, y: -5))
                            )
                            /// 카드뷰 배경
                            .foregroundColor(Color(.systemGray6))
                            /// 전체 shadow 걸어주기
                            .shadow(color: Color(.systemGray4), radius: 10, x: 10, y: 10))
            }
        }
    }
}
