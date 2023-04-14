//import SwiftUI
//
//struct TravelDiscoveryView: View {
//    
//    let categories: [BookingCategories] = [
//        .init(name: "Boarding", imageName: "flugticket1"),
//        .init(name: "Seats", imageName: "sitzplatzsitz"),
//        .init(name: "Bags", imageName: "flightbags"),
//        .init(name: "Jobsearch", imageName: "jobsearch"),
//    ]
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView(.horizontal) {
//                HStack(spacing: 10) { // Use HStack with spacing for category buttons
//                    ForEach(categories, id: \.self) { categorie in
//                        NavigationLink(
//                            destination: TravelDiscoveryDetailView(),
//                            label: {
//                                VStack {
//                                    Image(categorie.imageName)
//                                        .resizable()
//                                        .frame(width: 50, height: 50)
//                                        .cornerRadius(.infinity)
//                                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
//                                    Text(categorie.name)
//                                        .font(.system(size: 12, weight: .semibold))
//                                        .foregroundColor(.white)
//                                }
////                                .frame(width: 100) // Set fixed width for each category button
////                                .background(LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
////                                .cornerRadius(8)
//                            }
//                        )
//                    }
//                }
//            }
//        }.background(Color.gray)
//    }
//}
