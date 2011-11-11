require File.dirname(__FILE__)+'/spec_helper'

xml_nil_value = System::Xml::Linq::XElement.load(File.dirname(__FILE__) + "/data/FakeElementNilValue.xml")
xml_value = System::Xml::Linq::XElement.load(File.dirname(__FILE__) + "/data/FakeElementValue.xml")
xml_value_string = System::IO::FileInfo.new(File.dirname(__FILE__) + "/data/FakeElementValue.xml").OpenText().ReadToEnd()

describe 'mingle_events_link' do
    it 'should construct mingle_events_nillable_value from xelement' do
        @val = MingleEventsElementNillableValue.new(xml_value).GetType().name.should == "MingleEventsElementNillableValue"
    end
    
    it 'should construct mingle_events_nillable_value from string' do
        @nilval = MingleEventsElementNillableValue.new(xml_value_string).GetType().name.should == "MingleEventsElementNillableValue"
    end
    it 'should get the value when not nil' do
        target = MingleEventsElementNillableValue.new(xml_value)
        expected = "123456"
        actual = target.value
        actual.should == expected
    end
    
    it 'should get the value when nil' do
        target = MingleEventsElementNillableValue.new(xml_nil_value)
        expected = nil
        actual = target.value
        actual.should == expected
    end        
end