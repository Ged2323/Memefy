//
//  DetailView.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/21.
//

import SwiftUI

struct DetailView: View {
    
    var image: String = "drakememe"
    var imageTitle: String = "Drake Meme"
    @State var label1 = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                //TextField("abel 1", text: $label1)
                TextField("Label 1", text: $label1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {}, label: {
                    Text("Save Image")
                })
            }
            .padding()
            
            .navigationBarTitle(imageTitle,displayMode: .inline)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
