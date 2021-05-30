//
//  SFSymbols.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/22.
//

import SwiftUI


enum SFSymbols: String, View {
    case check = "checkmark.circle.fill"
    case fail = "exclamationmark.circle.fill"
    case maginify = "magnifyingglass"
    case xmarkCircle = "xmark.circle.fill"
    
    var body: some View {
        Image(systemName: self.rawValue)
    }
}
