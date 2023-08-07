import SwiftUI

import SwiftUI

struct DetailPlaceView: View {
    @State private var showJobRow = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {
                    Text("Location Details")
                        .font(.largeTitle)
                        .foregroundColor(.orange)

                    Text("Hotel Valencia Porto Mare ")
                        .font(.title)
                        .foregroundColor(.white)

                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("4.5")
                            .foregroundColor(.white)
                    }

                    Divider()

                    VStack(alignment: .leading, spacing: 8) {
                        FeatureRow(imageName: "pin", title: "Italiens Top Holiday Package")
                        FeatureRow(imageName: "dollarsign.circle", title: "Price: $244")
                        FeatureRow(imageName: "star.fill", title: "Rating: 4.5")

                        HStack(spacing: 16) {
                            FeatureView(imageName: "wifi", title: "Wifi", action: {}) // Empty closure for the first FeatureView
                            FeatureView(imageName: "cup.and.saucer", title: "Coffee", action: {})
                            FeatureView(imageName: "graduationcap.circle.fill", title: "Student Jobs", action: {
                                self.showJobRow = true
                            })
                            FeatureView(imageName: "figure.open.water.swim", title: "Swimming", action: {})
                        }
                        .foregroundColor(.yellow)
                        .background(Color.black.opacity(0.46))
                        .cornerRadius(10)
                    }
                    .padding()

                    HStack {
                        Divider()
                        Image("See")
                            .resizable()
                            .frame(width: 130, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }

                    Text("Located in the Province Region, in the Local of a Interest Point, Italia a little more Nature ... Read More")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding()

                    Image("Map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        .padding()

                    Button(action: {
                        // Your action here
                    }) {
                        Text("Book Now")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.horizontal, 60)
                            .padding(.vertical, 16)
                            .background(Color(red: 75 / 255, green: 115 / 255, blue: 115 / 255))
                            .cornerRadius(20)
                    }
                }
            }
        }
        .sheet(isPresented: $showJobRow) {
            JobRow(viewModel: JobListViewModel())
        }
    }
}

struct FeatureRow: View {
    let imageName: String
    let title: String

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: imageName)
                .foregroundColor(.red)
            Text(title)
                .foregroundColor(.white)
        }
    }
}

struct FeatureView: View {
    let imageName: String
    let title: String
    let action: (() -> Void)?

    var body: some View {
        Button(action: {
            action?()
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.yellow)
                Text(title)
            }
        }
    }
}

struct DetailPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlaceView()
    }
}
