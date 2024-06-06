
import SwiftUI

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        VStack {
            VStack {
                TextField("Город", text: $viewModel.cityName)
                    .multilineTextAlignment(.center)
                    .font(.regular20)
                    .padding(4)
                    .background(.black.opacity(0.6))
                    .clipShape(.rect(cornerRadius: 14))
                Text(viewModel.temp)
                    .font(.largeBold)
                    .overlay(alignment: .leading) {
                        Text(viewModel.tempMin)
                            .offset(x: -70)
                    }
                    .overlay(alignment: .trailing) {
                        Text(viewModel.tempMax)
                            .offset(x: 70)
                    }
                Text(viewModel.pressure).font(.regular)
                Text(viewModel.humidity).font(.regular)
                Text(viewModel.windDescription).font(.regular)
            }
            .modifier(GlassBG())
            List {
                
            }
            .listStyle(.plain)
            .modifier(GlassBG())
        }
        // для изменения города в текстфилде onChange получаем новые данные каждый раз когда меняется город
        .onChange(of: viewModel.cityName) {
            viewModel.getData()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image(.bg)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    WeatherView()
}

// Расширение для шрифта
extension Font {
    static var regular: Font { .custom("AvenirNext-regular", size: 16) }
    static var regular20: Font { .custom("AvenirNext-regular", size: 20) }
    static var largeBold: Font { .custom("AvenirNext-Bold", size: 50) }
}


