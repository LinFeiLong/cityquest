//
//  GameMapView.swift
//  cityquest
//
//  Created by Bartos Nicolas on 24/10/2024.
//

import SwiftUI
import MapKit

struct GameMapView: View {
    //Position de la camera
    @State var cameraPosition: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        // Position : Marseille
        center: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698),
        // Zoom sur la Map
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    ))
    // C'est la variable pour l'itinéraire
    @State private var route: MKRoute?
    
    // Position de l'utilisateur régler sur Marseille
    @State private var userLocation = CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698)
    // Essai avec des Monuments
    @Binding var selectedMonument: Monument
    
    // Fonction pour avoir l'itineraire
    func getDirections(userLocation: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        self.route = nil
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .walking // .automobile
        
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
            zoomToFit(userLocation: userLocation, destination: destination)
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
        Map(position: $cameraPosition) {
            // Position de l'utlisateur (a garder ou nom lors de la vrai localisation)
            Annotation("Votre position", coordinate: userLocation) {
                Circle()
                    .fill(.blue)
                    .stroke(.white, style: StrokeStyle(lineWidth: 2))
                    .frame(width: 18)
            }
            // Position de tous les monuments de la liste
            ForEach(monuments) { monument in
                Annotation(monument.name, coordinate: monument.location) {
                    Circle()
                        .fill(.red)
                        .frame(width: 25)
                        .onTapGesture {
                            selectedMonument = monument
                        }
                }
            }
            // Si il y a un itinéraire
            if let route {
                MapPolyline(route)
                    .stroke(.green, lineWidth: 5)
            }
        }
        // Quand la map apparait charger le monument selectionné
        .onAppear {
            getDirections(userLocation: userLocation, destination: selectedMonument.location)
            
        }
        // Quand on change de monument on va chercher getDirection
        .onChange(of: selectedMonument) { oldValue, newValue in
            getDirections(userLocation: userLocation, destination: selectedMonument.location)
        }
    }
}

#Preview {
    @Previewable @State var test = monuments[0]
    GameMapView(selectedMonument: $test)
}
