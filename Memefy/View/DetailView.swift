//
//  DetailView.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/21.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    
    //MARK: - Properties
    
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
    @State private var isShowingHud = false
    @State private var isShowingFailed = false
    
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            
            VStack {
                memeImageView
                Spacer()
                
                ForEach(0..<boxCountNumber) { index in
                    TextField("Label \(index + 1)", text: $addedlabel[index])
                        .padding(.horizontal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    if let image = memeImageView.takeScreenshot(origin: CGPoint(x: 0, y: 107.0), size: CGSize(width: wholeScreenWidth, height: memeImageHeight + 30)) {
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        isShowingHud = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                        
                    } else {
                        isShowingFailed = true
                    }
                }, label: {
                    Text("Save Image")
                })
            }
            .padding()
            .navigationBarTitle(imageTitle,displayMode: .inline)
            
            //.background(NavBarAccessor{ navBar in
            //  self.navBarHeight = navBar.bounds.height
            //})
            if isShowingHud {
                HUDContainer(isShowingHud: $isShowingHud, isShowingFailed: $isShowingFailed) {
                    HStack {
                        SFSymbols.check
                        Text("Photo Saved!")
                    }
                }
                .padding(.top)
                .zIndex(1)
            } else if isShowingFailed {
                HUDContainer(isShowingHud: $isShowingHud, isShowingFailed: $isShowingFailed) {
                    HStack {
                        SFSymbols.fail
                        Text("Fail saving photo!")
                    }
                }
                .padding(.top)
                .zIndex(1)
            }
            
        }
    }
    
    var memeImageView: some View {
        ZStack {
            GeometryReader { geo in
                HStack {
                    Spacer()
                    mainImage
                        .onTapGesture {
                            self.minY = geo.frame(in: .global).minY
                            self.minX = geo.frame(in: .global).minX
                            print("minX is \(self.minX)")
                            print("minY is \(self.minY)")
                            
                        }
                    Spacer()
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
            .frame(height: memeImageHeight + 30)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imageURL: "https://i.imgflip.com/1g8my4.jpg", imageTitle: "Two Buttons", boxCountNumber: 3)
    }
}

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
