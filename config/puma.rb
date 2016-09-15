#!/usr/bin/env puma

plugin :heroku

quiet ENV['PUMA_VERBOSE'].to_s.empty?
