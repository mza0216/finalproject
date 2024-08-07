//
//  HeaderView.swift
//  finalproject
//
//  Created by Marc Atienza on 7/4/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300 )
        .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "To Do List", angle: 15, background: Color.pink)
    }
}

