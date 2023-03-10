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
  
        VStack() {
           
            GeometryReader { gp in
                
                HStack {
                        
                    VStack() {
                        ScrollView(.horizontal) {
                            HStack {
                                Image("1img")
                                    .resizable()
                                    .frame(maxWidth: .infinity,maxHeight: 210)
                                Image("2img")
                                    .resizable()
                                    .frame(maxWidth: .infinity,maxHeight: 210)
                                Image("3img")
                                    .resizable()
                                    .frame(maxWidth: .infinity,maxHeight: 210)
                            }
                            
                        }
                        
                            
                        Text("Hier haben wir euch ein paar Bilder zusammen gestellt\nwo wir denken wir haben vielleicht ihr Interesse wecken können.")
                            .padding(.top)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 18))
                                .fontWeight(.thin)
                                .foregroundColor(.white)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gp.frame(in: .global).width)
                        
                        VStack() {
                            // Bild2 einfügen
                            Image("morePicture")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight: 210)

                            Text("Das sind unsere Big Pictures\nund das wollen wir euch\nnatürlich nicht vorenthalten\nwollen")
                                .multilineTextAlignment(.center)
                                .fontWeight(.thin)
                                .font(.system(size: 18))

                                .padding()
                                .foregroundColor(.white)
                                .fixedSize(horizontal: true, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gp.frame(in: .global).width)
                        
                        
                        VStack() {
                            // Bild3 einfügen
                            GifImage("fullstuff")
                                           .frame(width: 200, height: 210)
                                           .opacity(0.9)
                                           .cornerRadius(100)
                            

                            Text("Vergessen Sie vor der Abreise\nnicht sich über die Länder spezifischen\n Gesundheitsrichtlinien zu erkunden und\n ihre vollständigen Pass und\n Gesundheitszeugnisse")
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
                    .foregroundColor(Color.red)
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
            
       

struct OnBoardingPageOne_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPageOne()
    }
}


