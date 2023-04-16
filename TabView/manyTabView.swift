import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group{
                Text("1")
                Text("2")
                Text("3")
                Text("4")
                Text("5")
                Text("6")
                Text("7")
                Text("8")
                Text("9")
                Text("10")
            }
            Group{
                Text("11")
                Text("12")
                Text("13")
                Text("14")
                Text("15")
                Text("16")
                Text("17")
                Text("18")
                Text("19")
                Text("20")
            }

        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode:.always))
    }
    
}
