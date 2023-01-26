//
//  SwiftUIView.swift
//  Clima SwiftUI
//
//  Created by Vũ Chiến Thắng on 24/01/2023.
//

import SwiftUI

struct ImageButtonView: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(Color(UIColor(named: "weatherColor")!))
            
    }
}
