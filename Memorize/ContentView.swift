//
//  ContentView.swift
//  Memorize
//
//  Created by Oded Shopen on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
   @State var emojis = ["🚂", "🛺", "🚌", "🚀", "🚃", "🛵", "🛻", "⛵️", "⛽️", "✈️", "⛴", "🛳", "🚲", "🏍", "🏎", "🛥", "🛩", "🚁", "🚉", "🚊", "🚈", "🚋", "🚇", "🚒"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            HStack {
                Text("Memorize!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65 ))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding(.top)
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehiclesTheme
                Spacer()
                smiliesTheme
                Spacer()
                sportsTheme
//                remove
//                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var vehiclesTheme: some View {
        Button(action: {
            emojis = ["🚂", "🛺", "🚌", "🚀", "🚃", "🛵", "🛻", "⛵️", "⛽️", "✈️", "⛴", "🛳", "🚲", "🏍", "🏎", "🛥", "🛩", "🚁", "🚉", "🚊", "🚈", "🚋", "🚇", "🚒"]
        }, label:{
            Image(systemName: "car.fill")
        })
    }

    var smiliesTheme: some View {
        Button(action: {
            emojis = ["😀","😄","😁","😆","😗","😘","😍","😎","😔","😒","😏","🥺","😡","😳","🤯","☹️","🤩"]
            
        }, label:{
            Image(systemName: "face.smiling")
        })
    }

    var sportsTheme: some View {
        Button(action: {
            emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🪁","🥊","⛷"]
            
        }, label:{
            Image(systemName: "sportscourt")
        })
    }


    var remove: some View {
        Button(action: {
            if (emojiCount > 1) {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var add: some View {
        return Button(action: {
            if (emojiCount < emojis.count) {
                emojiCount += 1
            }
            
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
        
    }
}
