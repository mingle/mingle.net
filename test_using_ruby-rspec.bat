@echo off
call buildvars
call bundle install --deployment vendor
rake spec



