require File.dirname(__FILE__)+'/spec_helper'

xml = System::Xml::Linq::XElement.load(File.dirname(__FILE__) + "/data/FakeEntryContent.xml")
xml_string = System::IO::FileInfo.new(File.dirname(__FILE__) + "/data/FakeEntryContent.xml").OpenText().ReadToEnd()

describe 'mingle_events_entry_content' do
    it 'should construct mingle_events_entry_content from xelement' do
        MingleEventsEntryContent.new(xml).GetType().name.should == "MingleEventsEntryContent"
    end
    
    it 'should construct mingle_events_entry_content from string' do
        MingleEventsEntryContent.new(xml_string).GetType().name.should == "MingleEventsEntryContent"
    end
    it 'should count the changes' do
        target = MingleEventsEntryContent.new(xml)
        expected = 8
        actual = target.changes.count()
        actual.should == expected
    end
    
    it 'should get the property-change changes' do
        actual = MingleEventsEntryContent.new(xml).Changes[3]
        actual.PropertyDefinition.Name.should == "Hours Remaining"
        actual.PropertyDefinition.Position.should == nil
        actual.PropertyDefinition.DataType.should == "numeric"
        actual.property_definition.is_numeric.should == true
        actual.old_value.value.should == nil
        actual.new_value.value.should == "1"
    end    
    
    it 'should get the author name' do
        target = MingleEventsFeedEntry.new(System::Xml::Linq::XElement.load(File.dirname(__FILE__) + "/data/FakeMingleEventsEntry.xml"))
        expected = "Mark Richter"
        actual = target.author_name
        actual.should == expected
    end
    
    it 'should get the author uri' do
    end    
end