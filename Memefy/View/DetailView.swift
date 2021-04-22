//
//  DetailView.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/21.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    
    var imageURL: String = "https://i.imgflip.com/30b1gx.jpg"
    var imageTitle: String = "Drake Meme"
    var boxCountNumber = 2
    @State var addedlabel: [String] = ["", "" , "", "" , "", ""]
    //@State private var navBarHeight: CGFloat = 0.0
    var wholeScreenWidth = UIScreen.main.bounds.width
    var memeImageHeight = UIScreen.main.bounds.height / 2.5
    //var saveAreaHeight = UIApplication.shared.windows[0].safeAreaInsets.top
    @Environment(\.presentationMode) private var presentationMode
    @State var minY: CGFloat = 0.0
    @State var minX: CGFloat = 0.0
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                
                memeImageView
                
                Spacer()
                
                ForEach(0..<boxCountNumber) { index in
                    TextField("Label \(index + 1)", text: $addedlabel[index])
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    if let image = memeImageView.takeScreenshot(origin: CGPoint(x: 0, y: 151.0), size: CGSize(width: wholeScreenWidth, height: memeImageHeight)) {
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Text("Save Image")
                })
            }
            .padding()
            .navigationBarTitle(imageTitle,displayMode: .inline)
//            .background(NavBarAccessor{ navBar in
//                self.navBarHeight = navBar.bounds.height
//            })
        }
    }
    
    var memeImageView: some View {
        ZStack {
            GeometryReader { geo in
                mainImage
                    .onTapGesture {
                        self.minY = geo.frame(in: .global).minY
                        self.minX = geo.frame(in: .global).minX
                        print("minX is \(self.minX)")
                        print("minY is \(self.minY)")
                    }
            }
            ForEach(addedlabel, id:\.self) { label in
                DraggableLabel(text: label)
            }
        }
        .clipped() //hide the text when drag over the boarder of image
    }
    
    var mainImage: some View {
        KFImage(URL(string: imageURL))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: memeImageHeight)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

//extension DetailView {
//    @ViewBuilder
//    func showTextOrNot(label: String) -> some View {
//        if label.isEmpty {
//            Text("")
//        } else {
//            Text("\(label)")
//                .font(.title2)
//                .foregroundColor(Color.black)
//                .padding()
//        }
//    }
//}
//
//struct DetailViewContainer<Content: View>: View {
//    let content: Content
//    init(@ViewBuilder content: () -> Content) {
//        self.content = content()
//    }
//    var body: some View {
//        content
//    }
//}
