//
//  BuildCollection.m
//  ProjectMonitor
//
//  Created by Dimitri Roche on 3/8/14.
//  Copyright (c) 2014 Dimitri Roche. All rights reserved.
//

#import "BuildCollection.h"
#import "Build.h"

@interface BuildCollection ()
@property (nonatomic, strong) NSArray *buildsByType;
@property (nonatomic, strong) NSArray *buildLabelsByType;
@end

@implementation BuildCollection

- (NSArray*)buildsForType:(BuildType)buildType
{
    return [self buildsByType][buildType];
}

- (void)refresh
{
    NSMutableArray *array = [NSMutableArray array];
    array[SemaphoreBuildType] = [Build forType:@"Semaphore"];
    array[PrivateTravisBuildType] = [Build forType:@"PrivateTravis"];
    array[PublicTravisBuildType] = [Build forType:@"PublicTravis"];
    [self setBuildsByType:array];
    
    [self setBuildLabelsByType:[NSArray arrayWithObjects:
                                @"Semaphore", @"Private Travis",
                                @"Public Travis", nil]];
}

- (void)clear
{
    [self setBuildLabelsByType:[NSArray array]];
    [self setBuildsByType:[NSArray array]];
}

- (NSArray*)onlyPopulated
{
    return [self.buildsByType bk_select:^BOOL(id obj) {
        return [obj count] > 0;
    }];
}

- (NSArray*)onlyPopulatedTitles
{
    NSInteger index = 0;
    NSMutableArray *populatedTitles = [NSMutableArray array];
    for (NSArray* builds in [self buildsByType]) {
        if ([builds count] > 0) {
            [populatedTitles addObject:[self.buildLabelsByType objectAtIndex:index]];
        }
        
        index++;
    }
    
    return populatedTitles;
}

@end