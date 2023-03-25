//
//  DetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 20.03.23.
//


import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            
            VStack {
                Image("bali")
                    .resizable()
                    .frame(width: 400, height: 350)
                
                Text("Lage")
                    .font(.system(size: 20, weight: .bold))

                
                Text("Bali is the westernmost of the Lesser Sunda Islands, which also includes the islands of Nusa Tenggara. Bali is located in the Indian Ocean between the islands of Java to the west and Lombok to the east. Bali is separated from Java by the 2.5 km wide Bali Road, from Lombok by the at least 19 km wide Lombok Road. The north-south extension of the island of Bali is 95 km, from its western tip to its eastern tip it measures 145 km.")
                    .font(.system(size: 13, weight: .thin))
                    .padding(10)
                
                Text("Sehenswürdigkeiten")
                    .font(.system(size: 18, weight: .bold))
                
                HStack {
                    VStack {
                        Image("image1")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Tempel")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    VStack {
                        Image("image2")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Strand")
                            .font(.system(size: 14, weight: .medium))
                    }
                }
                .padding()

                
                HStack {
                    VStack {
                        Image("image3")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Reisfelder")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    VStack {
                        Image("image4")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Vulkane")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    
                }
                .padding()
                VStack {
                    Button(action: {
                        if let url = URL(string: "https://www.google.com/maps?q=-8.409518,115.188919") {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }) {
                        Image("Map1")
                            .resizable()
                            .frame(width: 360, height: 200)
                    }
                }
            }
            .background(Image("Background_gradient"))

        }
    }
}


struct DetailView1: View {
    var body: some View {
        ScrollView {
            
            VStack {
                Image("fuji")
                    .resizable()
                    .frame(width: 400, height: 350)
                
                Text("Lage")
                    .font(.system(size: 20, weight: .bold))

                
                Text("Bali is the westernmost of the Lesser Sunda Islands, which also includes the islands of Nusa Tenggara. Bali is located in the Indian Ocean between the islands of Java to the west and Lombok to the east. Bali is separated from Java by the 2.5 km wide Bali Road, from Lombok by the at least 19 km wide Lombok Road. The north-south extension of the island of Bali is 95 km, from its western tip to its eastern tip it measures 145 km.")
                    .font(.system(size: 13, weight: .thin))
                    .padding(10)
                
                Text("Sehenswürdigkeiten")
                    .font(.system(size: 18, weight: .bold))
                
                HStack {
                    VStack {
                        Image("image1")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Tempel")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    VStack {
                        Image("image2")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Strand")
                            .font(.system(size: 14, weight: .medium))
                    }
                }
                .padding()

                
                HStack {
                    VStack {
                        Image("image3")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Reisfelder")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    VStack {
                        Image("image4")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Vulkane")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    
                }
                .padding()
                VStack {
                    Button(action: {
                        if let url = URL(string: "https://www.google.com/maps?q=35.3606,138.7274") {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }) {
                        Image("Map1")
                            .resizable()
                            .frame(width: 360, height: 200)
                    }
                }
            }
            .background(Image("Background_gradient"))

        }
    }
}
struct DetailView2: View {
    var body: some View {
        ScrollView {
            
            VStack {
                Image("canada")
                    .resizable()
                    .frame(width: 400, height: 350)
                
                Text("Lage")
                    .font(.system(size: 20, weight: .bold))

                
                Text("Bali is the westernmost of the Lesser Sunda Islands, which also includes the islands of Nusa Tenggara. Bali is located in the Indian Ocean between the islands of Java to the west and Lombok to the east. Bali is separated from Java by the 2.5 km wide Bali Road, from Lombok by the at least 19 km wide Lombok Road. The north-south extension of the island of Bali is 95 km, from its western tip to its eastern tip it measures 145 km.")
                    .font(.system(size: 13, weight: .thin))
                    .padding(10)
                
                Text("Interest Point")
                    .font(.system(size: 18, weight: .bold))
                
                HStack {
                    VStack {
                        Image("image1")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Tempel")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    VStack {
                        Image("image2")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Strand")
                            .font(.system(size: 14, weight: .medium))
                    }
                }
                .padding()

                
                HStack {
                    VStack {
                        Image("image3")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Reisfelder")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    VStack {
                        Image("image4")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Vulkane")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    
                }
                .padding()
                VStack {
                    Button(action: {
                        if let url = URL(string: "https://www.google.com/maps?q=56.1304,-106.3468") {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }) {
                        Image("Map1")
                            .resizable()
                            .frame(width: 360, height: 200)
                    }
                }
            }
            .background(Image("Background_gradient"))

        }
    }
}

struct DetailView3: View {
    var body: some View {
        ScrollView {
            
            VStack {
                Image("burjKahlifa 1")
                    .resizable()
                    .frame(width: 400, height: 350)
                
                Text("Lage")
                    .font(.system(size: 20, weight: .bold))

                
                Text("Bali is the westernmost of the Lesser Sunda Islands, which also includes the islands of Nusa Tenggara.\n Bali is located in the Indian Ocean between the islands of Java\n to the west and Lombok to the east. Bali is separated\nfrom Java by the 2.5 km wide Bali Road,\nfrom Lombok by the at least 19 km wide Lombok Road.\nThe north-south extension of the island\nof Bali is 95 km, from its western tip to its eastern tip it measures 145 km.")
                    .font(.system(size: 13, weight: .thin))
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                Text("Sehenswürdigkeiten")
                    .font(.system(size: 18, weight: .bold))
                
                HStack {
                    VStack {
                        Image("image1")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Tempel")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    VStack {
                        Image("image2")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Strand")
                            .font(.system(size: 14, weight: .medium))
                    }
                }
                .padding()

                
                HStack {
                    VStack {
                        Image("image3")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Reisfelder")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    VStack {
                        Image("image4")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)

                            .padding()

                        
                        Text("Vulkane")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    
                }
                .padding()
                VStack {
                    Button(action: {
                        if let url = URL(string: "https://www.google.com/maps?q=25.2048,55.2708") {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }) {
                        Image("mapDubai")
                            .resizable()
                            .frame(width: 360, height: 200)
                    }
                }
            }
            .background(Image("Background_gradient"))

        }
    }
}
