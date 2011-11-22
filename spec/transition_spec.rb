require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'transition tests' do

    before do
        # Make a MingleTransitionSet object
        securePassword = System::Security::SecureString.new
        password = System::String.new("secret")
        password.ToCharArray.each {|c| securePassword.AppendChar(c)}
        @tset = MingleTransitionCollection.new(MingleServer.new("http://localhost:9123","mingleuser",securePassword).GetProject("test"));
        @tset.Parse();

    end

    # test property value from different cards
    it 'should count the transitions' do
        @tset.Count.should == 11;
    end
    
    it 'should get the card type property' do
        @tset["Complete Testing"].CardTypeName.should == "Story";  
    end
    
    it 'should get the transition id' do
        @tset["Complete Testing"].Id.should == 82
    end
    
    it 'should get the url string' do
        @tset["Complete Testing"].Url.should == "http://localhost:8080/api/v2/projects/test/transition_executions/82.xml"
    end
    
    it 'should get the require comment property' do
        @tset["Complete Testing"].RequireComment.should == false
        @tset["Complete Fix"].RequireComment.should == true
    end
    
    it 'should get the required user input property' do
        @tset["Start Task"].RequiredUserInput.count.should == 1 
    end
    
    it 'should get the if card has properties property' do
        @tset["Start Task"].IfCardHasProperties.count.should == 1 
    end
    
    it 'should get the will set card properties property' do
        @tset["Start Fix"].WillSetCardProperties.count.should == 2 
    end
    
    it 'should update a transition on a card' do
        mingle = MingleServer.new("http://localhost:9123","mingleuser","secret")
        data = System::Collections::ObjectModel::Collection[System::String].new
        data.Add("transition_execution[card]=74")
        response = mingle.Post("","http://localhost:9123/api/v2/projects/test/transition_executions/87.xml",data, true)
        xdoc = System::Xml::Linq::XElement.parse(response)
        xdoc.element(System::String.new("status")).value.should == "completed"
    end
end