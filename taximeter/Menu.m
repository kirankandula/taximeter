//
//  Menu.m
//  taximeter
//
//  Created by Marlon Escobar on 2018-12-04.
//  Copyright © 2018 Marlon Escobar A. All rights reserved.
//

#import "Menu.h"



@implementation Menu

-(int)mainMenu:(double) mileage :(double) gasLevel :(double) income : (int) totalTrips{
    int option;
    printf("#################################################################################################################\n");
    printf("\n\tMileage = %lf Km.\t\t\tGas = %lf L.\t\t\t N.Trips = %d\t\t\tIncome = $ %.2lf\n\n",mileage,gasLevel,totalTrips,income);
    printf("#################################################################################################################");
    printf("\n\n\n\t\t\t\t\t\t\t\t\t\t\t1. Pick up passenger.");
    printf("\n\n\t\t\t\t\t\t\t\t\t\t\t2. Fill up gas tank.");
    printf("\n\n\t\t\t\t\t\t\t\t\t\t\t3. Finish to work.");
    printf("\n\n\n\t\t\t\t\t\t\t\t\t\t\tOption => ");
    printf("HI"); /// TODO: REMOVE IT LATER
    scanf("%d",&option);
    return option;
}



-(Trip *)pickUpPassengerMenu{
    char startTime[5];
    char endTime[5];
    double initialSpeed = 0;
    double cost = 0;
    double constraintHour;
    double fuelConsumption = 0;
    double mileage = 0;

    printf("#################################################################################################################");
    printf("\n\n\t\t\t\t\t\t\t\t\t\t PICK UP PASSENGER PROCESS !\n\n");
    printf("#################################################################################################################\n");
    printf("\n\t\t\t\t\t*** PLEASE FOLLOW THIS FORMAT OF HOURS.(hh.mm) 8:43 PM => 20.43 ***\n");
    printf("########################################\n");
    printf("\n\t\t\t* Start time trip (hh.mm)  => ");
    scanf("%s",startTime);
    NSString *startTimeString = [NSString stringWithUTF8String:startTime];
    printf("########################################\n");
    printf("\t\t\t* End time trip   (hh.mm)  => ");
    scanf("%s",endTime);
    NSString *endTimeString = [NSString stringWithUTF8String:endTime];
    printf("########################################\n");
    printf("\t\t\t* Initial Speed     (Km/h) => ");
    scanf("%lf",&initialSpeed);
    printf("########################################\n");
    Taxi *taxi1 = [[Taxi alloc]init];
    constraintHour = [taxi1 compareDate:startTimeString :endTimeString];
    
    if((constraintHour / 3600) > 12){//it just works out during the same day
        printf("\n\n\n\t\t\t\t\t*** ERROR : FORBIDDEN TRIP. Sorry but this trip is too long. ***\n");
    }else{
        cost = [taxi1 rangeOfHours:startTimeString :endTimeString];
//        NSLog(@"hours %lf",(constraintHour / 3600));//control
        mileage = [taxi1 calculateMileage:(constraintHour / 3600) : initialSpeed];
       
        
        GasTank *tank = [[GasTank alloc]init];
        fuelConsumption = [taxi1 calculateFuelConsumption:[tank getGastTankLevel] :(constraintHour / 3600) :initialSpeed];
        [tank fuelConsumptionTank:fuelConsumption];
        printf("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tGOOD JOB !!!");
        printf("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t$ Trip :%.2lf\n",cost);
    }

    Trip *trip = [[Trip alloc]initTrip:startTimeString :endTimeString :initialSpeed :cost : mileage : fuelConsumption];
    return trip;
}





-(double)initialGasMenu{
    double level;
    printf("#################################################################################################################");
    printf("\n\n\t\t\t\t\t\t\t\t\t\t\t HELLO DRIVER !\n\n");
     printf("#################################################################################################################\n");
    printf("\n\n\n\t\t\t\t\t\tPlease enter currently gas tank level  in liters => ");
    scanf("%lf", &level);
   
    return level;
}


-(double)fillUpGasMenu:(double)fuelPrice :(double)balance{
    double level = 0;
    Boolean flag = true;
    while(flag){
        printf("#################################################################################################################");
        printf("\n\n\t\t\t\t\t\t\t\t\t\t FILLING UP GAS TANK PROCESS !\n\n");
        printf("#################################################################################################################\n");
        printf("\n\n\n\t\t\t\t\t* Current Gas price : $ %lf", fuelPrice);
        printf("\n\n\t\t\t\t\t* Current Balance   : $ %lf", balance);
        printf("\n\n\n\t\t\t\t\tPlease enter how many liters you're going to refuel => ");
        scanf("%lf", &level);
        printf("\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t*** TOTAL : $ %lf ***\n", (fuelPrice * level));
    
        if((fuelPrice * level) > balance){
            printf("\n\n\n\t\t\t\t\t*** ERROR : NOT FOUNDS, try another amount of fuel. ***\n");
        
        }else{
            flag = false;
        }
    }
    printf("\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTHANKS FOR YOUR PURCHASE!!!\n");
    return level;
}

-(char)OnSiteRefuel{
    char answer;
    printf("#################################################################################################################");
    printf("\n\n\t\t\t\t\t\t\t\t\t\t ON-SITE REFUEL PROCESS !\n\n");
    printf("#################################################################################################################\n");
    printf("\n\n\n\t\t\t\t\t* Current Gas level  : 0.00 L.");
    printf("\n\n\t\t\t\t\t* # Liters to refuel : 40.00 L.");
    printf("\n\n\t\t\t\t\t* Feed               : $ 100.00");
    printf("\n\n\n\t\t\t\t\tDo you want to continue with transaction? (y / n) => ");
    scanf("%s", &answer);
    return answer;
}



@end
