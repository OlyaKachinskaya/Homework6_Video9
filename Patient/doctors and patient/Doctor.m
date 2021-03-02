//
//  Doctor.m
//  Patient
//
//  Created by Оля Качинская on 03.03.2021.
//

#import "Doctor.h"

@implementation Doctor

#pragma mark - PatientDelegate

-(void)displayRaport:(NSMutableArray *)patientList{
    NSLog(@"Patients with a score head:");
    for (Patient *patient in patientList) {
        if ([patient part] == Head) NSLog(@"%@", [patient name]);
    }
    
    NSLog(@"Patients with a score hand:");
    for (Patient *patient in patientList) {
        if ([patient part] == Hand) NSLog(@"%@", [patient name]);
    }
    
    NSLog(@"Patients with a score back");
    for (Patient *patient in patientList) {
        if ([patient part] == Back) NSLog(@"%@", [patient name]);
    }
    
    NSLog(@"Patients with a score stomach:");
    for (Patient *patient in patientList) {
        if ([patient part] == Stomach) NSLog(@"%@", [patient name]);
    }
}

- (void) patientFellsBad:(Patient *) patient{
    
    if ([patient temperature] >= 37 && [patient temperature] < 40){
        NSLog(@"%@ has a temperature below 40! The patient needs to take a pill!", [patient name]);
        [patient takePill];
    }
    if ([patient temperature] >= 40){
        NSLog(@"%@ has a temperature above 40! The patient needs to get an injection!", [patient name]);
        [patient giveInjection];
    }
    if ([patient pressure] > 120){
        NSLog(@"%@ has hight blood pressure! The patient needs to take a pill!", [patient name]);
        [patient takePill];
    }
    if ([patient abdominalPain]){
        NSLog(@"%@ has abdominal pain! the patient needs to have fluorography!", [patient name]);
        [patient makeFluorography];
    }
    if ([patient cough]){
        NSLog(@"%@ cought! the patient needs to have ultrasound!", [patient name]);
        [patient makeUltrasound];
    }
    else NSLog(@"Everything is fine. Go ti sleep");
    
}

- (void) patientSomethingHurts:(Patient *)patient{
    NSLog(@"%@, What hurts you?\n", [patient name]);
    [patient displayPartOfTheBody:[patient part]];
    switch ([patient part]) {
        case Head:
            NSLog(@"You nead to take a pill!");
            [patient takePill];
            break;
        case Hand:
            NSLog(@"You need to do an x-ray!");
            [patient makeXray];
            break;
        case Back:
            NSLog(@"You need to go for a massage!");
            [patient goForMassage];
            break;
        case Stomach:
            NSLog(@"You need to have ultrasound!");
            [patient makeUltrasound];
            break;
        default:
            break;
    }
    
}
@end

