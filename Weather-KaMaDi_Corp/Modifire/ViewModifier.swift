

import SwiftUI

struct GlassBG: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.darkBG.opacity(0.4))
            .background {
                RoundedRectangle(cornerRadius: 36)
                    .stroke(.white.opacity(0.4), style: .init(lineWidth: 2))
            }
            .clipShape(.rect(cornerRadius: 36))
            .padding()
    }
}
