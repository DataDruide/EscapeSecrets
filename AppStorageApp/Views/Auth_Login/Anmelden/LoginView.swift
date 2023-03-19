import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authService: AuthService
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Image("willcomebild")
                .ignoresSafeArea()
            
            var isButtonEnabled = !email.isEmpty && !password.isEmpty
            
            VStack{
                Image("mountain")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .opacity(0.7)
                    .padding(.top, 35)
                    .cornerRadius(110)

                Text("Create a Account")
                    .font(.system(size: 44, weight: .semibold))                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Spacer()

                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .frame(width: 370, height: 45)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(8)
                   
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .onAppear {
                        UITextField.appearance().tintColor = .white // Hier wird die Farbe des Cursors gesetzt
                    }
                    
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 45)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(8)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .onAppear {
                        UITextField.appearance().tintColor = .white // Hier wird die Farbe des Cursors gesetzt
                    }
                // Register button
                Button(action: {
                    authService.signUp(email: email, password: password)
                }, label: {
                    Text("Register")
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundColor(.orange)
                        .bold()
                        .frame(maxWidth: 300)
                        .frame(height: 60)
                        .padding()
                        .padding(.bottom)
                        .cornerRadius(25)
                })
                .disabled(!isButtonEnabled)
                
                // Login button
                Button(action: {
                    authService.signIn(email: email, password: password)
                }, label: {
                    Text("Login")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .frame(height: 60)
                        .padding(.top)
                })
                .disabled(!isButtonEnabled)

                Spacer(minLength: 50)
                
                Text("forget your Password")
            }
            .padding(.horizontal)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
