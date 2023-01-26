//
//  ContentView.swift
//  Clima SwiftUI
//
//  Created by Vũ Chiến Thắng on 24/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State var searchCityName: String = ""
    @State var temperature: String = "--"
    @State var cityName: String = "Moscow"
    
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .trailing) {
                HStack {
                    
                    //LocationButton
                    Button(action: {
                        //
                    }) {
                        ImageButtonView(systemName: "location.circle")
                    }
                    
                    TextField("Type a city name", text: $searchCityName)
                        .background(Color.white.opacity(0.25).cornerRadius(18))
                        .font(.system(size: 25))
                        .padding(3)
                    
                    Button(action: {
                        //
                    }) {
                        ImageButtonView(systemName: "magnifyingglass")
                    }
                    
                }
                .padding(.bottom)
                
                VStack(alignment: .trailing) {
                    Image(systemName: "snowflake")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color(UIColor(named: "weatherColor")!))
                    Text("\(temperature)°C")
                        .foregroundColor(Color(UIColor(named: "weatherColor")!))
                        .font(.system(size: 100))
                        .padding(.bottom)
                    Text("\(cityName)")
                        .foregroundColor(Color(UIColor(named: "weatherColor")!))
                        .font(.system(size: 28))
                        .bold()
                    
                }
                
                Spacer()
            }
            .padding(20)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


