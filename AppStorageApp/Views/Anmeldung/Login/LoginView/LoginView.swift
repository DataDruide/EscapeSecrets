import SwiftUI
import Foundation

struct LoginView: View {
    @EnvironmentObject var authService: AuthService // Hier machen wir wieder den AuthService für uns zugänglich
    
    // Variablen zum Speichern von Email und Passwort
    @State var email: String = "" // Email input state
    @State var password: String = "" // Password input state
    
    var body: some View {
        // ZStack verwenden wir um der View ein Hintergrundbild zu verleihen
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
            
            VStack {
                Text("Urlaub....")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                    .padding(.top, 50)
                Text("machts schöner")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                Spacer()
                
                Text("Login")
                    .font(.system(size: 44, weight: .semibold))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                Spacer()
                // Zweiwegebindung wird hergestellt sogenanntes Binding
                TextField("Email", text: $email)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .frame(width: 370, height: 45)
                    .background(Color.black.opacity(0.23))
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .onAppear {
                        UITextField.appearance().tintColor = .white
                    }
                
                SecureField("Password", text: $password)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .frame(width: 370, height: 45)
                    .background(Color.black.opacity(0.23))
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .onAppear {
                        UITextField.appearance().tintColor = .white
                    } // visuelle Anpassungen vorzunehmen indem Fall soll in den Textfeldern die Schriftfarbe verwendet werdet
                    .padding()
                
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
                                        red: 75 / 255,
                                        green: 115 / 255,
                                        blue: 115 / 255
                                    )
                                )
                        )
                        .blur(radius: 0.5) // Unschärfeeffekt
                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                })
                .disabled(email.isEmpty || password.isEmpty) // Durch das Deaktivieren des Buttons wird erreicht, dass der Benutzer den Button nicht klicken kann, solange entweder das E-Mail-Feld oder das Passwort-Feld leer ist. Dies dient der Validierung der Eingabe und verhindert, dass der Benutzer eine Aktion ausführt, wenn wichtige Informationen fehlen.
                
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
                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                })
                
                Spacer(minLength: 150)
            }
        }
        .background(Color.black)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
