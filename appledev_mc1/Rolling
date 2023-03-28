//
//  Rolling.swift
//  roulette
//
//  Created by hyunjun kim on 2023/03/27.
//
import SwiftUI

struct Rolling: View {
    
    var font: Font = .largeTitle
    
    //emoji Binding 선언
    @Binding var emoji : Array<String>
    
    //animate 하기위한 변수선언
    @Binding var animate : Bool
    
    var body: some View {
        HStack(spacing:0) {
            //텍스트를 넣어서 .clipped 하기 위함
            Text("0")
                .padding()
                .font(font)
                .opacity(0)
                .overlay {
                    // GeometryReader로 단독적인 레이어 생성
                    GeometryReader { proxy in
                        let size = proxy.size
                        // emoji stack 하여 배열 아래로 출력
                        VStack(spacing:0){
                            ForEach(emoji, id: \.self) { i in
                                Text(i)
                                    .font(font)
                                    .frame(width: size.width, height: size.height, alignment: .center)
                            }
                        }
                        // 어떻게 배열을 위로 올리는지 offset 설정
                        .offset(y: animate ? -8 * size.height : 0)
                        // 애니메이션 세부 설정
                        .animation(.spring(response: .random(in: 1...4),dampingFraction: 0.7, blendDuration: 0.3), value: animate)
                            }
                        }
                    }
        // 0 텍스트 크기에 맞춰서 잘라버리기
        .clipped()

                }
            
        }


//landscapeView
struct Rolling_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
