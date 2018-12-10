//
//  main.m
//  taximeter
//
//  Created by Marlon Escobar on 2018-12-04.
//  Copyright © 2018 Marlon Escobar A. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menu.h"
#import "GasTank.h"
#import "Taxi.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Boolean flag = true;
        double level;
        double fuelConsumption = 0;
        int driverOperation;
//        double mileage;
        double fuelPrice;
        char answerOnSiteRefuel;
        NSMutableArray *arrayTrips = [[NSMutableArray alloc]init];
        
        
        
        GasTank *gastank = [[GasTank alloc]init];
        Menu * menu = [[Menu alloc]init];
        level = [menu initialGasMenu];
        [gastank setGasTank:level];
        
        Taxi *taxi = [[Taxi alloc]init];
        [taxi setBalance:0];
        [taxi setMileage:0];
        
        
//        Trip *trip = [[Trip alloc]initTrip:10 :12 :13 :20];
//        double tmp2 =[trip getStartTrip];
//        double tmp3 =[trip getEndTrip];
//        double tmp4 =[trip getInitialSpeed];
//        double tmp5 =[trip getCostTrip];
//        
//        printf("start :%lf    end :%lf  speed  :%lf   cost : %lf",tmp2,tmp3,tmp4,tmp5);
//        

        
        while(flag){
            driverOperation = [menu mainMenu:[taxi getMileage] :[gastank getGastTankLevel] :[taxi getBalance] :[taxi getTotalTrips]];
        
            if (driverOperation == 1){
                Trip *trip =[menu pickUpPassengerMenu];
                [taxi calculatePickUpPassenger:[trip getCostTrip]:[trip getMileage]];
                fuelConsumption = [trip getFuelConsumption];
                [gastank fuelConsumptionTank:fuelConsumption];
                
                if([gastank getGastTankLevel] < -(fuelConsumption) || [gastank getGastTankLevel] < 0.00){//ON SITE REFUEL
                    printf("\n\n\n\t\t\t\t\t*** WARNING : LOW FUEL, There won't enough fuel to finish current trip. ***\n");
                    answerOnSiteRefuel = [menu OnSiteRefuel];
                    if (answerOnSiteRefuel == 'y'){
                        [gastank fillUpGasTank:40];
                        [taxi calculateOnSiteRefuel:100];
                    }else{
                        flag = false;
                        printf("\n**** TODAY BALANCE => $ %.2lf ****\n",[taxi getBalance]);
                        printf("\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tBye have a good day!\n\n");
                    }
                }
                


//                NSLog(@"cost %lf           mileage %lf             fuelconsumption %lf",[trip getCostTrip],[trip getMileage],[trip getFuelConsumption]);//control
                [arrayTrips addObject:trip];

            
            }else if(driverOperation == 2){
                fuelPrice = [gastank getPriceGas];
                level = [menu fillUpGasMenu:fuelPrice:[taxi getBalance]];
                [gastank fillUpGasTank:level];
                [taxi calculateFillUpGasTank:fuelPrice :level];
                
            }else if(driverOperation == 3){
                flag = false;
                printf("\n\n**** TODAY BALANCE => $ %.2lf ****\n",[taxi getBalance]);
                printf("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tBye have a good day!\n\n");
            }else{
                printf("\n\t\t\t\t\t\t\t\t\t\tWRONG OPTION, PLEASE TRY AGAIN.\n");
            }
        }
    }
    return 0;

}
