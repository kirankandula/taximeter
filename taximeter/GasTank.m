//
//  GasTank.m
//  taximeter
//
//  Created by Marlon Escobar on 2018-12-04.
//  Copyright © 2018 Marlon Escobar A. All rights reserved.
//
#include <stdlib.h>
#import "GasTank.h"

@implementation GasTank
//@synthesize gastTankLevel;
//@synthesize gasPrice;


-(void)setGasTank:(double) level{
    gasTankLevel = level;

}
-(double)getGastTankLevel{
    return gasTankLevel;
}

-(void)fillUpGasTank:(double) gtl{
    gasTankLevel += gtl;
}

-(void)fuelConsumptionTank:(double) fuelConsumption{
//    NSLog(@"gas tank when enter to method%lf",fuelConsumption);//control
//    NSLog(@"gastank without modification %lf",gasTankLevel);//control
    gasTankLevel += fuelConsumption;
//    NSLog(@"gas tank after trip  %lf",gasTankLevel);//control
    
}
-(double)getPriceGas{
    int lowerBound = 15;
    int upperBound = 45;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    double price = ((double)rndValue / 100) + 1.0;
    return price;
}

@end
