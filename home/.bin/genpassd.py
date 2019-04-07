#!/usr/bin/env python
# -*- coding: utf-8 -*-

import string
import random
import re

class Password:
    def __init__(self, length=9, harden=''):
        self.length = length
        self.harden = harden
        self.string = ''.join(
            [
                string.ascii_letters,
                string.digits,
                self.harden,
            ]
        )

    def _hasDigits(self, value):
        return bool(re.search(r'[0-9]', value))

    def _hasLetters(self, value):
        return bool(re.search(r'[A-z]', value))

    def _hasHarden(self, value):
        return any([_ in value for _ in self.harden])

    def get(self):
        password = ''
        while not all(
                [_(password) for _ in (
                    self._hasLetters,
                    self._hasDigits,
                    self._hasHarden
                )],
        ):
            password = ''.join(random.choices(self.string, k=self.length))
        return password

def main():
    password = Password(harden='$%^!@#&*()_-=+')
    print(password.get())


if __name__ == '__main__':
    main()
