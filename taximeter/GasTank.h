//
//  GasTank.h
//  taximeter
//
//  Created by Marlon Escobar on 2018-12-04.
//  Copyright © 2018 Marlon Escobar A. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GasTank : NSObject{
    double gasTankLevel;
//    double gasPrice;
}
//@property double gastTankLevel;
//@property double gasPrice;

-(void)setGasTank:(double) level;
-(double)getGastTankLevel;
-(void)fillUpGasTank:(double) gtl;
-(double)getPriceGas;
-(void)fuelConsumptionTank:(double) fuelConsumption;
@end

NS_ASSUME_NONNULL_END
