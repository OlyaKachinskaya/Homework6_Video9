//
//  Doctor.h
//  Patient
//
//  Created by Оля Качинская on 03.03.2021.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

NS_ASSUME_NONNULL_BEGIN

@interface Doctor : NSObject <PatientDelegate>
@property NSMutableArray *patientsList;

-(void)displayRaport:(NSMutableArray *)patientList;

@end

NS_ASSUME_NONNULL_END
