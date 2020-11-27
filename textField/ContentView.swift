

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
                    .fontWeight(.bold)
                HStack {
                    
                    TextField("Search...", text: $text)
                    Image(systemName: "magnifyingglass").foregroundColor(.red)
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





struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                        .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))
            .padding()
            .shadow(radius: 10)
    }
}

extension TextField {
    
    func extensionTextFieldView(roundedCornes: CGFloat, startColor: Color,  endColor: Color) -> some View {
        self
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding()
            .shadow(color: .purple, radius: 10)
    }
}

extension View {
    func underlineTextField() -> some View {
        self
           .foregroundColor(Color.white)
           .padding(.leading, 16)
           .padding(.trailing, 16)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
