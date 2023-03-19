//
//  OnBoardingPageOne.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct OnBoardingPageOne: View {
    
    @AppStorage("onBoarding")  var onBoarding = true
    
    @State private var step = 1
    
    var body: some View {
        ZStack {
            Image("Background_gradient")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack() {
                
                GeometryReader { gp in
                    
                    HStack {
                        
                        VStack() {
                            
                            Image("passi")
                                .resizable()
                                .frame(maxWidth: 420,maxHeight: 410)
                            
                            Text("Denken Sie in der heutigen Zeit\ndaran sich rechtzeitig um\nihren Reisepass zu kümmern")
                                .padding(.top)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 18))
                                .fontWeight(.thin)
                                .foregroundColor(.white)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gp.frame(in: .global).width)
                        
                        VStack() {
                            // Bild2 einfügen
                            Image("bookingplane")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight: 410)
                            
                            Text("Hier bei uns können\nsie ganz entspannt ihre Reise\n und den dazugehörigen\n Auslandsjob buchen")
                                .multilineTextAlignment(.center)
                                .fontWeight(.thin)
                                .font(.system(size: 18))
                            
                                .padding()
                                .foregroundColor(.white)
                                .fixedSize(horizontal: true, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gp.frame(in: .global).width)
                        
                        
                        VStack() {
                            
                            Image("Destination")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight: 410)
                            
                            
                            Text("Vergessen Sie vor der Abreise\nnicht sich über die Länder spezifischen\n Gesundheitsrichtlinien zu erkunden")
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.white)
                                .fixedSize(horizontal: true, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gp.frame(in: .global).width)
                    }
                    .padding(.top)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .font(.title)
                    .frame(width: gp.frame(in: .global).width * 3)
                    
                    .frame(maxHeight: .infinity)
                    .offset(x: step == 1 ? 0 : step == 2 ? -gp.frame(in:.global).width : -gp.frame(in: .global).width * 2)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                }
                
                HStack(spacing: 20) {
                    Button(action: { self.step = 1 }) {
                        Text("1")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Circle().shadow(radius: 10))
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    
                    Button(action: { self.step = 2 }) {
                        Text("2")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Circle().shadow(radius: 10))
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    
                    Button(action: { self.step = 3 }) {
                        Text("3")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Circle().shadow(radius: 10))
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                Button(action: {
                    onBoarding = false
                }) {
                    Text("Continue")
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .padding()
                .background(Capsule())
                .opacity(step == 3 ? 1 : 0)
                .animation(.none)
                .scaleEffect(step == 3 ? 1 : 0.01)
                .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
                
            }
        }
        
    }
    
}

struct OnBoardingPageOne_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPageOne()
    }
}


