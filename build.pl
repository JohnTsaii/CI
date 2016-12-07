# /usr/bin/perl

use strict;
use warnings;

my $target = 'TargetName';
my $workspace_name = "WorkSpaceName";
my $project_name = "PorjectName";
my $scheme = 'SchemeName';
my $configuration = 'Release';
my $project_type_option = "-project";
my $project_type_parameter = "$project_name.xcodeproj";

my $profile_name = "ProfileName";
my $code_sign_identity = "CodeSignIdnetity";
my $development_team = 'DevelopmentTeam';
    
system("xcodebuild", "$project_type_option", "$project_type_parameter", "-scheme", "$scheme", "clean");

if ($? != 0) {}

system("xcodebuild", "$project_type_option", "$project_type_parameter", "-scheme", "$scheme", "-configuration", "$configuration", "-sdk", "iphoneos", "PROVISIONING_PROFILE_SPECIFIER=$profile_name", "build");

if ($? != 0) {}
system("xcodebuild", "$project_type_option", "$project_type_parameter", "-scheme", "$scheme", "-configuration", "$configuration", "-sdk", "iphoneos", "PROVISIONING_PROFILE_SPECIFIER=$profile_name", "-archivePath", "build/$scheme.xcarchive", "archive");

system("xcodebuild", "-exportArchive", "-archivePath", "build/$scheme.xcarchive", "-exportPath", "build/$scheme.ipa", "-sdk", "iphoneos","-exportOptionsPlist", "enterpriseExport.plist");

