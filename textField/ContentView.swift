

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
//            Color.white.ignoresSafeArea()
            Color.background.ignoresSafeArea()
            
//            VStack(alignment: .leading) {
//                Text("Custom Struct")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.neumorphictextColor)
//                NeumorphicStyleTextField(textField: TextField("Search...", text: $text), imageName: "magnifyingglass")
//            }.padding(30)
            
            HStack {
                NeumorphicStyleTextField(textField: TextField("Search...", text: $text), imageName: "magnifyingglass")
            }.padding()
            
            
           
            
            
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

// Custom ViewModifier
// use .modifier(.customViewModifier(:attributes:))

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

// Custom TextField modifier
// usage TextField.extensionTextFieldView(:attributes:)

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

// Custom View modifier

//VStack {
//    HStack {
//        TextField("example@gmail.com", text: $text)
//        Image(systemName: "person.fill").font(.title2)
//    }.underlineTextField()
//    HStack {
//        TextField("password", text: $text)
//        Image(systemName: "key.fill").font(.title2)
//    }.underlineTextField()
//}.padding()

extension Color {
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.darkPink)
            .padding(10)
    }
}




// Neumorphic TextField Style

extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let neumorphictextColor = Color(red: 132 / 255, green: 132 / 255, blue: 132 / 255)
}

struct NeumorphicStyleTextField: View {
    var textField: TextField<Text>
    var imageName: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.darkShadow)
            textField
            }
            .padding()
            .foregroundColor(.neumorphictextColor)
            .background(Color.background)
            .cornerRadius(6)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
            
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
