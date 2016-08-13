#!/usr/bin/perl

# Script for migrating ACS Transition pages to ACS Basic pages
$DEBUG=1;
$host="localhost:4502";
$username = "admin";
$password = "admin";
$getResources = "curl -u $username:$password GET '$host/bin/querybuilder.json?path=%2fcontent%2facs%2fen&1_property=cq%3Atemplate&1_property.value=%2fapps%2facs%2ftemplates%2facsTransition&p.limit=-1'";
$changeTemplateType = "curl -u $username:$password cq:template=/apps/acs/templates/acsArticle";
$changeResourceType = "curl -u $username:$password sling:resourceType=acs/components/pages/acsArticle";
$copyMainContent = "curl -u $username:$password -F:operation=copy";
$deleteMainContent = "curl -u $username:$password -X DELETE";

$resourcesOutput = `curl $getResources 2>nul`;

@matches = $resourcesOutput =~ /\"path\":\"(.*?)\"/g;

if($DEBUG) {
	foreach $match (@matches) {
		print "$match\n";
	}
}

# Perform migration tasks for each Transition Page
#foreach $match (@matches) {
#	system("$changeTemplateType $host$match 2>nul");
#	system("$changeResourceType $host$match 2>nul");
#	system("$copyMainContent F:dest=$host$match/articleContent $host$match/mainContent 2>nul");
#	system("$deleteMainContent $host$match/mainContent 2>nul");
#}

