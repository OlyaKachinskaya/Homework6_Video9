//
//  Patient.m
//  Patient
//
//  Created by Оля Качинская on 03.03.2021.
//

#import "Patient.h"

@implementation Patient

@synthesize name, temperature, pressure;

- (BOOL) abdominalPain;
{
    return arc4random_uniform(2);
}
- (BOOL) cough;
{
    return arc4random_uniform(2);
}

- (void)displayPartOfTheBody:(partofTheBody)a
{
    switch (a) {
        case Head:
            NSLog(@"Head");
            break;
        case Hand:
            NSLog(@"Hand");
            break;
        case Back:
            NSLog(@"Back");
            break;
        case Stomach:
            NSLog(@"Stomach");
            break;
        default:
            break;
    }
}

- (void) howYouFeel{
    if ([self temperature] > 37 || [self pressure] > 120 || ([self abdominalPain]) || ([self cough])){
        NSLog(@"%@ feels bad!", [self name]);
        //обратиться к делегату
        [[self delegate] patientFellsBad:self];
    }
    else {
        NSLog(@"%@ feels good!", [self name]);
    }
    }

- (void) somethingHurts{
    [[self delegate] patientSomethingHurts:self];
}
    
   //лечение
    - (void) takePill
    {
        NSLog(@"%@ drank a pill.", [self name]);
    }
    
    - (void) giveInjection
    {
        NSLog(@"%@ got an injection.", [self name]);
    }
    
    - (void) makeFluorography
    {
        NSLog(@"%@ made fluorography.", [self name]);
    }
    - (void) makeUltrasound
    {
        NSLog(@"%@ made an ultrasound.", [self name]);
    }
- (void) makeXray{
    NSLog(@"%@ made x-ray", [self name]);
}
- (void) goForMassage{
    NSLog(@"%@ went for a massage", [self name]);
}
@end

