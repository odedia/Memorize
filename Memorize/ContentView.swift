//
//  ContentView.swift
//  Memorize
//
//  Created by Oded Shopen on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
   @State var emojis = ["🚂", "🛺", "🚌", "🚀", "🚃", "🛵", "🛻", "⛵️", "⛽️", "✈️", "⛴", "🛳", "🚲", "🏍", "🏎", "🛥", "🛩", "🚁", "🚉", "🚊", "🚈", "🚋", "🚇", "🚒"]
    @State var emojiCount = 15
    
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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojiCount) ))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding(.top)
            .foregroundColor(.red)
            Spacer()
            VStack {
                HStack {
                    vehiclesTheme
                    Spacer()
                    smiliesTheme
                    Spacer()
                    sportsTheme
                }
                HStack {
                    remove
                    Spacer()
                    add
                }
                .padding(.top)
                .font(.largeTitle)
            }
            .padding(.horizontal)
            .font(.body)
        }
        .padding(.horizontal)
    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        if (cardCount == 1) {
            return 200
        } else if (cardCount < 5) {
            return 150
        } else if (cardCount < 10) {
            return 100
        } else if (cardCount < 17) {
            return 75
        }
        return 65

    }
    var vehiclesTheme: some View {
        Button(action: {
            emojis = ["🚂", "🛺", "🚌", "🚀", "🚃", "🛵", "🛻", "⛵️", "⛽️", "✈️", "⛴", "🛳", "🚲", "🏍", "🏎", "🛥", "🛩", "🚁", "🚉", "🚊", "🚈", "🚋", "🚇", "🚒"].shuffled()
            emojiCount = Int.random(in: 4..<emojis.count)
        }, label:{
            VStack {
                Text("Vehicles")
                Image(systemName: "car.fill")
            }
            
        })
    }

    var smiliesTheme: some View {
        Button(action: {
            emojis = ["😀","😄","😁","😆","😗","😘","😍","😎","😔","😒","😏","🥺","😡","😳","🤯","☹️","🤩"].shuffled()
            emojiCount = Int.random(in: 4..<emojis.count)
            
        }, label:{
            VStack {
                Text("Smilies")
                Image(systemName: "face.smiling")
            }
        })
    }

    var sportsTheme: some View {
        Button(action: {
            emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🪁","🥊","⛷"].shuffled()
            emojiCount = Int.random(in: 4..<emojis.count)
            
        }, label:{
            VStack {
                Text("Sports")
                Image(systemName: "sportscourt")
            }
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
            .disabled(emojiCount == 1)
    }
    
    var add: some View {
        return Button(action: {
            if (emojiCount < emojis.count) {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
            .disabled(emojiCount == emojis.count)
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
