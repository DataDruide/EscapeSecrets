
import SwiftUI
import Foundation

struct LoginView: View {
    
    @EnvironmentObject var authService: AuthService
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            
            Image("studentonroad")
                .resizable()
                .scaledToFill()
                .overlay(Rectangle())
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.black.opacity(0.65))
                .contrast(0.7)
                .offset(x: -70)
                .opacity(01.05)

            
            VStack{
                var isButtonEnabled = !email.isEmpty && !password.isEmpty
                
                Spacer()
                
                Text("Login")
                    .font(.system(size: 44, weight: .semibold))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                Spacer()
                
                TextField("Email", text: $email)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .frame(width: 370, height: 45)
                    .background(Color.black.opacity(0.23))
                    .cornerRadius(12)
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.yellow, lineWidth: 1)
                    )
                    .onAppear {
                        UITextField.appearance().tintColor = .white
                    }
                
                SecureField("Password", text: $password)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .frame(width: 370, height: 45)
                    .background(Color.black.opacity(0.23))
                    .cornerRadius(12)
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.yellow, lineWidth: 1)
                    )
                    .onAppear {
                        UITextField.appearance().tintColor = .white
                    }
                    .padding()
                // Register button
                Button(action: {
                    authService.signUp(email: email, password: password)
                }, label: {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(
                                    Color(
                                        red: 255 / 255,
                                        green: 115 / 255,
                                        blue: 115 / 255
                                    )
                                )
                        )
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)                })
                .disabled(!isButtonEnabled)
                
                // Login button
                Button(action: {
                    authService.signIn(email: email, password: password)
                }, label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(
                                    Color(
                                        red: 75 / 255,
                                        green: 115 / 255,
                                        blue: 115 / 255
                                    )
                                )
                        )
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)                })
                .disabled(!isButtonEnabled)
                
                Spacer(minLength: 150)
                
                Text("forget your Password")
                    .foregroundColor(.white)
            }
        }.background(Color.black)
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
