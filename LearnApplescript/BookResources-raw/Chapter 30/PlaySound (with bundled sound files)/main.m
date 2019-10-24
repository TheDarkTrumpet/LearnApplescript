//
//  main.m
//  PlaySoundTwo
//
//  Created by Craig Williams on 10/17/09.
//  Copyright AllanCraig 2009. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, char *argv[])
{
	[[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];

	return NSApplicationMain(argc, (const char **) argv);
}
