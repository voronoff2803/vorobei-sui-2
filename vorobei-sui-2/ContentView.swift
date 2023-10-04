//
//  ContentView.swift
//  vorobei-sui-2
//
//  Created by Alexey Voronov on 04.10.2023.
//

import SwiftUI


struct LabelView: UIViewRepresentable {
    var text: NSAttributedString

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        label.clipsToBounds = true

        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = text
    }
}


struct ContentView: View {
    @State private var containerWidth: CGFloat = 300
    
    var helloAttributedString: NSAttributedString {
        let first = NSMutableAttributedString(string: "Мрафон ",
                                              attributes: [.font: UIFont.systemFont(ofSize: 20),
                                                           .foregroundColor: UIColor.gray])
        let second = NSMutableAttributedString(string: "по Swift UI\n",
                                               attributes: [.font: UIFont.systemFont(ofSize: 20),
                                                            .foregroundColor: UIColor.black])
        let third = NSMutableAttributedString(string: "\"Отцовский пинок\"",
                                              attributes: [.font: UIFont.boldSystemFont(ofSize: 27),
                                                           .foregroundColor: UIColor.systemBlue])
        first.append(second)
        first.append(third)
        return first
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Text container
            ZStack {
                // Background with red border
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.red, lineWidth: 2)
                
                // Text
                LabelView(text: helloAttributedString)
                    .frame(width: containerWidth, alignment: .leading) // Limit the width to containerWidth
            }
            .frame(width: containerWidth)
            
            // Slider
            Slider(value: $containerWidth, in: 50...300, step: 1)
            Text("Container Width: \(Int(containerWidth))pt")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
