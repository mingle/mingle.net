require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'card_type tests' do

  it 'should instantiate a card type object from text xml' do
    MingleCardType.new(fake_cardtype).name.should == "Story"
  end

  it 'should instantiate a card type object from xelement xml' do
    MingleCardType.new(System::Xml::Linq::XElement.parse(fake_cardtype)).name.should == "Story"
  end

end

def fake_cardtype
<<-CARDTYPE
<?xml version="1.0" encoding="UTF-8"?> 
  <card_type> 
    <id type="integer">40</id> 
    <name>Story</name> 
    <color>#ff3300</color> 
    <position type="integer">1</position> 
    <property_definitions type="array"> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/242.xml"> 
        <name>Status</name> 
        <position nil="true"></position> 
        <data_type>string</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/248.xml"> 
        <name>Owner</name> 
        <position nil="true"></position> 
        <data_type>user</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/252.xml"> 
        <name>Story Points</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/263.xml"> 
        <name>Depend on</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/249.xml"> 
        <name>Date Created</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/268.xml"> 
        <name>Date Analysis Started</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/251.xml"> 
        <name>Date Analysis Ended</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/243.xml"> 
        <name>Date Development Started</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/244.xml"> 
        <name>Date Development Ended</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/258.xml"> 
        <name>Date Testing Started</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/259.xml"> 
        <name>Date Testing Ended</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/250.xml"> 
        <name>Date Accepted</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/274.xml"> 
        <name>Sprint Added to Scope</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/275.xml"> 
        <name>Sprint Completed</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/254.xml"> 
        <name>Epic Story</name> 
        <position type="integer">1</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/255.xml"> 
        <name>Feature</name> 
        <position type="integer">2</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/246.xml"> 
        <name>Release</name> 
        <position type="integer">1</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/247.xml"> 
        <name>Sprint</name> 
        <position type="integer">2</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/269.xml"> 
        <name>Estimated Task Hours</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
    </property_definitions> 
  </card_type> 
  CARDTYPE
  end