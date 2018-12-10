//
//  Menu.h
//  taximeter
//
//  Created by Marlon Escobar on 2018-12-04.
//  Copyright © 2018 Marlon Escobar A. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trip.h"
#import "Taxi.h"
#import "GasTank.h"

NS_ASSUME_NONNULL_BEGIN

@interface Menu : NSObject
-(int)mainMenu:(double) milage :(double) gasLevel :(double) income : (int) totalTrips;
-(Trip *)pickUpPassengerMenu;
-(double)initialGasMenu;
-(double)fillUpGasMenu:(double)fuelPrice :(double)balance;
-(char)OnSiteRefuel;


@end

NS_ASSUME_NONNULL_END
