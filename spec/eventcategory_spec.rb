require File.dirname(__FILE__)+'/spec_helper'

xml = System::Xml::Linq::XElement.load(File.dirname(__FILE__) + "/data/FakeCategory.xml")

describe 'mingle_events_link' do
    it 'should construct mingle_events_category' do
        MingleEventsCategory.new(xml).GetType().name.should == "MingleEventsCategory"
    end
    
    it 'should get the scheme attribute' do
        target = MingleEventsCategory.new(xml)
        expected = "http://www.thoughtworks-studios.com/ns/mingle#categories"
        actual = target.scheme
        actual.should == expected
    end
    
    it 'should get the term attribute' do
        target = MingleEventsCategory.new(xml)
        expected = "description-change"
        actual = target.Term
        actual.should == expected
    end        
end