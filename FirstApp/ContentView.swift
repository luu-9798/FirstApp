//
//  ContentView.swift
//  First App
//
//  Created by Trung Luu on 5/19/22.
//

import SwiftUI

struct ContentView: View {
    @MainActor class ViewModel: ObservableObject {
        @Published public private(set) var numOfClicks: Int = 0
        
        func updateNumOfClicks() {
            numOfClicks += 1
            
            if (numOfClicks > 5) {
                numOfClicks = 0
            }
        }
    }
    
    @State var vstackColor: Color = .white
    @State var buttonColor: Color = .blue
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            Button(action: onButtonClick) {
                Text("Click to change background")
                    .foregroundColor(Color.white)
                    .padding()
            }
            .background(buttonColor)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
          )
        .background(vstackColor)
    }
    
    func onButtonClick() {
        viewModel.updateNumOfClicks()
        
        if(viewModel.numOfClicks % 2 == 0) {
            vstackColor = Color.white
            buttonColor = Color.blue
        } else {
            vstackColor = Color.black
            buttonColor = Color.orange
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
