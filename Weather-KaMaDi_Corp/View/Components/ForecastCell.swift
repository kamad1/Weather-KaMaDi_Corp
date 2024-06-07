//
//  ForecastCell.swift
//  WeatherApp
//
//  Created by Влад Мади on 06.06.2024.
//

import SwiftUI

struct ForecastCell: View {
    @StateObject var viewModel: ForecastCellViewModel
    @EnvironmentObject var weatherVM: WeatherViewModel
    var segment: Int { 100 / (weatherVM.maximumForecastTemp - weatherVM.minimumForecastTemp) }
    
    var width: CGFloat {
        (viewModel.forecast.main.tempMax - viewModel.forecast.main.tempMin) * 100 / Double((weatherVM.maximumForecastTemp - weatherVM.minimumForecastTemp))
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(viewModel.dateDescrFromUTC(viewModel.forecast.dt))
                Text(viewModel.timeDescrFromUTC(viewModel.forecast.dt))
            }
            .frame(width: 60)
            Text(viewModel.windDescription)
                .frame(width: 50)
            Spacer()
            VStack {
                Text(viewModel.temp)
                    .font(.callout)
                HStack {
                    Text(viewModel.tempMin)
                    ZStack(alignment: .leading) {
                        Capsule()
                            .frame(width: 100, height: 10)
                            .foregroundStyle(.gray)
                        Capsule()
                            .offset(x: CGFloat((Int(viewModel.forecast.main.tempMin) - weatherVM.minimumForecastTemp) * 100 / weatherVM.maximumForecastTemp - weatherVM.minimumForecastTemp))
                            .frame(width: width + 2, height: 10)
                            .foregroundStyle(.blue)
                    }
                    Text(viewModel.tempMax)
                }
            }
        }
        .font(.caption2)
    }
}

#Preview {
    ForecastCell(viewModel: 
            .init(forecast: .init(dt: 1717695968,
                                  main: .init(temp: 20, tempMin: 15, tempMax: 25, pressure: 768, humidity: 30),
                                  wind: .init(speed: 6, deg: 200))))
}
