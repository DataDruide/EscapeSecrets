//
//  PopularCompanysView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 03.04.23.
//
//
import SwiftUI

struct PopularCompanysView: View {
    
    let companies: [Company] = [
        .init(name: "Ankara GmbH", imageName: "ankara"),
        .init(name: "NO4711", imageName: "4711"),
        .init(name: "companytagline GmbH", imageName: "companytagline")

    ]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                // linke title Überschrift
                Text("Promoted Companys")
                    .font(.system(size:13, weight: .semibold))
                    .foregroundColor(.orange)
                Spacer()
                // linke title Überschrift
                
                Text("See all")
                    .font(.system(size:11, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
                    .foregroundColor(.orange)
                  
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15.0) {
                        ForEach(companies, id: \.self) { company in
                            VStack (){
                                Image(company.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(60)
                                Text(company.name)
                                    .font(.system(size:10, weight: .semibold))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)

                                
                            }
                            .frame(width: 100)
                                   
                                    .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                                    .padding(.bottom)
                            }
                        }.padding(.horizontal)
                    }
                    
                }

                
            }
              
                
                
            }
        
        


struct PopularCompanysView_Previews: PreviewProvider {
    static var previews: some View {
        PopularCompanysView()
    }
}
