//
//  Trip.h
//  taximeter
//
//  Created by Marlon Escobar on 2018-12-04.
//  Copyright © 2018 Marlon Escobar A. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Trip : NSObject{
    NSString *startTime;
    NSString *endTime;
    double initialSpeed;
    double costTrip;
    double mileage;
    double fuelConsumption;
    
}

-(id)initTrip:(NSString*)stime :(NSString*)etime : (double)ispeed : (double) cost : (double) mileage : (double) fuelConsumption;
-(void)setStartTrip:(NSString*)value;
-(void)setEndTrip:(NSString*)value;
-(void)setInitialSpeed:(double)value;
-(void)setCostTrip:(double)value;
-(NSString*)getStartTrip;
-(NSString*)getEndTrip;
-(void)setMileage:(double)value;
-(void)setFuelConsumption:(double)value;
-(double)getInitialSpeed;
-(double)getCostTrip;
-(double)getMileage;
-(double)getFuelConsumption;


@end

NS_ASSUME_NONNULL_END
