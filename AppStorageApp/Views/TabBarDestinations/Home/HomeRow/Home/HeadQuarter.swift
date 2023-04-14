//
//  HeadQuarter.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 12.04.23.
//
//
//import SwiftUI
//
//struct HeadQuarter: View {
//    var body: some View {
//        // create a Colorset of Angularcolors
//
//
//
//        ZStack {
//            ZStack {
//
//                //            AngularGradient(gradient: Gradient(stops: [
//                //                .init(color: Color(CGColor(colorSpace: CGColorSpace as! CGColorSpace, components: UnsafePointer<CGFloat>)!), location:
//                //                    0.07859717309474945),
//                //                .init(color: Color(CGColor as! CGColor), location:
//                //                        0.43838635087013245),
//                //                .init(color: Color(CGColor as! CGColor), location:
//                //                        0.6134116053581238),
//                //                .init(color: Color(CGColor as! CGColor), location:
//                //                        0.8473764657974243)]),
//                //                            center: UnitPoint(x:
//                //                                                0.4618092920835134, y:
//                //                                                0.511450411134368)
//                //            )
//                //            AngularGradient(gradient: Gradient(colors:
//                //                [Color( ), Color( )]), center: .center)
//                //
//                //
//
//
//                LinearGradient(gradient: Gradient(colors:
//                                                    [Color.white.opacity(0),
//                                                     Color.white.opacity(1)]), startPoint: .bottom,
//                               endPoint: .top)
//
//                Image("Ellipse 1")
//                Image(uiImage: Ellipse2)
//
//
//            }
//            content // called the KeyStructure
//
//        }
//
//    }
//    // create the Welcomeboard with Text and symbols
//    // we creating the ZStack why than can use at a overlay
//    // create a Keystructure
//    var content: some View {
//        VStack(alignment: .leading ,spacing: 16 ) {
//            Text("Meng To".uppercased())
//                .font(.footnote).fontWeight(.semibold)
//            Text("I fly every Year in the Holiday and catch every Year the Price".uppercased())
//                .font(.title).bold()
//            Text("This App since at 15 April, 2023".uppercased())
//                .font(.footnote)
//            HStack {
//                Image(systemName: "link")
//                Text("Escapes Secrets")
//            }.background(Color.black)
//                .font(.footnote)
//        }.background(Color.gray)
//            .foregroundColor(.white)
//            .ignoresSafeArea()
//    }
//
//    struct HeadQuarter_Previews: PreviewProvider {
//        static var previews: some View {
//            HeadQuarter()
//        }
//    }
//
//}
