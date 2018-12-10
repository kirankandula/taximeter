//
//  Trip.m
//  taximeter
//
//  Created by Marlon Escobar on 2018-12-04.
//  Copyright © 2018 Marlon Escobar A. All rights reserved.
//

#import "Trip.h"

@implementation Trip



-(id)initTrip:(NSString*)stime :(NSString*)etime : (double)ispeed : (double) cost : (double) mileage : (double) fuelConsumption{
    self=[super init];
    [self setStartTrip:stime];
    [self setEndTrip:etime];
    [self setInitialSpeed:ispeed];
    [self setCostTrip:cost];
    [self setMileage:mileage];
    [self setFuelConsumption:fuelConsumption];

    return self;
}

-(void)setStartTrip:(NSString*)value{
    startTime = value;
}
-(void)setEndTrip:(NSString*)value{
    endTime = value;
}
-(void)setInitialSpeed:(double)value{
    initialSpeed = value;
}
-(void)setCostTrip:(double)value{
    costTrip = value;
}

-(void)setMileage:(double) value{
    mileage = value;
}

-(void)setFuelConsumption:(double)value{
    fuelConsumption = value;
}


-(NSString*)getStartTrip{
    return startTime;
}
-(NSString*)getEndTrip{
    return endTime;
}
-(double)getInitialSpeed{
    return initialSpeed;
}
-(double)getCostTrip{
    return costTrip;
}

-(double)getMileage{
    return mileage;
}

-(double)getFuelConsumption{
    return fuelConsumption;
}



@end
