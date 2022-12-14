//
//  ContentView.swift
//  PScan
//
//  Created by berkay on 1.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scannerSheet: Bool = false
    @State private var texts: [ScanData] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if texts.count > 0 {
                    List {
                        ForEach(texts) { text in
                            NavigationLink(destination: ScrollView {
                                Text(text.content)
                            }, label: {
                                Text(text.content).lineLimit(1)
                            })
                        }
                    }
                } else {
                    Text("No scan yet").font(.title)
                }
            }
            .navigationTitle("PScan")
            .navigationBarItems(trailing: Button {
                scannerSheet.toggle()
            } label: {
                Image(systemName: "doc.text.viewfinder")
            })
            .sheet(isPresented: $scannerSheet) {
                makeScannerView()
            }
        }
    }
    
    private func makeScannerView() -> ScannerView {
        ScannerView { textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.scannerSheet = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
