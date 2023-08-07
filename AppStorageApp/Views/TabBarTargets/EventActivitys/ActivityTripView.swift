import SwiftUI


struct ActivityTripView: View {
    // Zustandsobjekt zum Verwalten des TripTypeViewModels
    @StateObject var tripType = TripTypeViewModel()
    // Zustandsvariable zum Speichern des Suchtextes
    @State private var searchText = ""
    // Zustandsvariable zum Anzeigen des Modals
    @State private var showModal = false

    // Berechnete Eigenschaft, die die Aktivitäten entsprechend des Suchtextes filtert
    var filteredActivities: [Activities] {
        if searchText.isEmpty {
            return activities
        } else {
            return activities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.black.opacity(0.87), .black.opacity(0.87)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading) {
                    Text("Trips")
                        .font(.title)
                        .foregroundColor(.yellow)
                        .fontWeight(.bold)
                        .padding(.leading, 20)

                    // Button zum Anzeigen des Modals
                    Button(action: {
                        showModal = true
                    }) {
                        Text("More Infos...")
                            .foregroundColor(.yellow)
                    }
                    .padding()

                    // Horizontale ScrollView mit Aktivitäten
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(filteredActivities, id: \.id) { activity in
                                NavigationLink(destination: DetailActivityView(activity: activity)) {
                                    VStack(alignment: .center) {
                                        Image(activity.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 200, height: 200)
                                            .cornerRadius(10)
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 10)

                                        Text(activity.name)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.yellow)
                                            .padding(.bottom, 5)

                                        Text("From $\(activity.price) per person")
                                            .foregroundColor(.white)
                                            .padding(.bottom, 5)

                                        Text(activity.description)
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .padding()
                                            .padding(.bottom, 5)
                                    }                                   .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                                    .padding()
                                    .shadow(radius: 5)
                                    .padding(.bottom, 20)
                                }
                            }
                        }
                        .padding()
                    }
                    .padding(.top, 20)
                    Spacer()
                }
                .navigationTitle("Activities")
            }
            .searchable(text: $searchText) {
                Text("Find your perfect activity...")
                    .foregroundColor(.white)
                    .background(.gray)
            }
        }
        .fullScreenCover(isPresented: $showModal) {
            HorizontalTextModal(isPresented: $showModal, texts: ["Surfen", "Hiken", "Kayak", "Guidetour", "Text 5"])
        }
    }
}

struct ActivityTripView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTripView()
    }
}

struct HorizontalTextModal: View {
    @Binding var isPresented: Bool
    var texts: [String]

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                VStack(spacing: 20) {
                    ForEach(texts, id: \.self) { text in
                        Button(action: {
                            // Hier kann die Aktion für die Navigation ausgeführt werden
                            // Zum Beispiel die Navigation zu einer Detailansicht basierend auf dem Text
                            print("Navigating to \(text)")
                            isPresented = false
                        }) {
                            Text(text)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.yellow)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 5)
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: -10)
            }
            .padding(.horizontal, 20)
        }
        .animation(.easeInOut)
    }
}
