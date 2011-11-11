require File.dirname(__FILE__)+'/spec_helper'

xml = System::Xml::Linq::XElement.load(File.dirname(__FILE__) + "/data/FakeLink.xml")

describe 'mingle_events_link' do
    it 'should construct mingle_events_link' do
        MingleEventsLink.new(xml).GetType().name.should == "MingleEventsLink"
    end
    
    it 'should get the href attribute' do
        target = MingleEventsLink.new(xml)
        expected = "http://frodo:8080/projects/test/cards/79?version=3"
        actual = target.href
        actual.should == expected
    end
    
    it 'should get the rel attribute' do
        target = MingleEventsLink.new(xml)
        expected = "http://www.thoughtworks-studios.com/ns/mingle#version"
        actual = target.rel
        actual.should == expected
    end        

    it 'should get the type attribute' do
        target = MingleEventsLink.new(xml)
        expected = "text/html"
        actual = target.type
        actual.should == expected
    end
    
    it 'should get the title attribute' do
        target = MingleEventsLink.new(xml)
        expected = "Task #79 (v3)"
        actual = target.title
        actual.should == expected
    end        
            
end