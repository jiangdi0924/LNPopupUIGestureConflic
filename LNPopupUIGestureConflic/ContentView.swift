//
//  ContentView.swift
//  LNPopupUIGestureConflic
//
//  Created by Norton on 2023/8/31.
//

import SwiftUI
import CompactSlider
import LNPopupUI


struct ContentView: View {
    @AppStorage("cfplayer_playback_rate") var playback_rate: Double = 1.0

    @State var tabSelection = 0
    @State var isShowAudioBar = true
    @State var isPopupOpen = false
    @State var isPlaying = false

    @State private var sliderState: CompactSliderState = .zero

    var body: some View {
        VStack {
            TabView(selection: $tabSelection) {
                //          AppView()
                //            .tabItem {
                //              Label(LocalizedStringKey("Podcasts"), systemImage: "square.grid.3x3.fill")
                //            }
                //            .tag(1)
                Text("A")
                    .tabItem {
                        Label(LocalizedStringKey("Podcasts"), systemImage: "square.grid.3x3.fill")
                    }
                    .tag(1)
                
                Text("b")
                    .tabItem {
                        Label("tab.trending", systemImage: "chart.bar.fill")
                    }
                    .tag(3)
                
            }
        }
        .popup(isBarPresented: $isShowAudioBar, isPopupOpen: $isPopupOpen) {
            VStack (alignment: .center) {
                Text("The lower slider can't be dragged.")
                CompactSlider(value: $playback_rate, in: 0.5...3, step: 0.1) {
                    Spacer()
                    Text("\(playback_rate)")
                }.padding()
            }

        }
        .popupCloseButtonStyle(.default)
        .popupInteractionStyle(.snap)
        .popupBarCustomView() {
            VStack {
                Text("Click me")
                    .font(.title2)
                    .padding()
            }
        }

    }
}





