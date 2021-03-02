//
//  AppDelegate.m
//  Patient
//
//  Created by Оля Качинская on 03.03.2021.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Doctor.h"
#import "Friend.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    Doctor *doctor = [[Doctor alloc] init];
    Friend *friend = [[Friend alloc] init];
    
    NSMutableArray *patientsList = [[NSMutableArray alloc] init];
    
    NSArray *namesOfPatients = [NSArray arrayWithObjects:
                                @"Katya",
                                @"Petya",
                                @"Vova",
                                @"Albina",
                                @"Maya",
                                nil];
    
    NSArray *temperatureOfPatients = [NSArray arrayWithObjects:
                                      [NSNumber numberWithFloat:37.5],
                                      [NSNumber numberWithFloat:36.6],
                                      [NSNumber numberWithFloat:39.8],
                                      [NSNumber numberWithFloat:40.5],
                                      [NSNumber numberWithFloat:36.3],
                
                                      nil];
    
    NSArray *pressureOfPatients = [NSArray arrayWithObjects:
                                    [NSNumber numberWithInt:110],
                                    [NSNumber numberWithInt:140],
                                    [NSNumber numberWithInt:100],
                                    [NSNumber numberWithInt:122],
                                    [NSNumber numberWithInt:160],
                                      nil];
//    //поход к врачу
//    for (int i = 0; i < [namesOfPatients count]; i++){
//        Patient *patient = [[Patient alloc] init];
//        [patient setName:[namesOfPatients objectAtIndex:i]];
//        NSNumber *obj1 = [temperatureOfPatients objectAtIndex:i];
//        [patient setTemperature:[obj1 floatValue]];
//        NSNumber *obj2 = [pressureOfPatients objectAtIndex:i];
//        [patient setPressure:[obj2 intValue]];
//
//        [patient setDelegate:doctor];
//
//        NSLog(@"%@, are you okey?", [patient name]);
//        [patient howYouFeel];
//        [patientsList addObject:patient];
//    }
//
//    //студент
//    //поход к другу (я прогнала цикл с теми же пациентами)
//    for (int i = 0; i < [namesOfPatients count]; i++){
//        Patient *patient = [[Patient alloc] init];
//        [patient setName:[namesOfPatients objectAtIndex:i]];
//        NSNumber *obj1 = [temperatureOfPatients objectAtIndex:i];
//        [patient setTemperature:[obj1 floatValue]];
//        NSNumber *obj2 = [pressureOfPatients objectAtIndex:i];
//        [patient setPressure:[obj2 intValue]];
//
//        [patient setDelegate:friend];
//
//        NSLog(@"%@, are you okey?", [patient name]);
//        [patient howYouFeel];
//        [patientsList addObject:patient];
//    }
    
    //мастер
    for (int i = 0; i < [namesOfPatients count]; i++){
        Patient *patient = [[Patient alloc] init];
        [patient setName:[namesOfPatients objectAtIndex:i]];
        [patient setDelegate:doctor];
        
        [patientsList addObject:patient];
    }
    [[patientsList objectAtIndex:0] setPart:Hand];
    [[patientsList objectAtIndex:1] setPart:Head];
    [[patientsList objectAtIndex:2] setPart:Back];
    [[patientsList objectAtIndex:3] setPart:Stomach];
    [[patientsList objectAtIndex:4] setPart:Stomach];

    //лечение больной части тела
    [[patientsList objectAtIndex:0] somethingHurts];
    [[patientsList objectAtIndex:1] somethingHurts];
    [[patientsList objectAtIndex:2] somethingHurts];
    [[patientsList objectAtIndex:3] somethingHurts];
    [[patientsList objectAtIndex:4] somethingHurts];
    //вывод рапорта
    [doctor displayRaport:patientsList];
    
    //супермен
    //записываю рандомную оценку доктору после приема и рапорта
    //шкала от 0 до 5
    [[patientsList objectAtIndex:0] setDocktorRating:(arc4random_uniform(6))];
    [[patientsList objectAtIndex:1] setDocktorRating:(arc4random_uniform(6))];
    [[patientsList objectAtIndex:2] setDocktorRating:(arc4random_uniform(6))];
    [[patientsList objectAtIndex:3] setDocktorRating:(arc4random_uniform(6))];
    [[patientsList objectAtIndex:4] setDocktorRating:(arc4random_uniform(6))];
    //проверка доктора и смена при низкой оценке
    for (Patient *patient in patientsList){
        NSLog(@"%@ rated the doctor %d points", [patient name], [patient docktorRating]);
        if ([patient docktorRating] < 3){
            NSLog(@"%@ changes doctors!", [patient name]);
            [patient setDelegate:friend];
        } else {
            NSLog(@"%@ doesn't change the doctor!", [patient name]);
        }
    }
    //ведем всех к доктору
    [[patientsList objectAtIndex:0] somethingHurts];
    [[patientsList objectAtIndex:1] somethingHurts];
    [[patientsList objectAtIndex:2] somethingHurts];
    [[patientsList objectAtIndex:3] somethingHurts];
    [[patientsList objectAtIndex:4] somethingHurts];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
