//import SwiftUI
//
//struct PopularDestinationView : View {
//    let categories2 : [BookingCategories2] = [
//        .init(name: "Japan",country: "Japan", imageName: "dragon", detailText: "Japan is a fascinating country known for its unique culture, technology and cuisine. Japan is located in the Pacific Ocean, consists of a chain of islands and is one of the most populous countries in the world."),
//        .init(name: "Spain",country: "Spain", imageName: "valencia", detailText: "Spain is also famous for its delicious cuisine, which ranges from paella, tapas and fresh seafood to the famous wines and champagnes. The nightlife in Spain is also very lively and people can party all night long in the bars and nightclubs."),
//        .init(name: "Greece",country: "Greece", imageName: "santorini", detailText: "Greece, also known as in the national language Greek, is a country with a rich history, culture and breathtaking scenery. It is located in southeastern Europe and borders Albania, North Macedonia, Bulgaria and Turkey."),
//        .init(name: "USA",country: "USA", imageName: "mountRushmore", detailText: "The United States of America is a large and diverse country in North America. It is known for its famous cities such as New York, Los Angeles and Chicago, as well as for its natural attractions such as the Grand Canyon and Yellowstone National Park. The country has a rich history and culture and is a leading economic and political power in the world. The USA is also home to a diverse population and a multitude of languages, cuisines and traditions."),
//        .init(name: "Canada",country: "Canada", imageName: "alberta", detailText: "Canada is a North American country known for its natural beauty, including vast forests, mountains and lakes. The country is also known for its friendly and diverse population, with English and French being the official languages. Canada has a strong economy and is a member of international organizations such as the United Nations and the G7.")
//    ]
//
//    var body: some View {
//        ScrollView(.horizontal) {
//            HStack(spacing: 10) {
//                ForEach(categories2) { categorie2 in
//                    NavigationLink(destination: DetailPopularDestinationView(name: categorie2.name, country: categorie2.country, imageName: categorie2.imageName, detailText: categorie2.detailText)) {
//                        VStack {
//                            ZStack(alignment: .bottomLeading) {
//                                GeometryReader { proxy in
//                                    Image(categorie2.imageName)
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 100, height: 175)
//                                        .cornerRadius(5)
//                                        .shadow(radius: 5)
//                                        .scaleEffect(getScale(proxy: proxy))
//
//                                    VStack(alignment: .leading) {
//                                        Text(categorie2.name)
//                                            .font(.headline)
//                                            .fontWeight(.bold)
//                                            .foregroundColor(.white)
//                                            .padding(.horizontal, 8)
//                                            .padding(.vertical, 4)
//                                            .background(Color.black.opacity(0.6))
//                                            .cornerRadius(5)
//                                            .padding()
//                                        Spacer()
//                                    }
//                                    .padding(.leading, 8)
//                                    .padding(.bottom, 8)
//                                }
//                            }
//                        }
//
//                    }
//                }
//            }
//            .padding(.horizontal)
//        }
//    }
//
//    private func getScale(proxy: GeometryProxy) -> CGFloat {
//        let globalX = proxy.frame(in: .global).minX
//        let diff = abs(globalX)
//        let screenWidth = UIScreen.main.bounds.width
//        let scale = 1 + (screenWidth - diff) / (2 * screenWidth)
//        return scale
//    }
//
//
//    struct CardView<Content: View>: View {
//        let content: Content
//
//        init(@ViewBuilder content: @escaping () -> Content) {
//            self.content = content()
//        }
//
//        var body: some View {
//            VStack {
//                content
//            }
//            .background(Color.white.opacity(0.80))
//            .cornerRadius(5)
//            .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 2)
//        }
//    }
//
//}
//
//struct PopularDestinationView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        PopularDestinationView()
//    }
//}
