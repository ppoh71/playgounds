//: Playground - noun: a place where people can play

/*
*
* calculate the center point of multiple latitude longitude coordinate-pairs
*
*/



import CoreLocation
import GLKit

var LocationPoints = [CLLocationCoordinate2D]()

//add some points to Location ne, nw, sw, se , it's a rectangle basicaly
LocationPoints.append(CLLocationCoordinate2D(latitude: 37.627512369999998, longitude: -122.38780611999999))
LocationPoints.append(CLLocationCoordinate2D(latitude: 37.627512369999998, longitude:  -122.43105867))
LocationPoints.append(CLLocationCoordinate2D(latitude: 37.56502528, longitude: -122.43105867))
LocationPoints.append(CLLocationCoordinate2D(latitude: 37.56502528, longitude: -122.38780611999999))


func getCenterCoord(LocationPoints: [CLLocationCoordinate2D]) -> CLLocationCoordinate2D{
    
    var x:Float = 0.0;
    var y:Float = 0.0;
    var z:Float = 0.0;
    
    for points in LocationPoints {
        
     let lat = GLKMathDegreesToRadians(Float(points.latitude));
     let long = GLKMathDegreesToRadians(Float(points.longitude));
        
        x += cos(lat) * cos(long);
        y += cos(lat) * sin(long);
        z += sin(lat);
    }
    
    x = x / Float(LocationPoints.count);
    y = y / Float(LocationPoints.count);
    z = z / Float(LocationPoints.count);
    
    let resultLong = atan2(y, x);
    let resultHyp = sqrt(x * x + y * y);
    let resultLat = atan2(z, resultHyp);
    
    
    
    let result = CLLocationCoordinate2D(latitude: CLLocationDegrees(GLKMathRadiansToDegrees(Float(resultLat))), longitude: CLLocationDegrees(GLKMathRadiansToDegrees(Float(resultLong))));
    
    return result;
    
}

var centerPoint = getCenterCoord(LocationPoints)
print("Latitude: \(centerPoint.latitude) / Longitude: \(centerPoint.longitude)")

