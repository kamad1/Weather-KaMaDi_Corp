
import SwiftUI

struct ContentView: View {
    @State private var cityName: String = "Пермь"
    
    var body: some View {
        VStack {
            VStack {
                TextField("Город", text: $cityName)
                    .multilineTextAlignment(.center)
                    .font(.custom("AvenirNext-regular", size: 20))
                    .padding(4)
                    .background(.black.opacity(0.6))
                    .clipShape(.rect(cornerRadius: 14))
                
                Text("+20°С")
                    .font(.custom("AvenirNext-Bold", size: 50))
                    .overlay(alignment: .leading) {
                        Text("+15°C")
                            .offset(x: -70)
                    }
                    .overlay(alignment: .trailing) {
                        Text("+25°C")
                            .offset(x: 70)
                    }
                Text("765 мм.рт.ст")
                    .font(.custom("AvenirNext-regular", size: 16))
                Text("Влажность 30%")
                    .font(.custom("AvenirNext-regular", size: 16))
                Text("СЗ 4 м/с")
                    .font(.custom("AvenirNext-regular", size: 16))
            }
            .modifier(GlassBG())
            
            List {
                
            }
            .listStyle(.plain)
            .modifier(GlassBG())
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
    ContentView()
}



