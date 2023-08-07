
   import SwiftUI
   import PhotosUI

struct CircleImage: Identifiable {
    let id: UUID = UUID()
    let image: Image
    
    var circleView: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(.primary, lineWidth: 2))
            .padding(2)
            .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
            .shadow(radius: 3)
            .padding(4)
    }
}
   struct MemberImageView: View {
       @State var items: [PhotosPickerItem] = []
       @State var images: [CircleImage] = []
       @State var loadingCount = 0
       var body: some View {
           ZStack {
               Color.black
                   .ignoresSafeArea(.all)
               VStack {
                   HStack {
                       if loadingCount == 0 {
                           PhotosPicker("Select Images",
                                        selection: $items,
                                        maxSelectionCount: 4,
                                        selectionBehavior: .ordered,
                                        matching: .images,
                                        preferredItemEncoding: .automatic)
                           .foregroundColor(.white)
                       } else {
                           Text("loading images...")
                       }
                   }
                   HStack {
                       ForEach(images) {
                           $0.circleView
                       }
                   }
                   .onChange(of: items) { pickerItems in
                       images = []
                       for item in pickerItems {
                           loadItem(item: item)
                       }
                   }
               }
           }
       }
       func loadItem(item: PhotosPickerItem) {
           loadingCount += 1
           item.loadTransferable(type: Data.self) { result in
               DispatchQueue.main.async {
                   switch result {
                       case .success(let imageData?):
                           #if os(macOS)
                           if let nsImage = NSImage(data: imageData) {
                               images.append(CircleImage(image: Image(nsImage: nsImage)))
                           }
                           #else
                           if let uiImage = UIImage(data: imageData) {
                               images.append(CircleImage(image: Image(uiImage: uiImage)))
                           }
                           #endif
                           loadingCount -= 1
                       case .success(nil):
                           print("image == nil")
                           loadingCount -= 1
                       case .failure(let error):
                           print("Error loading image: \(error)")
                           loadingCount -= 1
                   }
               }
           }
       }
   }

struct Previews_MemberImageView_Previews: PreviewProvider {
    static var previews: some View {
    MemberImageView()
    }
}
