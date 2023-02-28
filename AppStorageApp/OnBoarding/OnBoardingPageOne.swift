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
            //Background Color
            Color(.yellow).opacity(0.1)
                .ignoresSafeArea()
            
//            Rectangle()
//                .fill(Color(.yellow))
//                .scaleEffect(1.4)
//                .rotationEffect(.degrees(-15))
//                .offset(x: -100, y: 300)

            VStack(spacing: 30) {
                Text("Welcome to")
                    .font(.largeTitle)
                    .foregroundColor(Color(.brown))
                    .padding(.top)
                Text("your Work and Travel Adventure")
                    .font(.largeTitle).bold()
                    .foregroundColor(Color(.brown))
                    .multilineTextAlignment(.center)
                
                GeometryReader { gp in
                    HStack {
                        VStack(spacing: 40) {
                            // Bild 1 einfügen
                            Image("checkIn")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight: 210)
                            
                            Divider()


                            Text("Wenn Sie am Flughafen ankommen müssen\n Sie den CheckIn absolvieren,\n deshalb bitten wir Sie alle \n1,5 m Abstand zum nächsten Reisenden einzuhalten")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gp.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            // Bild2 einfügen
                            Image("wartehalle")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight: 210)

                            Divider()


                            Text("Nach der Zollabfertigung geht es dann\n in die Wartehalle wo sie\n nochmals die Möglichkeit besitzen\n sich kleine Snacks und Getränke zukaufen\n und auf ihren Flieger zu warten")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 18))

                                .padding()
                                .foregroundColor(.black)
                                .fixedSize(horizontal: true, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gp.frame(in: .global).width)
                        
                        
                        VStack(spacing: 40) {
                            // Bild3 einfügen
                            Image("abflug")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight: 210)
                            
                            Divider()


                            Text("Beim Abflug bitten wir Sie alle noch\n solange an ihrem Platz zu bleiben\n bis die Sitzlichter über \nihnen erloschen sind")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 18))                 .padding()
                                .foregroundColor(.black)
                                .fixedSize(horizontal: true, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gp.frame(in: .global).width)
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
                    .font(.title)
                    .frame(width: gp.frame(in: .global).width * 3)
                    
                    .frame(maxHeight: .infinity)
                    .offset(x: step == 1 ? 0 : step == 2 ? -gp.frame(in:.global).width : -gp.frame(in: .global).width * 2)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                  }
                
                HStack(spacing: 20) {
                    Button(action: { self.step = 1 }) {
                        Text("1")
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Circle().shadow(radius: 10))
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    
                    Button(action: { self.step = 2 }) {
                        Text("2")
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Circle().shadow(radius: 10))
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    
                    Button(action: { self.step = 3 }) {
                        Text("3")
                            .foregroundColor(Color.black)
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
                    .accentColor(Color.yellow)
                }
            }
       


