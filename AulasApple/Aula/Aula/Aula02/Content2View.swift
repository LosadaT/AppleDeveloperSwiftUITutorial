//
//  Content2View.swift
//  Aula
//
//  Created by Patricia Totaro on 18/04/25.
//

import SwiftUI

var gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct Content2View: View {
    var body: some View {
        TabView{
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview {
    Content2View()
}
