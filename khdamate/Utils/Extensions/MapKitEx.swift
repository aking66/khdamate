/************************* Mo’min J.Abusaada *************************/
//
//  MapKitEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import Foundation
import MapKit

extension MKMapView {
    private struct storeProperty {
        static var isShowAllAnnotiations: Bool = false
    }
    var isShowAllAnnotiations: Bool {
        get {
            guard let isShowAllAnnotiations = objc_getAssociatedObject(self, &storeProperty.isShowAllAnnotiations) as? Bool else {
                return false
            }
            return isShowAllAnnotiations
        }
        set {
            objc_setAssociatedObject(self, &storeProperty.isShowAllAnnotiations, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
        
    func addMarker(coordinate: CLLocationCoordinate2D, image: String? = nil, object: Any? = nil, title: String? = nil) {
        let pointAnnotation = CustomPointAnnotation()
        pointAnnotation.title = title
        pointAnnotation.coordinate = coordinate
        pointAnnotation.object = object
        pointAnnotation.image = image
        self.addAnnotation(pointAnnotation)
        if self.isShowAllAnnotiations {
            let allAnnotations = self.annotations
            self.showAnnotations(allAnnotations, animated: true)
        }
    }
    
    func mapViewOwnDelegate(_ mapView: MKMapView, viewFor annotation: MKAnnotation, defualtMarkerImage: String = KDefaultImageName, ownConfigtation: @escaping ((MKAnnotationView, CustomPointAnnotation) -> (Void))) -> MKAnnotationView? {
        if annotation is MKUserLocation {return nil}
        guard let  annotation =  annotation as? CustomPointAnnotation else { return nil}
        let identifier = "annotationView"
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        } else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        if let annotationView = annotationView { // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = annotation.image != nil ? "\(annotation.image ?? defualtMarkerImage)".image_ : nil
            ownConfigtation(annotationView, annotation)
        }
        return (annotationView?.image != nil) ? annotationView :  nil
    }
}

class CustomPointAnnotation: MKPointAnnotation {
    var object: Any?
    var image: String?
}

extension CLLocation {
    func stringFromLocation(completion: @escaping (_ fullAddress: String, _ error: Error?)->()) {
        let geocoder = CLGeocoder.init()
        geocoder.reverseGeocodeLocation(self, completionHandler: { (placemarks, error) in
            completion(placemarks?.first?.fullAddress ?? "Unknown", error)
        })
    }
}

extension CLPlacemark {
    var fullAddress : String {
        return [subThoroughfare, thoroughfare, locality, administrativeArea, postalCode, country]
            .compactMap({ $0 })
            .joined(separator: " - ")
    }
}
