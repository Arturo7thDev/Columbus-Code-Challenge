//
//  Atom.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation
import Alamofire

public class Atoms {
    static func cloudCover(value: Int) -> String{
        switch value {
        case 1:
            return "Cloud Cover: 0%-6%"
        case 2:
            return "Cloud Cover: 6%-19%"
        case 3:
            return "Cloud Cover: 19%-31%"
        case 4:
            return "Cloud Cover: 31%-44%"
        case 5:
            return "Cloud Cover: 44%-56%"
        case 6:
            return "Cloud Cover: 56%-69%"
        case 7:
            return "Cloud Cover: 69%-81%"
        case 8:
            return "Cloud Cover: 81%-94%"
        case 9:
            return "Cloud Cover: 94%-100%"
        default:
            return "Cloud Cover: Data Error"
        }
    }
    
    static func liftedIndex(value: Int) -> String{
        switch value {
        case -10:
            return "Below -7"
        case -6:
            return "-7 to -5"
        case -4:
            return "-5 to -3"
        case -1:
            return "-3 to 0"
        case 2:
            return "0 to 4"
        case 6:
            return "4 to 8"
        case 10:
            return "8 to 11"
        case 15:
            return "Over 11"
        default:
            return "Data Error"
        }
    }
    
    static func rh2m(value: Int) -> String{
        switch value {
        case -4:
            return "2m Relative Humidity: 0%-5%"
        case -3:
            return "2m Relative Humidity: 5%-10%"
        case -2:
            return "2m Relative Humidity: 10%-15%"
        case -1:
            return "2m Relative Humidity: 15%-20%"
        case 0:
            return "2m Relative Humidity: 20%-25%"
        case 1:
            return "2m Relative Humidity: 25%-30%"
        case 2:
            return "2m Relative Humidity: 30%-35%"
        case 3:
            return "2m Relative Humidity: 35%-40%"
        case 4:
            return "2m Relative Humidity: 40%-45%"
        case 5:
            return "2m Relative Humidity: 45%-50%"
        case 6:
            return "2m Relative Humidity: 50%-55%"
        case 7:
            return "2m Relative Humidity: 55%-60%"
        case 8:
            return "2m Relative Humidity: 60%-65%"
        case 9:
            return "2m Relative Humidity: 65%-70%"
        case 10:
            return "2m Relative Humidity: 70%-75%"
        case 11:
            return "2m Relative Humidity: 75%-80%"
        case 12:
            return "2m Relative Humidity: 80%-85%"
        case 13:
            return "2m Relative Humidity: 85%-90%"
        case 14:
            return "2m Relative Humidity: 90%-95%"
        case 15:
            return "2m Relative Humidity: 95%-99%"
        case 16:
            return "2m Relative Humidity: 100%"
        default:
            return "2m Relative Humidity: Data Error"
        }
    }
    
    static func wind10m(value: Int) -> String{
        switch value {
        case 1:
            return "10m Wind Speed: Below 0.3m/s (calm)"
        case 2:
            return "10m Wind Speed: 0.3-3.4m/s (light)"
        case 3:
            return "10m Wind Speed: 3.4-8.0m/s (moderate)"
        case 4:
            return "10m Wind Speed: 8.0-10.8m/s (fresh)"
        case 5:
            return "10m Wind Speed: 10.8-17.2m/s (strong)"
        case 6:
            return "10m Wind Speed: 17.2-24.5m/s (gale)"
        case 7:
            return "10m Wind Speed: 24.5-32.6m/s (storm)"
        case 8:
            return "10m Wind Speed: Over 32.6m/s (hurricane)"
        default:
            return "10m Wind Speed: Data Error"
        }
    }
    
    static func seeing(value: Int) -> String{
        switch value {
        case 1:
            return #"Seeing: <0.5""#
        case 2:
            return #"Seeing: 0.5"-0.75""#
        case 3:
            return #"Seeing: 0.75"-1""#
        case 4:
            return #"Seeing: 1"-1.25""#
        case 5:
            return #"Seeing: 1.25"-1.5""#
        case 6:
            return #"Seeing: 1.5"-2""#
        case 7:
            return #"Seeing: 2"-2.5""#
        case 8:
            return #"Seeing: >2.5""#
        default:
            return "Seeing: Data Error"
        }
    }
    
    static func trasnparency(value: Int) -> String{
        switch value {
        case 1:
            return "Transparency: <0.3"
        case 2:
            return "Transparency: 0.3-0.4"
        case 3:
            return "Transparency: 0.4-0.5"
        case 4:
            return "Transparency: 0.5-0.6"
        case 5:
            return "Transparency: 0.6-0.7"
        case 6:
            return "Transparency: 0.7-0.85"
        case 7:
            return "Transparency: 0.85-1"
        case 8:
            return "Transparency: >1"
        default:
            return "Transparency: Data Error"
        }
    }
    
}
