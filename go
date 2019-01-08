#!/bin/sh

dylan-compiler -build fff
dylan-compiler -build fff-app

_build/bin/fff-app