use strict;
use warnings;
use Time::HiRes qw(sleep);
use Test::WWW::Selenium;
use Test::More "no_plan";

my $sel = Test::WWW::Selenium->new( host => 'localhost', 
                                    port => 4445, 
                                    browser => '{"username": "jimleitch",'.
                                               '"access-key": "3eb84966-ba07-4e0d-98a5-ed1d2f3e2ef8",'.
                                               '"os": "Windows 2003",'.
                                               '"browser": "firefox",'.
                                               '"browser-version": "7",'.
                                               '"name": "This is an example test"}',
                                    browser_url => 'http://ci-jboss:8080/' );

$sel->open_ok("/petstoreWeb");

sleep(15);
$sel->click_ok("link=Stop Derby DB (stops the DB to allow redeploy)");
$sel->wait_for_page_to_load_ok("30000");
my $DBStopped = $sel->get_body_text();
$sel->click_ok("id=initDB");
$sel->wait_for_page_to_load_ok("30000");
my $DBInitialized = $sel->get_body_text();
$sel->click_ok("id=enter");
$sel->wait_for_page_to_load_ok("30000");

$sel->open_ok("/petstoreWeb/shop/Controller.jpf");
$sel->click_ok("link=Sign In");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=input[type=\"submit\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("link=Dogs");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("link=K9-CW-01");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("xpath=(//a[contains(text(),'Add to Cart')])[2]");
$sel->wait_for_page_to_load_ok("30000");
$sel->type_ok("name={actionForm.cart.lineItems[0].quantity}", "3");
$sel->click_ok("css=input[type=\"submit\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=#Netui_Form_0 > a > img");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("link=Proceed to Checkout");
$sel->wait_for_page_to_load_ok("30000");
$sel->text_is("css=b > span", "\$465.87");
$sel->text_is("xpath=//td[2]/span", "K9-CW-01");
$sel->text_is("xpath=//td[3]/span", "Adult Female");
$sel->click_ok("link=Continue");
$sel->wait_for_page_to_load_ok("30000");
sleep(10);
$sel->select_window_ok("null");
$sel->click_ok("name=wlw-radio_button_group_key:{actionForm.order.billingAddress}");
$sel->click_ok("name=wlw-radio_button_group_key:{actionForm.order.shippingAddress}");
$sel->click_ok("link=Continue");
$sel->wait_for_page_to_load_ok("30000");
$sel->type_ok("name={actionForm.order.creditCard}", "1212121212121212");
$sel->type_ok("name={actionForm.order.exprDate}", "08/16");
$sel->click_ok("link=Continue");
$sel->wait_for_page_to_load_ok("30000");
$sel->text_is("xpath=//table[\@id='orderTable']/tbody/tr[7]/td[2]/span", "901 San Antonio Road");
$sel->text_is("xpath=//table[\@id='orderTable']/tbody/tr[7]/td[3]/span", "901 San Antonio Road");
$sel->text_is("xpath=//table[\@id='orderTable']/tbody/tr[14]/td/table/tbody/tr[2]/td[3]", "3");
$sel->text_is("xpath=//table[\@id='orderTable']/tbody/tr[14]/td/table/tbody/tr[3]/td/b/span", "\$465.87");
$sel->click_ok("link=Continue");
$sel->wait_for_page_to_load_ok("30000");
$sel->text_is("css=b", "Thank you, your order has been submitted.");
$sel->table_is("css=table.tableborder.1.1", "Adult Female");
$sel->click_ok("link=Sign Out");
$sel->wait_for_page_to_load_ok("30000");