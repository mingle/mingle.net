require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'transition tests' do

    before do
        # Make a MingleTransitionSet object
        securePassword = System::Security::SecureString.new
        password = System::String.new("secret")
        @tset = MingleTransitionCollection.new(MingleServer.new(ENV['MINGLETESTTARGET'],"mingleuser",password).GetProject(apitest));
        @tset.Parse();

    end

    # test property value from different cards
    it 'should count the transitions' do
        @tset.Count.should == 19;
    end
    
    it 'should get the card type property' do
        @tset["Add to Current Iteration"].CardTypeName.should == "Story";  
    end
    
    it 'should get the transition id' do
        (@tset["Add to Current Iteration"].Id > 0).should == true
    end
    
    it 'should get the url string' do
        @tset["Add to Current Iteration"].Url.contains("/api/v2/projects/apitest/transition_executions/").should == true
    end
    
    it 'should get the require comment property' do
        @tset["Add to Current Iteration"].RequireComment.should == false
    end
    
    it 'should get the required user input property' do
        @tset["Close Defect"].RequiredUserInput.count.should == 1 
    end
    
    it 'should get the if card has properties property' do
        @tset["Close Defect"].IfCardHasProperties.count.should == 1 
    end
    
    it 'should get the will set card properties property' do
        @tset["Close Defect"].WillSetCardProperties.count.should == 2 
    end
    
#    it 'should update a transition on a card' do
#        mingle = MingleServer.new(ENV['MINGLETESTTARGET'],"mingleuser","secret")
#        data = System::Collections::ObjectModel::Collection[System::String].new
#        data.Add("transition_execution[card]=93")
#        response = mingle.Post("apitest","/transition_executions/93.xml",data)
#        xdoc = System::Xml::Linq::XElement.parse(response.body)
#        xdoc.element(System::String.new("error")).value.should == "Finish Task is not applicable to Card #74."
#    end
end