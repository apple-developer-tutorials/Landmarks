//
//  LandmarksList.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Chris Hand on 8/11/22.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelData
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        /*
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad Pro (12.9-inch) (2nd generation)"], id: \.self) { deviceName in
            LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        */
    }
}
