require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'project_member' do

    before do
        securePassword = System::Security::SecureString.new
        password = System::String.new("secret")
        @userset = MingleProjectMemberCollection.new(MingleServer.new(ENV['MINGLETESTTARGET'],"mingleuser",password).GetProject(apitest)).Parse()
    end
    
    it 'should count the members' do
        @userset.count.should == 4;
    end
    
    it 'should get the admin property' do
        @userset["mingleuser"].project_admin.should == false
    end
    
    it 'should get the user_id' do
        @userset["mingleuser"].user_id.should > 0
    end
    
    it 'should get the user name' do
        @userset["mingleuser"].user_name.should == "Mingle User"
    end
    
    it 'should get the user login' do
        @userset["mingleuser"].user_login.should == "mingleuser"
    end
    
    it 'should get the user email' do
        @userset["mingleuser"].user_email.should == "mingleuser@foo.com"
    end
    
    it 'should get the light user property' do
        @userset["mingleuser"].user_light.should == false
    end
    
    it 'should get the icon_path' do
        @userset["mingleuser"].user_icon_path.should == ""
    end
end