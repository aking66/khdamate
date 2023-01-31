/************************* Mo’min J.Abusaada *************************/
//
//  Bridge.h
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

#ifndef Bridge_h
#define Bridge_h

#import <PayFortSDK/PayFortSDK.h>
#import <coreData/coreData.h>
@interface NSManagedObjectContext ()
+ (void)MR_setRootSavingContext:(NSManagedObjectContext *)context;
+ (void)MR_setDefaultContext:(NSManagedObjectContext *)moc;
@end

#endif
