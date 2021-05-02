//
//  DetailView2.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/5/2.
//

import SwiftUI
import Kingfisher

struct DetailView2: View {
    
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
    
    var body: some View {
        //NavigationView {
            VStack {
                
                KFImage(URL(string: imageURL))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: memeImageHeight + 30)
                //Spacer()
//                ForEach(0..<boxCountNumber) { index in
//                    TextField("Label \(index + 1)", text: $addedlabel[index])
//                        .padding(.horizontal)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
                
            }
            //.navigationBarTitle(imageTitle, displayMode: .inline)
        //}
    }
}

struct DetailView2_Previews: PreviewProvider {
    static var previews: some View {
        DetailView2()
    }
}
