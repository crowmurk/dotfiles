#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Модуль содержит реализацию класса Dotfiles.
Позволяет управлять файлами в репозитории:
    - копирует файлы и каталоги в репозиторий
    - восстанавливаeт файлы из репозитория
    - очищает репозиторий от файлов удаленных в системе.
"""

import sys
import os
import glob
import shutil
import json
import copy
import logging
import argparse
import difflib

class Dotfiles():
    """Управление файлами в репозитории:
        - добавляет файлы в репозиторий
        - восттанавливает файлы из репозитория
        - очищает репозиторий от файлов не существующих в системе
    Работает согласно файлу конфигурации.
    """
    def __init__(self, config):
        """Инициализация экземпляра класса:
        Аргументы:
            config: путь к файлу конфигурации (json)
        """
        # Сохраняем рабочую директорию для восстановления
        self.startPath = os.getcwd()

        # Загружаем настройки из файла
        try:
            with open(config, 'r') as json_config:
                data = json.load(json_config)
        except IOError as e:
            sys.exit(
                "ERROR: Could read config file '{file}': {error}".format(
                    file=config, error=e.strerror),
            )

        # Глобальные настройки работы скрипта
        self.dotpath = self._expandPath(data['config'].pop('dotpath'))
        self.workdir = self._expandPath(data['config'].pop('workdir'))
        self.log = self._expandPath(data['config'].pop('log'))
        self.config = data.pop('config')

        # Составляем список действий над файлами и каталогами
        self.files = self._getFiles(data)

    def __del__(self):
        # Востанавливаем рабочую директорию
        os.chdir(self.startPath)

    @property
    def showDiff(self):
        """Показывать разницу в файлах (default False)
        """
        try:
            return self._showDiff
        except AttributeError:
            return False

    @showDiff.setter
    def showDiff(self, value):
        """Флаг showDiff, должен быть True или False
        """
        if isinstance(value, bool):
            self._showDiff = value
        else:
            raise ValueError(
                "showDiff flag '{error}' "
                "must be boolean type".format(error=value),
            )
        self.log.info("showDiff mode {}".format(
            "enabled" if self._showDiff else "disabled"))

    @property
    def dryrun(self):
        """Флаг работы в режиме dry-run (default False)
        """
        try:
            return self._dryrun
        except AttributeError:
            return False

    @dryrun.setter
    def dryrun(self, value):
        """Флаг dryrun, должен быть True или False
        """
        if isinstance(value, bool):
            self._dryrun = value
        else:
            raise ValueError(
                "dry run flag '{error}' "
                "must be boolean type".format(error=value),
            )
        self.log.warning("dry-run mode {}".format(
            "enabled" if self._dryrun else "disabled"))

    @property
    def log(self):
        """log: логирование результатов работы
        Возможные значения:
            None - не вести лог
            stdout - вывод в стандартный поток
            или принимает имя файла для записи лога
        """
        try:
            return self.__logger
        except AttributeError:
            return None

    @log.setter
    def log(self, value):
        """log: логирование результатов работы
        Возможные значения:
            None - не вести лог
            stdout - вывод в стандартный поток
            или принимает имя файла для записи лога
        """
        if __name__ == "__main__":
            journalName = os.path.basename(__file__)
        else:
            journalName = __name__

        timeformat = "%Y.%m.%d-%H:%M:%S"

        self.__logger = logging.getLogger(journalName)
        self.__logger.setLevel(logging.INFO)

        if value is None:
            # Не вести лог
            handler = logging.NullHandler()
            formatter = logging.Formatter()
        elif value == 'stdout':
            # Вывод лога в stdout
            handler = logging.StreamHandler(sys.stdout)
            formatter = logging.Formatter(
                '[%(asctime)s] %(name)s: %(levelname)s: %(message)s',
                timeformat,
            )
        else:
            # Запись лога в файл
            value = os.path.join(
                os.path.dirname(sys.argv[0]),
                value,
            )

            handler = logging.FileHandler(value)
            formatter = logging.Formatter(
                '[%(asctime)s] %(name)s: %(levelname)s: %(message)s',
                timeformat,
            )

        handler.setLevel(logging.INFO)
        handler.setFormatter(formatter)
        self.__logger.addHandler(handler)

    @staticmethod
    def _expandPath(path):
        """Раскрывает символ домашнего каталога (~) и
        переменные окружения соответсующими значениями
        Аргуметны:
            path: путь к файлу
        return:
            str: путь к файлу
        """
        return os.path.expandvars(
            os.path.expanduser(path)
        )

    @staticmethod
    def _expandGlob(globes):
        """Раскрывает символы подстановки globs
        Аргуметны:
            globes: список выражений для обработки
        return:
            list: пути к файлам
        """
        result = []
        for item in globes:
            result.extend(glob.glob(item))
        return result

    @staticmethod
    def _isChanged(source, destination):
        """Проверяет изменился ли файл source
        по сравнению с destination
        """
        return os.path.getmtime(source) > os.path.getmtime(destination)

    @staticmethod
    def _getDiff(source, destination):
        """Возвращает разницу между файлами
        """
        if Dotfiles._isChanged(source, destination):
            with open(source, 'r') as sourceFile:
                with open(destination, 'r') as destinationFile:
                    diff = difflib.unified_diff(
                        sourceFile.read().splitlines(),
                        destinationFile.read().splitlines(),
                        fromfile=source,
                        tofile=destination,
                        lineterm='',
                        n=1,
                    )
                    return diff

    def _getFiles(self, dotfiles):
        """Анализирует конфигурацию и создает
        список операций с файлами и каталогами
        Аргументы:
            dotfiles: конфигурация в формате dict
        return:
            list: список операций с файлами
        """
        result = []

        def addResult(action, source, obj):
            """Добавляет операцию  в список
            Аргументы:
                action: тип операции (mkdir, copyfile, copydir)
                source: путь к файлу (каталогу)
                object: имя файла (каталога)
            """
            result.append({
                'action': action,
                'source': source,
                'object': obj,
            })

        def crawler(dotfiles, config):
            """Производит анализ настроек и добавляет
            записи в список операции с файлами
            Аргументы:
                dotfiles: конфигурация обработки файлов
                    и каталогов в формате dict
                config: параметры обработки в формате dict
            """
            workdir = os.path.join(self.workdir, *config['workdir'])
            os.chdir(workdir)

            files = self._expandGlob(dotfiles.pop('files', []))
            folders = self._expandGlob(dotfiles.pop('dirs', []))
            exclude_files = self._expandGlob(dotfiles.pop('exclude_files', []))
            exclude_folders = self._expandGlob(dotfiles.pop('exclude_dirs', []))

            """Если присутвуют параметры 'exclude_files' или 'exclude_folders'
            копируем все объекты явно не указанные в них.
                Если exclude_ параметры отсутсвуют, копируем только объекты
            перечисленные в параметры 'files' и 'folders'
                Если задан параметр 'exclude_dirs_save_empty' создаем в
            репозитории пустые директории из параметра 'exclude_files'.
            """
            with os.scandir(workdir) as ls:
                for item in ls:
                    if item.is_dir():
                        if exclude_folders:
                            if item.name in exclude_folders:
                                if config['exclude_dirs_save_empty']:
                                    addResult('mkdir', config['workdir'], item.name)
                            else:
                                addResult('copydir', config['workdir'], item.name)
                        elif folders and item.name in folders:
                            addResult('copydir', config['workdir'], item.name)
                    elif item.is_file():
                        if exclude_files:
                            if item.name not in exclude_files:
                                addResult('copyfile', config['workdir'], item.name)
                        elif files and item.name in files:
                            addResult('copyfile', config['workdir'], item.name)

            # Обрабатываем явно заданые настройки для каталогов
            for folder in dotfiles:
                addResult('mkdir', config['workdir'], folder)
                folder_config = copy.deepcopy(config)
                folder_config['workdir'].append(folder)
                crawler(dotfiles[folder], folder_config)

        """Обрабатываем настройки каждой секции: параметры заданые в ключах
        секции перекрывают глобальные настойки работы скрипта.
        """
        for _, dotfile in dotfiles.items():
            config = {
                key: dotfile.pop(key, val) for key, val in self.config.items()
            }
            workdir = dotfile.pop("workdir", None)
            config['workdir'] = [workdir, ] if workdir else list()
            crawler(dotfile, config)
        return result

    def save(self, restore=False):
        """Сохраняет файлы в репозиторий
        Аргументы:
            restore: востановить файлы из репозитория
                (default: False)
        """

        def mkDir(source, destination):
            """Создает новый каталог со свойствами исходного каталога
            Аргументы:
                source: каталог источник
                destination:  каталог приемник
            """
            if not os.path.exists(destination):
                self.log.info("Create dir: '{}'".format(destination))
                if not self.dryrun:
                    os.makedirs(destination, exist_ok=True)
                    if source is None:
                        return None
                    shutil.copystat(source, destination)

        def copyFile(source, destination, symlinks=False):
            """Копирует файл с сохранение свойств
            Аргументы:
                source: файл источник
                destination: файл приемник
                symlinks: копировать файл вместо ссылки
                    (default: False)
            """
            # Копируем файл если в репозитории более старая версия
            if os.path.exists(destination):
                if self._isChanged(source, destination):
                    self.log.info("Replace file: from '{}' to '{}'".format(
                        source,
                        destination,
                    ))
                    if self.showDiff:
                        self.log.info("Diff: \n{}".format(
                            "\n".join(
                                [line for line in self._getDiff(source, destination)],
                            )
                        ))
                    if not self.dryrun:
                        os.remove(destination)
                        shutil.copy2(source, destination, follow_symlinks=symlinks)
            else:
                self.log.info("Copy file: from '{}' to '{}'".format(
                    source,
                    destination,
                ))
                if not self.dryrun:
                    shutil.copy2(source, destination, follow_symlinks=symlinks)

        def copyDir(source, destination, symlinks=False):
            """ Копирует директорию рекурсивно
            Аргументы:
                source: директория источник
                destination: директория приемник
                symlinks: копировать файл вместо ссылки
                    (default: False)
            """
            if os.path.isfile(source):
                copyFile(source, destination, symlinks=symlinks)
            elif os.path.isdir(source):
                # Если директория назначения не существует
                if not os.path.exists(destination):
                    self.log.info("Copy dir: from '{}' to '{}'".format(
                        source,
                        destination,
                    ))
                    if not self.dryrun:
                        # Рекурсивно копируем директорию
                        shutil.copytree(
                            source,
                            destination,
                            symlinks=not symlinks,
                        )
                else:
                    # Иначе, копируем директорию с заменой устаревших объектов
                    for item in os.scandir(source):
                        if item.is_file():
                            copyFile(
                                item.path,
                                os.path.join(destination, item.name),
                                symlinks=symlinks,
                            )
                        elif item.is_dir():
                            destinationDir = os.path.join(destination, item.name)
                            copyDir(item.path, destinationDir, symlinks=symlinks)

        src, dst = self.workdir, self.dotpath

        # Для востановления файлов просто меняем направление копирования
        if restore:
            src, dst = dst, src

        # Соответствие между операциями из списка и функциями с реализацией
        action = {'mkdir': mkDir, 'copyfile': copyFile, 'copydir': copyDir}

        self.log.info("Start to {} files...". format(
            'restore' if restore else 'save',
        ))

        # Создаем корневой каталог репозитория
        mkDir(None, self.dotpath)

        # Проходим по списку и выполняем действия над файлами и каталогами
        for item in self.files:
            source = os.path.join(src, *item['source'], item['object'])
            destination = os.path.join(dst, *item['source'], item['object'])
            action[item['action']](source, destination)
        self.log.info("Done!")

    def restore(self):
        """Восстанавливает файлы из репозитория
        """
        return self.save(restore=True)

    def clean(self):
        """Очищает репозиторий от файлов удаленных в системе
        """
        self.log.info("Start to delete files...")
        # Проходим по каталогу резпозитория
        for root, dirs, files in os.walk(self.dotpath, topdown=False):
            for name in files:
                item = os.path.join(root, name)
                # Проверяем наличие исходных файлов
                if not os.path.exists(os.path.join(
                        self.workdir,
                        os.path.relpath(item, self.dotpath),
                )):
                    self.log.info("Delete file: '{}'".format(
                        item,
                    ))
                    if not self.dryrun:
                        os.remove(item)
            for name in dirs:
                item = os.path.join(root, name)
                # Проверяем наличие исходных директорий
                if not os.path.exists(os.path.join(
                        self.workdir,
                        os.path.relpath(item, self.dotpath),
                )):
                    self.log.info("Delete dir: '{}'".format(
                        item,
                    ))
                    if not self.dryrun:
                        shutil.rmtree(item)
        self.log.info("Done!")


def _parseArgs():
    """Обработка аргументов командной строки
    """
    parser = argparse.ArgumentParser(
        description='Управление dofiles в репозитории:',
    )
    parser.add_argument('-c', '--config', action='store', default='config',
                        help="файл конфигурации (default: 'config')")
    parser.add_argument('-d', '--dry-run', action='store_true', default=False,
                        help="включить dry-run режим (default: False)")
    parser.add_argument('--show-diff', action='store_true', default=False,
                        help='Показать различия в файлах')

    # Может быть указан только один параметр из группы
    group = parser.add_argument_group('Режимы работы')
    group_mode = group.add_mutually_exclusive_group()
    group_mode.add_argument('--save', action='store_true', default=True,
                            help='сохранить файлы в репозиторий (default)')
    group_mode.add_argument('--restore', action='store_true', default=False,
                            help='востановить файлы из репозитория')
    group_mode.add_argument('--clean-repository', action='store_true', default=False,
                            help='очистить репозиторий от удаленных в системе файлов')

    currentArgs = parser.parse_args()
    if currentArgs.restore or currentArgs.clean_repository:
        currentArgs.save = False
    return currentArgs


def main():
    """Выполняется если скрипт запущен явно а не подключен как модуль:
    Копирует файлы и каталоги указанные в файле конфигурации в репозиторий.
    Позволяет также восстанавливать файлы и очищать репозиторий от файлов
    удаленных в системе. Подробнее в справке командной строки.
    """
    currentArgs = _parseArgs()

    dotfiles = Dotfiles(currentArgs.config)
    dotfiles.dryrun = currentArgs.dry_run
    dotfiles.showDiff = currentArgs.show_diff

    if currentArgs.save:
        dotfiles.save()
    elif currentArgs.restore:
        dotfiles.restore()
    elif currentArgs.clean_repository:
        dotfiles.clean()


if __name__ == '__main__':
    sys.exit(main())
