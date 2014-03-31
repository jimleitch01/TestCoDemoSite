from selenium import selenium
import unittest, time, re

class init_petstore(unittest.TestCase):
    def setUp(self):
        self.verificationErrors = []
        self.selenium = selenium("localhost", 4444, "*chrome", "http://ws6.test-rig.com:7080")
        self.selenium.start()
    
    def test_init_petstore(self):
        sel = self.selenium
        sel.open("/petstoreWeb/")
        time.sleep(15)
        sel.click("link=Stop Derby DB (stops the DB to allow redeploy)")
        sel.wait_for_page_to_load("30000")
        DB Stopped = sel.get_body_text()
        sel.click("id=initDB")
        sel.wait_for_page_to_load("30000")
        DB Initialized = sel.get_body_text()
        sel.click("id=enter")
        sel.wait_for_page_to_load("30000")
    
    def tearDown(self):
        self.selenium.stop()
        self.assertEqual([], self.verificationErrors)

if __name__ == "__main__":
    unittest.main()
