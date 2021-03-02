//
//  Friend.m
//  Patient
//
//  Created by Оля Качинская on 03.03.2021.
//

#import "Friend.h"

@implementation Friend

#pragma mark - PatientDelegate
- (void) patientFellsBad:(Patient *) patient{
    if ([patient temperature] <= 37 ){
        NSLog(@"%@ has a temperature above 37! The patient needs to have fluorography!", [patient name]);
        [patient makeFluorography];
    }
    if ([patient temperature] >= 40){
        NSLog(@"%@ has a temperature above 40! Everything is fine. Go to sleep", [patient name]);
    }
    if ([patient pressure] > 120){
        NSLog(@"%@,Everything is fine. Go to sleep", [patient name]);
    }
    if ([patient abdominalPain]){
        NSLog(@"%@ has abdominal pain! Drink coca cola", [patient name]);
    }
    if ([patient cough]){
        NSLog(@"%@ cought! it's okey", [patient name]);
    }
    else {
        NSLog(@"the patient needs to have ultrasound!");
        [patient makeUltrasound];
    }
}

- (void) patientSomethingHurts:(Patient *)patient{
        NSLog(@"%@, What hurts you?\n", [patient name]);
        [patient displayPartOfTheBody:[patient part]];
        NSLog(@"Will hurt and stop! go home :)");
}
@end
