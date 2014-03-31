use strict;
use warnings;
use Time::HiRes qw(sleep);
use Test::WWW::Selenium;
use Test::More "no_plan";
use Test::Exception;

my $sel = Test::WWW::Selenium->new( host => "localhost", 
                                    port => 4444, 
                                    browser => "*chrome", 
                                    browser_url => "http://ws6.test-rig.com:7080" );

$sel->open_ok("/petstoreWeb/");
sleep(15);
$sel->click_ok("link=Stop Derby DB (stops the DB to allow redeploy)");
$sel->wait_for_page_to_load_ok("30000");
my $DB Stopped = $sel->get_body_text();
$sel->click_ok("id=initDB");
$sel->wait_for_page_to_load_ok("30000");
my $DB Initialized = $sel->get_body_text();
$sel->click_ok("id=enter");
$sel->wait_for_page_to_load_ok("30000");
