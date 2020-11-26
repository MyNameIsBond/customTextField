

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
//            LinearGradient(gradient: Gradient(colors: [.green, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack {
                Text("Custom View Modifier")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                HStack {
                    TextField("Search...", text: $text).modifier(customViewModifier())
                }
            }
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
            .padding()
    }
}

struct customViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
            
            .font(.custom("Open Sans", size: 18))
            .foregroundColor(Color.green)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
