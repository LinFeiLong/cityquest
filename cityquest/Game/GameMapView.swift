//
//  GameMapView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 24/10/2024.
//

import SwiftUI
import MapKit

struct GameMapView: View {
    @Environment(GameManager.self ) var gameManager: GameManager
    //Position de la camera
    @State var cameraPosition: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        // Position : Marseille
        center: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698),
        // Zoom sur la Map
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    ))
    
    // Position de l'utilisateur régler sur Marseille
    @State private var userLocation = CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698)
    
    //Monument actuellement selectionné
    var selectedMonument: Monument? {
        if gameManager.currentGame.steps.isEmpty {
            return nil
        } else {
            return gameManager.currentGame.steps[gameManager.currentGame.indexOfStep].place
        }
    }
    
    let colors: [Color]
    
    // Fonction pour avoir l'itineraire
    func getDirections(userLocation: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
//        self.route = nil
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .walking // .automobile
        
        Task {
            do {
                let directions = MKDirections(request: request)
                let response = try? await directions.calculate()
                if ((response?.routes.first) != nil) {
                    gameManager.currentRoute = response?.routes.first
                } else {
                    gameManager.currentRoute = nil
                }
                zoomToFit(userLocation: userLocation, destination: destination)
            }
        }
    }

    // Fonction centrer sur la totalité de l'itinéraire
    private func zoomToFit(userLocation: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        // Coordonnées minimales et maximales
        let minLat = min(userLocation.latitude, destination.latitude)
        let maxLat = max(userLocation.latitude, destination.latitude)
        let minLon = min(userLocation.longitude, destination.longitude)
        let maxLon = max(userLocation.longitude, destination.longitude)
        
        // Centre sur la région
        let centerLat = (minLat + maxLat) / 2
        let centerLon = (minLon + maxLon) / 2
        // Variable qui contient le centre entre les localisations
        let centerCoordinate = CLLocationCoordinate2D(latitude: centerLat, longitude: centerLon)
        
        // Zoom sur la région avec un petit padding
        let latDelta = (maxLat - minLat) * 1.5
        let lonDelta = (maxLon - minLon) * 1.5
        // Variable qui contient le Zoom
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        // remplacer la region avec animation
        withAnimation(.easeIn(duration: 5)) {
            cameraPosition = .region(MKCoordinateRegion(center: centerCoordinate, span: span))
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $cameraPosition) {
                // Position de l'utlisateur (a garder ou nom lors de la vrai localisation)
                Annotation("Votre position", coordinate: userLocation) {
                    Circle()
                        .fill(colors[0])
                        .stroke(colors[1], style: StrokeStyle(lineWidth: 3))
                        .frame(width: 17)
                }
                // Position de tous les monuments de la liste
                ForEach(gameManager.currentGame.steps) { step in
                    Annotation(step.place.name, coordinate: step.place.location) {
                        AnnotationAnimationView(step: step, colors: colors)
                    }
                }
                // Si il y a un itinéraire
                if let route = gameManager.currentRoute {
                    MapPolyline(route)
                        .stroke(colors[0], lineWidth: 5)
                }
            }
            // Enleve tous les points d'interets
            .mapStyle(.standard(pointsOfInterest: .excludingAll))
            // Quand la map apparait charger le monument selectionné
            .onAppear {
                if let selectedMonument {
                    getDirections(userLocation: userLocation, destination: selectedMonument.location)
                }
                
            }
            // Quand on change de monument on va chercher getDirection
            .onChange(of: selectedMonument) { oldValue, newValue in
                if let selectedMonument {
                    getDirections(userLocation: userLocation, destination: selectedMonument.location)
                }
            }
        }
    }
}

struct AnnotationAnimationView: View {
    @Environment(GameManager.self ) var gameManager: GameManager
    let step: Step
    let colors: [Color]
    
    var isSelected: Bool {
        gameManager.currentGame.currentStep == step
    }
    
    var stepIndex: Int {
        gameManager.currentGame.steps.firstIndex(where: { $0.id == step.id }) ?? 99
    }
    
    @State var anim1: Bool = false
    @State var anim2: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if isSelected {
                    Circle()
                        .fill(colors[0].opacity(0.2))
                        .frame(width: 60)
                        .scaleEffect(anim1 ? 0.5 : 1)
                    Circle()
                        .fill(colors[0].opacity(0.4))
                        .frame(width: 45)
                        .scaleEffect(anim1 ? 0.4 : 1)
                }
                ZStack {
                    Circle()
                        .fill(colors[0])
                        .frame(width: 25)
                    Text(String(stepIndex + 1))
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundStyle(colors[1])
                    
                }
                
            }
            .onAppear {
                if isSelected {
                    animate()
                }
            }
            .onChange(of: isSelected) { oldValue, newValue in
                animate()
            }
            Text(step.place.name)
                .foregroundStyle(.accent)
                .font(.headline)
        }
    }
    func animate() {
        withAnimation(.easeIn(duration: 0.6)) {
            anim1.toggle()
            anim2.toggle()
        } completion: {
            if isSelected {
                Task {
                    try await Task.sleep(for: .seconds(0.001))
                    self.animate()
                }
            }
        }
    }
}

#Preview {
    GameMapView(colors: [.mainDark, .accent])
        .environment(GameManager())
}
