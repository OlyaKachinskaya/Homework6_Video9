//
//  Patient.h
//  Patient
//
//  Created by Оля Качинская on 03.03.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    Head,
    Hand,
    Back,
    Stomach,
}partofTheBody;

@protocol PatientDelegate;

@interface Patient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic) NSInteger pressure, docktorRating;
@property (weak, nonatomic) id <PatientDelegate> delegate;
@property partofTheBody part;


- (BOOL) abdominalPain;
- (BOOL) cough;
- (void) displayPartOfTheBody:(partofTheBody)a;

- (void) howYouFeel;
- (void) somethingHurts;
//лечение
- (void) takePill;
- (void) giveInjection;
- (void) makeFluorography;
- (void) makeUltrasound;
- (void) makeXray;
- (void) goForMassage;


@end

@protocol PatientDelegate <NSObject>

- (void) patientFellsBad:(Patient *) patient;
- (void) patientSomethingHurts:(Patient *)patient;

@end

NS_ASSUME_NONNULL_END
