@echo off
call buildvars.bat
call bundle install --deployment vendor
rake.bat build
