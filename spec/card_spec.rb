require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'card' do
    before(:all) do
        run_fake_mingle
    end

    before do
        # Create a MingleCardSet object
        securePassword = System::Security::SecureString.new
        password = System::String.new("secret")
        password.ToCharArray.each {|c| securePassword.AppendChar(c)}
        @cards = MingleCardCollection.new(MingleServer.new("http://localhost:9123", "mingleuser", securePassword).GetProject("test"))
        #System::Diagnostics::Debugger.Break()
        @cards.parse()
        @thecard = @cards[0]
    end
    
    it "should get the cards" do
        @cards.Count.should == 25
    end 
    
    it "should get name" do
        @thecard.name.should == "45: Write tests"
    end
 
    it "should get CardTypeUrl" do
        @thecard.card_type_url.should == "http://localhost:8080/api/v2/projects/test/card_types/42.xml"
    end
    
    it "should get Number" do
        @thecard.number.should == 79
    end
 
    it "should get ProjectName" do
        @thecard.project_name.should == "test"
    end
 
    it "should get ProjectId" do
        @thecard.project_id.should == "test"
    end
    
    it "should get the collection ProjectId" do
        @cards.project_id.should == "test"
    end
    
    it "should get ProjectUrl" do
        @thecard.project_url.should == "http://localhost:8080/api/v2/projects/test.xml"
    end
 
    it "should get Version" do
        @thecard.version.should == "1"
    end

    it "should get ProjectCardRank" do
        @thecard.project_card_rank.should == 1
    end

    it "should get CreatedOn" do
        @thecard.created_on.to_string.starts_with("8/12/2011 10:59:41").should == true
    end
 
    it "should get ModifiedOn" do
        @thecard.modified_on.to_string.starts_with("8/12/2011 10:59:41").should == true
    end
    
    it "should get ModifiedByLogin" do
        @thecard.modified_by_login.should == "mrichter"
    end
    
    it "should get ModifiedByUrl" do
        @thecard.modified_by_url.should == "http://localhost:8080/api/v2/users/1.xml"
    end
    it "should get CreatedByLogin" do
        @thecard.created_by_login.should == "mrichter"
    end
    
    it "should get CreatedByUrl" do
        @thecard.created_by_url.should == "http://localhost:8080/api/v2/users/1.xml"
    end
    
    it "should get ModifiedByName" do
        @thecard.modified_by_name.should == "Mark Richter"
    end
    
    it "should get CreatedByName" do
        @thecard.created_by_name.should == "Mark Richter"
    end
    
    it "should count the CardProperties" do
        @thecard.card_properties.count.should == 8
    end
    
    it "should count the Transitions" do
        @thecard.transitions.count.should == 11
    end
    
    it "should count the Postdata" do
        @thecard.post_data.count.should == 0
    end
    
    it 'should get card number 122' do
        @cards.Parse(122)
        @thecard = @cards[0]
        @thecard.name.should == "45: Write tests"
    end
    
    it 'should count the properties for the card' do
        @cards.Parse(79)[0].card_properties.count.should == 8 
    end
    
    it 'should check the property name' do
        @cards.Parse(79)[0].card_properties["Release"].name.should == "Release"
    end
    
    it 'should check the property value' do
        @cards.Parse(79)[0].card_properties["Release"].value.should == "1"
    end
    
    it 'should check the property url' do
        @cards.Parse(79)[0].card_properties["Release"].value_url.should == "http://localhost:8080/api/v2/projects/test/cards/1.xml"   
    end
    
    it 'gets the rendered description' do
        System::String.new(@thecard.rendered_description).starts_with(System::String.new("http")).should == true
    end
    

end

