//
//  GameTesting.swift
//  cityquest
//
//  Created by Bartos Nicolas on 24/10/2024.
//

import Foundation

var monuments: [Monument] = [
    Monument(
        name: "Basilique Notre-Dame de la Garde",
        description: "La “Bonne Mère” est l’un des symboles les plus connus de Marseille, située au sommet d’une colline offrant une vue panoramique sur la ville et la Méditerranée.",
        image: ".imageTestMonument",
        latitude: 43.28419512064788,
        longitude: 5.371275992866273,
        questions: [],
        wikipedia_page_url: "https://fr.wikipedia.org/wiki/Basilique_Notre-Dame-de-la-Garde"
    ),
    Monument(
        name: "Cathédrale La Major (Cathédrale Sainte-Marie-Majeure)",
        description: "Une cathédrale impressionnante de style romano-byzantin située près du port, à l’entrée du quartier du Panier.",
        image: "unknown",
        latitude: 43.30008871502034,
        longitude: 5.364932600356038,
        questions: [],
        wikipedia_page_url: "https://fr.wikipedia.org/wiki/Basilique_Notre-Dame-de-la-Garde"
    ),
    Monument(
        name: "Fort Saint-Jean",
        description: "Ce fort historique, situé à l’entrée du Vieux-Port, fait partie du musée des civilisations de l’Europe et de la Méditerranée (Mucem).",
        image: ".unknown",
        latitude: 43.295929994228885,
        longitude: 5.362015963357571,
        questions: [],
        wikipedia_page_url: "https://fr.wikipedia.org/wiki/Basilique_Notre-Dame-de-la-Garde"
    ),
    Monument(
        name: "Palais Longchamp",
        description: "Un monument dédié aux arts et à l’eau, avec un magnifique parc, abritant le musée des Beaux-Arts et le musée d’Histoire Naturelle.",
        image: ".imageTestMonument",
        latitude: 43.30434094193662,
        longitude: 5.3945555693507785,
        questions: [],
        wikipedia_page_url: "https://fr.wikipedia.org/wiki/Basilique_Notre-Dame-de-la-Garde"
    ),
    Monument(
        name: "Château d’If",
        description: "Une forteresse sur une île au large de Marseille, célèbre pour avoir été la prison fictive d’Edmond Dantès dans “Le Comte de Monte-Cristo” d’Alexandre Dumas.",
        image: ".imageTestMonument",
        latitude: 43.28035875358548,
        longitude: 5.325267824949334,
        questions: [],
        wikipedia_page_url: "https://fr.wikipedia.org/wiki/Basilique_Notre-Dame-de-la-Garde"
    ),
]


var cityTest = City(
    name: "Marseille",
    description: "Marseille, située dans le sud de la France, est une ville portuaire dynamique sur la mer Méditerranée, connue pour sa riche histoire et sa diversité culturelle. Fondée par les Grecs vers 600 avant J.-C., elle est la plus ancienne ville de France. Son Vieux-Port, animé par des marchés de poissons et bordé de cafés, est un lieu emblématique qui incarne l’esprit méditerranéen de la ville. Marseille est également célèbre pour la basilique Notre-Dame-de-la-Garde, perchée sur une colline, offrant une vue panoramique sur la ville et la mer, ainsi que pour sa spécialité culinaire, la bouillabaisse, un plat de poisson typique de la région.",
    coordinate: Coordinate(latitude: 43.28035875358548, longitude: 5.325267824949334),
    image: ".marseilleAmarelo",
    monuments: monuments,
    wikipedia_page_url: "https://fr.wikipedia.org/wiki/Marseille"
)

