//
//  AnalyzesView.swift
//  Population
//
//  Created by Can Balkaya on 12/17/19.
//  Copyright © 2019 Can Balkaya. All rights reserved.
//

import SwiftUI

struct AnalyzesView: View {
    var body: some View {
        HStack {
            VStack (alignment: .trailing, spacing: UIScreen.main.bounds.height * 0.12) {
                Spacer().frame(height: 1)
                Text(String(humansLast.last!)).font(.system(size: 8))
                Text(String((humansLast.last! + humansLast.first!)/2)).font(.system(size: 8))
                Text(String(humansLast.first!)).font(.system(size: 8)).padding(.bottom, 20)
                Spacer().frame(height: 4)
            }.frame(height: UIScreen.main.bounds.height * 0.3)
            
            HStack (spacing: 12) {
                BarView(value: humansLast[0], currentGeneration: 1)
                BarView(value: humansLast[1], currentGeneration: 2)
                BarView(value: humansLast[2], currentGeneration: 3)
                BarView(value: humansLast[3], currentGeneration: 4)
                BarView(value: humansLast[4], currentGeneration: 5)
                BarView(value: humansLast[5], currentGeneration: 6)
                BarView(value: humansLast[6], currentGeneration: 7)
                BarView(value: humansLast[7], currentGeneration: 8)
                BarView(value: humansLast[8], currentGeneration: 9)
                BarView(value: humansLast[9], currentGeneration: 10)
            }
        }.navigationBarTitle("Analyzes")
    }
}

struct BarView: View {
    var value: Int
    var currentGeneration: Int
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().frame(width: UIScreen.main.bounds.width * 0.06, height: CGFloat(UIScreen.main.bounds.height * 0.3)).foregroundColor(Color(#colorLiteral(red: 0.3607843137, green: 0.3882352941, blue: 0.4039215686, alpha: 0.3004334332)))
                Capsule().frame(width: UIScreen.main.bounds.width * 0.06, height: CGFloat((value * Int(UIScreen.main.bounds.height * 0.3))/humansLast.max()!)).foregroundColor(.green)
            }
            
            Text(String(currentGeneration)).padding(.top, UIScreen.main.bounds.height * 0.001)
                .animation(.default)
        }
    }
}

struct AnalyzesView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyzesView()
    }
}
