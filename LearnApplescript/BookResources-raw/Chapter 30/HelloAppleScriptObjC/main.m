//
//  main.m
//  HelloAppleScriptObjC
//
//  Created by Hamish Sanderson on 3/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, char *argv[])
{
	[[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];

	return NSApplicationMain(argc, (const char **) argv);
}
