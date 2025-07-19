//
//  CategoryCardView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

struct CategoryCardView: View{
    let category: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
        }
    }
}

#Preview {
    CategoryCardView(category: "")
}
