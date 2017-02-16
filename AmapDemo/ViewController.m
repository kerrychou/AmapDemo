//
//  ViewController.m
//  AmapDemo
//
//  Created by KellenChou on 17/2/16.
//  Copyright © 2017年 KellenChou. All rights reserved.
//

#import "ViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>

@interface ViewController ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [AMapServices sharedServices].apiKey = @"8adb3f1144dd8a408ca16ab4b40608b3";
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    self.mapView.showsCompass = YES;
    self.mapView.showsScale = YES;
    self.mapView.zoomLevel = 14;
    
    self.mapView.showsUserLocation = YES;
    
    [self.view addSubview:self.mapView];
    
}


#pragma mark - MAMapViewDelegate

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation {
    [mapView setCenterCoordinate:CLLocationCoordinate2DMake(userLocation.location.coordinate.latitude, userLocation.location.coordinate.latitude)];
}


@end
