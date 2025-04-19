//
//  ContentView.swift
//  Aula
//
//  Created by Francisco Totaro on 18/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Weather Forecast")
                .font(.largeTitle)
                .fontWeight(.semibold)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    DayForecast(day: "Mon", high: 70, low: 50, isRainy: false)
                    
                    DayForecast(day: "Tue", high: 60, low: 40, isRainy: true)
                    
                    DayForecast(day: "Wed", high: 80, low: 56, isRainy: true)
                    
                    DayForecast(day: "Thu", high: 90, low: 78, isRainy: true)
                    
                    DayForecast(day: "Fri", high: 91, low: 80, isRainy: false)
                    
                    DayForecast(day: "Sat", high: 86, low: 66, isRainy: false)
                    
                    DayForecast(day: "Sun", high: 81, low: 53, isRainy: false)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let high: Int
    let low: Int
    let isRainy: Bool
    
    var iconName: String{
        if isRainy{
            return "cloud.rain.fill"
        }
        else{
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color{
        if isRainy{
            return Color.blue
        }
        else{
            return Color.yellow
        }
    }
    
    var textColor: Color{
        if high >= 90{
            return Color.red
        }
        else if high > 90 && high >= 75{
            return Color.yellow
        }
        else if high > 75 && high >= 60{
            return Color.blue
        }
        else{
            return Color.gray
        }
    }
    
    var body: some View {
        VStack{
            Text(day)
                .font(.headline)
                .foregroundStyle(textColor)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.largeTitle)
                .padding(5)
            Text("High: \(high)")
                .fontWeight(.semibold)
            Text("Low: \(low)")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
    }
}

