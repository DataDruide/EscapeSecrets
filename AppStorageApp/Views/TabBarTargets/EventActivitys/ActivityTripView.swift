
import SwiftUI

struct ActivityTripView: View {
    
    @StateObject var tripType = TripTypeViewModel()
    @State private var searchText = ""
    
    var filteredActivities: [Activities] {
        if searchText.isEmpty {
            return activities
        } else {
            return activities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
        
                Image("urlaubsbild")
                    .resizable()
                    .scaledToFill()
                    .overlay(Rectangle())
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(.black.opacity(0.75))
                    .contrast(0.7)
                    .offset(x: -0)
                    .opacity(01.05)
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.black.opacity(0.47),.black.opacity(0.47)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Text("Trips")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(filteredActivities, id: \.id) { activity in
                                NavigationLink(destination: DetailActivityView(activity: activity)) {
                                    VStack(alignment: .leading) {
                                        Image(activity.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 200, height: 200)
                                            .cornerRadius(10)
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 10)
                                        Text(activity.name)
                                            .fontWeight(.semibold)
                                            .padding(.leading, 20)
                                            .padding(.bottom, 5)
                                        Text("From $\(activity.price) per person")
                                            .foregroundColor(.gray)
                                            .padding(.leading, 20)
                                            .padding(.bottom, 5)
                                        Text(activity.description)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .padding(.leading, 20)
                                            .padding(.bottom, 5)
                                    }
                                    .background(Color.black).opacity(0.8)
                                    .padding(.all)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .padding(.bottom, 20)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 20)
                    Spacer()
                }
                .navigationTitle("Activities")
            }
            .searchable(text: $searchText) { // Änderung 2
                Text("Find your perfect activity...")
                    .foregroundColor(.black) // Änderung 2
            }
        }
    }
}
struct ActivityTripView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTripView()
    }
}
