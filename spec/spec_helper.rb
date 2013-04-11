$LOAD_PATH << File.dirname(__FILE__) + '/../nuget/lib/net40'

require 'ThoughtWorksCoreLib.dll'
require 'ThoughtWorksMingleLib.dll'
require 'rubygems'

include ThoughtWorksCoreLib
include ThoughtWorksMingleLib

require 'sinatra/base'
class Sinatra::Base
    def self.fork!(options={})
       app = Thread.new { run! options }
        # wait for it...
        while(app.status != 'sleep') do end
    end
end

class String
    def to_xml
        System::Xml::Linq::XElement.parse self
    end
end

class StubWebApi
    require 'System.Xml.Linq'
    include IWebApi
    
    def get(uri)
        System::Xml::Linq::XElement.parse murmurs_xml
    end
end

def BreakHere
    System::Diagnostics::Debugger.Break()
end

def LOG(message)
    puts "\n***********\n" + message + "\n**********\n"
end

def IN_PROGRESS
    begin
        yield
        raise "Unexpected success"
        rescue Spec::Expectations::ExpectationNotMetError
    end
end

def apitest
	'apitest'
end
