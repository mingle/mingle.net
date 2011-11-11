require File.dirname(__FILE__)+'/spec_helper'

xml = System::Xml::Linq::XElement.load(File.dirname(__FILE__) + "/data/FakeMingleEventsFeed.xml")
xml_string = System::IO::FileInfo.new(File.dirname(__FILE__) + "/data/FakeMingleEventsFeed.xml").OpenText().ReadToEnd()

describe 'mingle_events_feed' do
    it 'should construct mingle_events_feed from xelement' do
        MingleEventsFeed.new(xml).GetType().name.should == "MingleEventsFeed"
    end
    
    it 'should construct mingle_events_feed from string' do
        MingleEventsFeed.new(xml_string).GetType().name.should == "MingleEventsFeed"
    end
    
    it 'should get the feed_id' do
        target = MingleEventsFeed.new(xml)
        expected = "http://frodo:8080/api/v2/projects/test/feeds/events.xml"
        actual = target.id
        actual.should == expected
    end
    
    it 'should get the feed_title' do
        target = MingleEventsFeed.new(xml)
        expected = "http://frodo:8080/api/v2/projects/test/feeds/events.xml"
        actual = target.id
        actual.should == expected
    end        

    it 'should count the links in the feed' do
        target = MingleEventsFeed.new(xml)
        expected = 13
        actual = target.entries.count
        actual.should == expected
    end        

    it 'should get the date the feed was updated' do
        target = MingleEventsFeed.new(xml)
        expected = System::Convert.ToDateTime(System::String.new("2011-09-20T21:15:40Z"))
        actual = target.updated
        actual.should == expected
    end        

end