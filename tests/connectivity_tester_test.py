# pylint: disable=missing-docstring, line-too-long, protected-access
import unittest
from runner import Runner


class TestE2E(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.snippet = """

            provider "aws" {
              region = "eu-west-2"
              skip_credentials_validation = true
              skip_get_ec2_platforms = true
            }

            module "tester" {
              source = "./mymodule"

              providers = {
                aws = "aws"
              }
              
              user_data = "CHECK_self=127.0.0.1:80 CHECK_google=google.com:80 CHECK_googletls=google.com:443 LISTEN_http=0.0.0.0:80 LISTEN_httpagain=0.0.0.0:8088"
            }
        """
        self.result = Runner(self.snippet).result

    def test_root_destroy(self):
        print (self.result['tester'])
        self.assertEqual(self.result["destroy"], False)

    def test_iam_policy(self):
        self.assertEqual(self.result['tester']["aws_iam_policy.policy"]['name_prefix'], 'connectivity_tester')

    def test_instance(self):
        self.assertEqual(self.result['tester']["aws_instance.ConnectivityTester"]['user_data'],
                         '15fd74e7446fd12a6ab267bd76297159c77f8667')

if __name__ == '__main__':
    unittest.main()
