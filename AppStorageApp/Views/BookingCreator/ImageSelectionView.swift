
import SwiftUI

struct ImageSelectionView: View {
    
    @State var isSelected1: Bool = false
    @State var isSelected2: Bool = false
    @State var isSelected3: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image("sitzplatz")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding()
                    .onTapGesture {
                        isSelected1.toggle()
                    }
                    .background(isSelected1 ? Color.orange : Color.white)
                Image("sitzplatz")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding()
                    .onTapGesture {
                        isSelected2.toggle()
                    }
                    .background(isSelected2 ? Color.orange : Color.white)
                Image("sitzplatz")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding()
                    .onTapGesture {
                        isSelected3.toggle()
                    }
                    .background(isSelected3 ? Color.orange : Color.white)
            }
            HStack {
                Text("Flurseite")
                    .padding(.horizontal)
                    .foregroundColor(.white)

                Spacer()
                Checkbox(isChecked: $isSelected1)
                    .padding()

            }
            HStack {
                Text("Mitte")
                    .padding(.horizontal)
                    .foregroundColor(.white)

                Spacer()
                Checkbox(isChecked: $isSelected2)
                    .padding()

            }
            HStack {
                Text("Fenster")
                    .padding(.horizontal)
                    .foregroundColor(.white)
                Spacer()
                Checkbox(isChecked: $isSelected3)
                    .padding()

            }
            Spacer()
        }
        .background(
            Image("innenraum2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.25)
        )
    }
}
