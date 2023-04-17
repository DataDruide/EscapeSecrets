
import SwiftUI


struct ActivityTripView: View {
    
    @StateObject var tripType = TripTypeViewModel()
    @State private var searchText = ""
        
    var filteredMessages: [Activities] {
        if searchText.isEmpty {
            return activities
        } else {
            return activities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
        
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("studentonroad")
                    .resizable()
                    .scaledToFill()
                    .overlay(Rectangle())
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(.black.opacity(0.55))
                    .contrast(0.7)
                    .offset(x: -110)
                    .opacity(01.05)

                LinearGradient(colors: [.black.opacity(0.37), .black.opacity(0.67)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 170))
                    ], spacing: 30) {
                        ForEach(filteredMessages, id: \.id) { activity in
                            NavigationLink(destination: DetailActivityView(activity: activity)) {
                                ActivityButton(name: activity.name, image: activity.image)
                            }
                            .padding()
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
            }
            .navigationTitle("Our Event Program")
            .searchable(text: $searchText, prompt: "Find your perfect event...")
            .searchable(text: $searchText) { // Änderung 2
                Text("Find your perfect event...")
                    .foregroundColor(.gray) // Änderung 2
            }
        }
    }
}

struct ActivityTripView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTripView()
    }
}
