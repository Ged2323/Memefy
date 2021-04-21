//
//  memeModel.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/21.
//

import Foundation

struct MemeModel {
    var name: String
    var title: String
    var textLine: Int
}

//"drakememe", "pikachumeme", "pikachumeme"
extension MemeModel {
    static let dummtData: [MemeModel] = [
        MemeModel(name: "Drake Meme", title: "drakememe", textLine: 2),
        MemeModel(name: "Pikachu", title: "pikachumeme", textLine: 1),
        MemeModel(name: "SpongeBob", title: "spongememe", textLine: 1)]
}
