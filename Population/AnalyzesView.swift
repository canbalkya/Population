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
        VStack {
            Spacer().frame(height: 5)
            
            HStack (alignment: .top) {
                VStack (alignment: .trailing, spacing: UIScreen.main.bounds.height * 0.12) {
                    if humansLast.max()! == humansLast.min()! {
                        Text(String(humansLast.max()!)).font(.system(size: 8))
                        Text(String((humansLast.max()!)/2)).font(.system(size: 8))
                        Text(String("0")).font(.system(size: 8))
                    } else {
                        Text(String(humansLast.max()!)).font(.system(size: 8))
                        Text(String((humansLast.max()! + humansLast.min()!)/2)).font(.system(size: 8))
                        Text(String(humansLast.min()!)).font(.system(size: 8))
                    }
                }.frame(height: UIScreen.main.bounds.height * 0.3).padding(.top, 5)
                
                HStack (spacing: 8) {
                    ForEach (0...humansLast.count - 1, id: \.self) { humanLast in
                        BarView(value: humansLast[humanLast], currentGeneration: humanLast + 1)
                    }
                }
            }.navigationBarTitle("Analyzes")
            
            List (0...humansLast.count - 1, id: \.self) { humanLast in
                Text("\(humansLast[humanLast]) people in \(humanLast + 1). generation")
            }
        }
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
