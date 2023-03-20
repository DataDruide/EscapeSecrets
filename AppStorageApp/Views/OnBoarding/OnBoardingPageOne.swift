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
                .opacity(1.0)
            
            VStack() {
                
                GeometryReader { gp in
                    
                    HStack {
                        
                        VStack() {
                            Image("pliii")
                                .resizable()
                                .frame(maxWidth: 500,maxHeight: 410)
                                .cornerRadius(205)
                                .opacity(0.5)
                            
                            Text("Plan your Trip")
                                .padding(.top)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 34))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                            
                            
                            Text("Plan your trip without the hustle and\n bustle of wherever you are online")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 16))
                                .fontWeight(.thin)
                                .foregroundColor(.black)
                            
                        }.frame(width: gp.frame(in: .global).width)
                        
                        VStack() {
                            Image("perfect2")
                                .resizable()
                                .frame(maxWidth: 500,maxHeight: 410)
                                .cornerRadius(205)
                                .opacity(0.5)
                            
                            Text("Book your Flight")
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                                .font(.system(size: 34))
                                .foregroundColor(.black)
                            Text("There are already several complete\noffers available for you")
                                .multilineTextAlignment(.center)
                                .fontWeight(.thin)
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            
                                .padding()
                                .foregroundColor(.white)
                                .fixedSize(horizontal: true, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gp.frame(in: .global).width)
                        
                        
                        VStack() {
                            
                            Image("perfect3")
                                .resizable()
                                .frame(maxWidth: 500,maxHeight: 410)
                                .cornerRadius(205)
                                .opacity(0.5)
                            
                            Text("Enjoy Travel")
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                                .font(.system(size: 34))
                                .foregroundColor(.black)

                            Text("Enjoy your holiday without any problems and\n should still be something Contact us\n via the app or one\n of our service hotlines")
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.black)
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
                    .background(Color.purple).opacity(0.45)
                    .cornerRadius(10)
                   
                    
                    Button(action: { self.step = 2 }) {
                        Text("2")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Circle().shadow(radius: 10))
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    .background(Color.purple).opacity(0.45)
                    .cornerRadius(10)
                    
                    Button(action: { self.step = 3 }) {
                        Text("3")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Circle().shadow(radius: 10))
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    .background(Color.purple).opacity(0.45)
                    .cornerRadius(10)
                    
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


