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
        project = MingleServer.new(ENV['MINGLETESTTARGET'], "mingleuser", securePassword).GetProject(apitest)
        @thecard = project.get_card(17)
    end
    
    it "should get name" do
        @thecard.name.should == "Reply to email"
    end
 
    it "should get CardTypeUrl" do
        @thecard.card_type_url.contains("/api/v2/projects/apitest/card_types").should == true
    end
    
    it "should get Number" do
        @thecard.number.should == 17
    end
 
    it "should get ProjectName" do
        @thecard.project_name.should == "apitest"
    end
 
    it "should get ProjectId" do
        @thecard.project_id.should == "apitest"
    end
    
    it "should get ProjectUrl" do
        @thecard.project_url.contains("/api/v2/projects/apitest.xml").should == true
    end
 
    it "should get Version" do
        @thecard.version.should == "1"
    end

    it "should get ProjectCardRank" do
        @thecard.project_card_rank.should == 100
    end

    it "should get CreatedOn" do
        @thecard.created_on.to_string.starts_with("11/29/2011").should == true
    end
 
    it "should get ModifiedOn" do
        @thecard.modified_on.to_string.starts_with("11/29/2011").should == true
    end
    
    it "should get ModifiedByLogin" do
        @thecard.modified_by_login.should == "mingleuser"
    end
    
    it "should get ModifiedByUrl" do
        @thecard.modified_by_url.contains("/api/v2/users").should == true
    end
    it "should get CreatedByLogin" do
        @thecard.created_by_login.should == "mingleuser"
    end
    
    it "should get CreatedByUrl" do
        @thecard.created_by_url.contains("/api/v2/users").should == true
    end
    
    it "should get ModifiedByName" do
        @thecard.modified_by_name.should == "Mingle User"
    end
    
    it "should get CreatedByName" do
        @thecard.created_by_name.should == "Mingle User"
    end
    
    it "should count the CardProperties" do
        @thecard.card_properties.count.should == 24
    end
    
    it "should count the Transitions" do
        @thecard.transitions.count.should == 4
    end
    
    it "should count the Postdata" do
        @thecard.post_data.count.should == 0
    end
    
    it 'gets the rendered description' do
        System::String.new(@thecard.rendered_description).contains(System::String.new("/api/v2/projects/apitest/render?content_provider")).should == true
    end
    

end

