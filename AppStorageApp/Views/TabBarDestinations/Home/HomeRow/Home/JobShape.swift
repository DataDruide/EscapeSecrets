//
//import SwiftUI
//
//struct JobShape: View {
//    
//    @State private var CheckListViewIsShowing = false
//    @State private var ShowCreateProfilView = false
//    
//    @State private var JobViewIsShowing = false
//    @State private var showNextView = false
//    @State private var showNextView20 = false
//    
//    
//    var body: some View {
//        ZStack {
//            HStack(alignment: .center, spacing: 20) { // horizontal alignment
//                VStack {
//                    Button(action: {
//                        withAnimation {
//                            JobViewIsShowing = true
//                        }
//                    }) {
//                        RoundViews(systemName: "graduationcap.circle")
//                    }
//                    .sheet(isPresented: $JobViewIsShowing, onDismiss: {}, content: {
//                        JobRow(viewModel: JobListViewModel())
//                    })
//                    .blur(radius: 0.5)
//                    .shadow(color: .gray, radius: 0.25, x: 0.25, y: 0.25)
//                    VStack {
//                        Text("Jobsearch")
//                            .font(.system(size: 14))
//                            .foregroundColor(.white)
//                    }
//                }
//            }
//        }
//    }
//}
//               
//
//import SwiftUI
//
//struct CreateProfilShape: View {
//    
//    @State private var ShowCreateProfilView = false
//    
//    @State private var showNextView = false
//    @State private var showNextView20 = false
//    
//    
//    var body: some View {
//        ZStack {
//            HStack(alignment: .center, spacing: 20) { // horizontal alignment
//                VStack {
//                    Button(action: {
//                        withAnimation {
//                            ShowCreateProfilView = true
//                        }
//                    }) {
//                        RoundViews(systemName: "person.badge.plus")
//                    }
//                    .sheet(isPresented: $ShowCreateProfilView, onDismiss: {}, content: {
//                        CreateProfilView()
//                    })
//                    .blur(radius: 0.5)
//                    .shadow(color: .gray, radius: 0.25, x: 0.25, y: 0.25)
//                    VStack {
//                        Text("Profile")
//                            .font(.system(size: 14))
//                            .foregroundColor(.white)
//                    }
//                }
//            }
//        }
//    }
//}
//        
//
//import SwiftUI
//
//struct CheckListShape: View {
//    
//    @State private var CheckListViewIsShowing = false
//    
//   
//    
//    var body: some View {
//        ZStack {
//            HStack(alignment: .center, spacing: 20) { // horizontal alignment
//                VStack {
//                    Button(action: {
//                        withAnimation {
//                            CheckListViewIsShowing = true
//                        }
//                    }) {
//                        RoundViews(systemName: "checklist.unchecked")
//                    }
//                    .sheet(isPresented: $CheckListViewIsShowing, onDismiss: {}, content: {
//                        CheckListView(CheckListViewIsShowing: $CheckListViewIsShowing)
//                    })
//                    .blur(radius: 0.5)
//                    .shadow(color: .gray, radius: 0.25, x: 0.25, y: 0.25)
//                    VStack {
//                        Text("My Checklist")
//                            .font(.system(size: 14))
//                            .foregroundColor(.white)
//                    }
//                }
//            }
//        }
//    }
//}
//        
