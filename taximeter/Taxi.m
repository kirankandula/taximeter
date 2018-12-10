//
//  Taxi.m
//  taximeter
//
//  Created by Marlon Escobar on 2018-12-04.
//  Copyright © 2018 Marlon Escobar A. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi
-(void)calculateFillUpGasTank:(double)price :(double) liters{
    balance -= price * liters;
}

-(void)calculatePickUpPassenger:(double)income :(double) tripMileage{
    balance += income;
    mileage += tripMileage;
    if (income != 0){
        totalTrips++;
    }
}


-(void)calculateOnSiteRefuel:(double)feed{
    balance -= feed;
}


-(double)calculateMileage:(double)timeTrip :(double)initialSpeed{
//    NSLog(@"time hours when enter to method  calculateM %lf",timeTrip);//control
    mileage = mileage + pow(initialSpeed,(2 * timeTrip)) - (initialSpeed * timeTrip);
//    NSLog(@"final mileage %lf",mileage);//control
    return mileage;
}


-(double)calculateFuelConsumption:(double)level :(double)hours :(double)initialSpeed{
    double fuelConumption = 0;
//    NSLog(@"hours to calculate consumption  %lf",hours);//control
    fuelConumption = fuelConumption -(hours * fabs(tan(initialSpeed * hours)) + fabs(cos(initialSpeed)));
//    NSLog(@"trip fuel %lf",fuelConumption);//control
    return fuelConumption;
}

-(void)setMileage:(double)value{
    mileage = value;
}



-(void)setBalance:(double) money{
    balance = money;
}

-(double)getBalance{
    return balance;
}

-(int)getTotalTrips{
    return totalTrips;
}

-(double)getMileage{
//    NSLog(@"mileage  getter %lf",mileage);//control
    return mileage;
}

-(double)rangeOfHours:(NSString *) sTime :(NSString *) eTime{
    double totalTrip = 0;
    double costPerHour[] = {30,30,30,30,30,30,30,30,20,20,20,20,20,20,25,25,25,25,25,25,25,25,25,25};
    NSString *sNumberString = sTime;
//    NSLog(@"%@",sNumberString);//control
    double sTimeDouble = [sNumberString doubleValue];//casting start time to double****************
//    NSLog(@"%lf",sTimeDouble);//control
    int hourStartTime = [self separateDoubleNumber:sTimeDouble :1];//To separate hours from start time
    int minutesStartTime = [self separateDoubleNumber:sTimeDouble :2];//To separate minutes from start time
//    NSLog(@"%i",hourStartTime);//control
//    NSLog(@"%i",minutesStartTime);//control
    
    NSString *eNumberString = eTime;
//    NSLog(@"%@",eNumberString);//control
    double eTimeDouble = [eNumberString doubleValue];//casting end time to double
//    NSLog(@"%lf",eTimeDouble);//control
    int hourEndTime = [self separateDoubleNumber:eTimeDouble :1];//To separate hours from end time
    int minutesEndTime = [self separateDoubleNumber:eTimeDouble :2];//To separate minutes from end time
//    NSLog(@"%i",hourEndTime);//control
//    NSLog(@"%i",minutesEndTime);//control
    double minutesTmp;
    for(int x = hourStartTime; x < hourEndTime; x++){
        if((minutesStartTime != 0 && x == hourStartTime)){
            minutesTmp = 60 - minutesStartTime;
            totalTrip += (costPerHour[x] * (minutesTmp / 60));
//            NSLog(@"min 1 %int",minutesStartTime);//control
//            NSLog(@"point 1 %lf",totalTrip);//control
//            NSLog(@"point 1 %lf",minutesTmp);//control
//            NSLog(@"point 1 %lf",(double)minutesTmp/60);//control
        }else{
            totalTrip += costPerHour[x];
//            NSLog(@"point 2 %lf",totalTrip);//control
        }
    }
    
    
    if(minutesEndTime != 0){
        totalTrip += (costPerHour[hourEndTime] * ((double)minutesEndTime / 60));
//        NSLog(@"point 3 %lf",totalTrip);//control
    }
    //    else{
    //        totalTrip += costPerHour[hourEndTime];
    //        NSLog(@"point 4 %lf",totalTrip);//control
    //    }
//    NSLog(@"%lf",totalTrip);//control
    return totalTrip;
}



-(double)compareDate:(NSString *)startTimeString :(NSString *)endTimeString{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    NSDate *start = [df dateFromString:startTimeString];
    NSDate *end = [df dateFromString:endTimeString];
    
//    [df setDateFormat:@"HH:mm "];
    NSString *newStart = [df stringFromDate:start];
    NSString *newEnd = [df stringFromDate:end];
    NSLog(@"Time : %@  %@",newStart,newEnd);
    ///////////////////////////////////////////////////////
    
    NSDate *startDate = [df dateFromString:newStart];
    NSDate *endDate = [df dateFromString:newEnd];
    
    NSTimeInterval timeDifference = [endDate timeIntervalSinceDate:startDate];
    

    return fabs(timeDifference);
}


-(int)separateDoubleNumber:(double) numberTime :(int) flag{//To separate hours and minutes
    double decimalPart = numberTime;
    int basePart = decimalPart;
    decimalPart -=  basePart;
    
    if (flag == 1){
        return basePart;
    }else{
        return (decimalPart * 100);
    }
}



@end
