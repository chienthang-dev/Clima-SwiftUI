//
//  ContentView.swift
//  Clima SwiftUI
//
//  Created by Vũ Chiến Thắng on 24/01/2023.
//

import SwiftUI
import CoreLocation

var weatherManager = WeatherManager()

struct ContentView: View {
    @State var searchCityName: String = ""
    @State var temperature: String = "--"
    @State var cityName: String = "Moscow"
    @State var condition: String = "snowflake"
    
    var locationManager = LocationManger()
    
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .trailing) {
                HStack {
                    
                    //LocationButton
                    Button(action: {
                        locationManager.requestLocation()
                    }) {
                        ImageButtonView(systemName: "location.circle")
                    }
                    
                    TextField("Type a city name", text: $searchCityName)
                        .background(Color.white.opacity(0.25).cornerRadius(18))
                        .font(.system(size: 25))
                        .padding(3)
                        .onSubmit {
                            weatherManager.fetchWeather(with: searchCityName)                            
                        }
                    
                    //search button
                    Button(action: {
                        weatherManager.fetchWeather(with: searchCityName)
                        searchCityName = ""
                        
                    }) {
                        ImageButtonView(systemName: "magnifyingglass")
                    }
                    
                }
                .padding(.bottom)
                
                VStack(alignment: .trailing) {
                    Image(systemName: condition)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color(UIColor(named: "weatherColor")!))
                    Text("\(temperature) °C")
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
        .onAppear {
            weatherManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - update ui
extension ContentView: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async { [self] in
            condition = weather.conditionName
            temperature = weather.temperatureString
            cityName = weather.name
        
        }
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    
}

//MARK: - add location track

class LocationManger: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func requestWhenInUseAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first?.coordinate {
            weatherManager.fetchWeather(latitude: location.latitude, longitude: location.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}



