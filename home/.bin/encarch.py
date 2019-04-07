#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import shutil
import argparse
import tempfile
import subprocess

_archiver = '7z'
_converter = 'convmv'
_input_encoding = 'cp866'
_output_encoding = 'utf8'
_prefix = '~'

class EncArch():
    dependencies = (_archiver, _converter)

    def __init__(self, *args, **kwargs):
        self.archives = args
        self.input_encoding = kwargs.get('input_encoding', _input_encoding)
        self.output_encoding = kwargs.get('output_encoding', _output_encoding)
        self._checkDependencies()

    def _checkDependencies(self):
        for item in self.dependencies:
            if not shutil.which(item):
                raise OSError("'{item}' not found".format(
                    item=item,
                ))

    @property
    def archives(self):
        try:
            return self._archives
        except AttributeError:
            return None

    @archives.setter
    def archives(self, value):
        if isinstance(value, str):
            value = [value, ]

        for item in value:
            if not os.path.isfile(item):
                raise IOError("File '{}' not found".format(item))

        self._archives = value

    def encode(self):
        for file in self.archives:
            sourceDir = os.path.dirname(file)
            sourceFile = os.path.basename(file)
            with tempfile.TemporaryDirectory() as tempDir:
                with subprocess.Popen(
                    [
                        _archiver, 'x', '-no-utf16',
                        file,
                        '-o' + tempDir,
                    ],
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                ) as call:
                    out, err = call.communicate()
                    if call.returncode != 0:
                        print("{} error: {}".format(
                            _archiver,
                            err.decode('utf8'),
                        ))

                with subprocess.Popen(
                    [
                        _converter, '-r',
                        '-f', self.input_encoding,
                        '-t', self.output_encoding,
                        '--notest',
                        tempDir,
                    ],
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                ) as call:
                    out, err = call.communicate()
                    if call.returncode != 0:
                        print("{} error: {}".format(
                            _converter,
                            err.decode('utf8'),
                        ))

                with subprocess.Popen(
                    [
                        _archiver, 'a', '-mx7',
                        os.path.join(sourceDir, _prefix + sourceFile),
                        tempDir + '/*',
                    ],
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                ) as call:
                    out, err = call.communicate()
                    if call.returncode != 0:
                        print("{} error: {}".format(
                            _archiver,
                            err.decode('utf8'),
                        ))


def _parseArgs():
    parser = argparse.ArgumentParser(description='Convert archives encoding.')
    parser.add_argument('archives', nargs='+', help='archives for encoding')
    parser.add_argument(
        '-i', '--input-encoding', action='store', default='cp866',
        help="input archive encoding (default: cp866)")
    parser.add_argument(
        '-o', '--output-encoding', action='store', default='utf8',
        help="output archive encoding (default: utf8)")
    return parser.parse_args()

def main():
    parser = _parseArgs()
    encarch = EncArch(
        *parser.archives,
        input_encoding=parser.input_encoding,
        output_encoding=parser.output_encoding,
    )
    encarch.encode()


if __name__ == "__main__":
    sys.exit(main())
