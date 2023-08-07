
import SwiftUI

struct CreatedMemberView: View {
    @Binding var CreatedMemberViewIsShowing: Bool
    @ObservedObject var memberDataViewModel: MemberDataViewModel
    @State var isShowing: Bool = false

    var body: some View {
        ZStack {
            // Hintergrundfarbe
           Color(UIColor.systemGroupedBackground)
          
            VStack {
                // Header-Bild
                Image("surfen")
                    .resizable()
                    .frame(width: 400, height: 250)

                NavigationView {
                    List {
                        ForEach(memberDataViewModel.savedUserDaten) { data in
                            HStack {
                                Image(systemName: data.done ? "checkmark.circle.fill" : "checkmark.circle")
                                    .foregroundColor(data.done ? .white : .green)
                                    .font(.title2) // Increase the icon size for a better look

                                Text(data.desc ?? "No description")
                                    .foregroundColor(data.done ? .white : .white)
                                    .font(.body) // Use a more readable font size

                                Spacer()

                                Button(action: {
                                    memberDataViewModel.updateMemberData(MemberData: data)
                                }) {
                                    Text(data.done ? "Check It" : "Delete")
                                        .foregroundColor(.white)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 15)
                                        .background(data.done ? Color.green : Color.red) // Use green for "Check It" and red for "Delete"
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.vertical, 8) // Add vertical padding between list items
                        }
                    }
                    .listStyle(GroupedListStyle()) // Keep the grouped list style
                    .navigationBarTitle("Member Data") // Use navigationBarTitle instead of navigationTitle

                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
