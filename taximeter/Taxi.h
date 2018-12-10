//
//  Taxi.h
//  taximeter
//
//  Created by Marlon Escobar on 2018-12-04.
//  Copyright © 2018 Marlon Escobar A. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Taxi : NSObject{
    double mileage;
    double balance;
    int totalTrips;
}
-(void)calculateFillUpGasTank:(double)price :(double) liters;
-(void)calculatePickUpPassenger:(double)income :(double) tripMileage;
-(double)calculateMileage:(double)timeTrip :(double)initialSpeed;
-(double)calculateFuelConsumption:(double)level :(double)hours :(double)initialSpeed;
-(void)calculateOnSiteRefuel:(double)feed;
-(void)setBalance:(double) money;
-(void)setMileage:(double) value;
-(double)getBalance;
-(int)getTotalTrips;
-(double)getMileage;
-(double)rangeOfHours:(NSString *) sTime :(NSString *) eTime;
-(double)compareDate:(NSString *)startTimeString :(NSString *)endTimeString;
-(int)separateDoubleNumber:(double) numberTime :(int) flag;

@end

NS_ASSUME_NONNULL_END
