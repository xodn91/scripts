#!/usr/local/bin/python3
'''
Unittest, testing the functionality of macos_info.py.
'''

import unittest
import macos_info

class Test__add_a_and_b_then_subtract_c(unittest.TestCase):

    def test_addition_is_correct(self):
        test_a = 1
        test_b = 2
        test_c = 0

        output = macos_info.add_a_and_b_then_subtract_c(
          test_a, test_b, test_c)

        self.assertEqual(output, 3)

    def test_subtraction_is_correct(self):
        test_a = 10
        test_b = 0
        test_c = 3

        output = macos_info.add_a_and_b_then_subtract_c(
          test_a, test_b, test_c)

        self.assertEqual(output, 7)

    def test_addition_and_subtraction(self):
        test_a = 2
        test_b = 4
        test_c = 6

        output = macos_info.add_a_and_b_then_subtract_c(
          test_a, test_b, test_c)

        self.assertEqual(output, 0)

class Test__get_ip_address(unittest.TestCase):
    def test_gather_a_ip_address(self):

      output = macos_info.get_ip_address()
      # change ip address if running on local machine to pass test
      self.assertEqual(output, '127.0.0.1' )

class Test__get_computer_name(unittest.TestCase):
    def test_returns_a_computer_name(self):

      output = macos_info.get_computer_name()

      self.assertEqual(output, 'Eriks-MacBook-Pro.local')

if __name__ == '__main__':
    unittest.main()
