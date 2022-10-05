#! /bin/bash

flutter pub run easy_localization:generate -f keys -S './assets/translations/' -O './lib/generated/' -o 'locale_keys.g.dart'