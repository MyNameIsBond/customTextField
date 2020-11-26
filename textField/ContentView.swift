

// DefaultTextFieldStyle
// PlainTextFieldStyle
// RoundedBorderTextFieldStyle

// only for macOS
// SquareBorderTextFieldStyle


import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var title = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack {
                Text("Custom TextFieldStyle()")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                HStack {
                    TextField("Search...", text: $text).textFieldStyle(CustomTextFieldStyle())
                }
            }
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
            .padding()
    }
}

struct tl : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Open Sans", size: 18))
            .foregroundColor(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
