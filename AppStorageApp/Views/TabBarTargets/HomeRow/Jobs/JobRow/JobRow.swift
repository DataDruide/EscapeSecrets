
import SwiftUI
import Foundation



struct JobRow: View {
    
    @State private var showAlert = false
    
    
    @ObservedObject var viewModel: JobListViewModel
    @State private var offsetY: CGFloat = 0.0
    @State private var isTapped = false

    
    var body: some View {
       
            NavigationStack {
                
                ZStack {
                    // Hintergrundbildansicht
                    Color.black
                        .ignoresSafeArea()
                    
                    VStack(alignment: HorizontalAlignment.center) {
                    Image("flexibel")
                        .resizable()
                        .frame(maxWidth: 400, maxHeight: 600)
                        .shadow(color: .gray, radius: 0.5, x: 1.00, y: 1)
                        .multilineTextAlignment(.center)
                    HStack {
                        Text("Your job finder for every travel situation")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                        
                        Button(action: {
                            showAlert = true
                        }) {
                            HStack {
                                Image(systemName: "info.circle")
                                    .font(.system(size: 24))
                                Text("Job Search")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(red: 75 / 255, green: 115 / 255, blue: 115 / 255))
                            )                            .cornerRadius(10)
                            .scaleEffect(isTapped ? 0.9 : 1.0)
                            .animation(.spring())
                            .onTapGesture {
                                isTapped = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    isTapped = false
                                }
                            }
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Looking for a job?"),
                                message: Text("You've come to the right place! Our app provides job listings for a wide range of industries and locations. Start your job search today!")
                            )
                        }
                    }
                    Spacer(minLength: 10)
                    SearchBar(searchTerm: $viewModel.searchTerm)
                    
                    if viewModel.jobs.isEmpty {
                        EmptyStateView()
                    } else {
                        List(viewModel.jobs) { job in
                            NavigationLink(destination: JobDetailView(job: job)) {
                                JobView(job: job)
                            }
                        }.navigationTitle("Jobfinder")
                            .listStyle(.plain)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 1)).opacity(0.8)
                            .offset(y: offsetY)
                            .gesture(DragGesture().onChanged({ value in
                                self.offsetY = value.translation.height
                            }).onEnded({ value in
                                withAnimation(.spring()) {
                                    if offsetY > 50 {
                                        offsetY = UIScreen.main.bounds.height
                                    } else if offsetY < -50 {
                                        offsetY = -UIScreen.main.bounds.height
                                    } else {
                                        offsetY = 0
                                    }
                                }
                            }))
                    }
                }
            }
            
            
       }.background(Color.white)
    }
}



import SwiftUI

struct SearchBar: UIViewRepresentable {
  typealias UIViewType = UISearchBar
  @Binding var searchTerm: String

  func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.delegate = context.coordinator
    searchBar.searchBarStyle = .minimal
    searchBar.placeholder = "Type a job title, category, location..."
    if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
      searchTextField.textColor = .white
    }
    return searchBar
  }
  
  func updateUIView(_ uiView: UISearchBar, context: Context) {
  }
  
  func makeCoordinator() -> SearchBarCoordinator {
    return SearchBarCoordinator(searchTerm: $searchTerm)
  }
  
  class SearchBarCoordinator: NSObject, UISearchBarDelegate {
    @Binding var searchTerm: String
    
    init(searchTerm: Binding<String>) {
      self._searchTerm = searchTerm
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchTerm = searchBar.text ?? ""
      UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
    }
  }
}


struct Previews_JobRow_Previews: PreviewProvider {
    static var previews: some View {
        JobRow(viewModel: JobListViewModel())
        
    }
}
