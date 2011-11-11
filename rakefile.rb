require 'rspec/core/rake_task'

sln = ENV["SOLUTION"]
cfg = ENV["CONFIG"]
dotnet = ENV["DOTNETPATH"]
vspath = ENV["VSPATH"]
unitTestContainer = ENV["TESTCONTAINER"]

task :build => [:compile, :spec]

task :compile do
	puts "Building '#{sln}' using '#{cfg}' configuration."
	sh "#{dotnet}msbuild.exe /t:Rebuild /p:configuration=#{cfg} #{sln}"
end

task :compilenoconfig do
	puts "Building '#{sln}'."
	sh "#{dotnet}msbuild.exe /t:Rebuild #{sln}"
end

task :runUnitTests do
	puts "Running tests for test container: '#{unitTestContainer}'"
	sh "\"#{vspath}mstest.exe\" /testcontainer:#{unitTestContainer}"
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.skip_bundler = true
end

task :install do
	clean '.bundle'
	mkdir 'vendor' unless File.exists? 'vendor'
	sh 'bundle install --path vendor'
end


def clean path
	rm_r path if File.exists? path
end
