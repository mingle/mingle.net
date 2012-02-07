require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'project' do

    it 'creates a card' do
        proj = MingleServer.new("http://localhost:8080","mingleuser","secret").GetProject("apitest")
        card = proj.create_card("story", "This is a new card")
        card.type.should == "Story" 
    end

    it 'should get a property of managed list of text items' do
        proj = MingleServer.new("http://localhost:8080", "mingleuser", "secret").GetProject("apitest")
        card = proj.get_card(120)
        card.card_properties["Priority"].value.should == "Essential"
        card.card_properties["Story Status"].value.should == "New"
        card.card_properties["Owner"].value.should == "mingleuser"
    end
    
    it 'should get results from execute_mql' do
        proj = MingleServer.new("http://localhost:8080", "mingleuser", "secret").GetProject("apitest")
        results = proj.exec_mql("select count(number)")
        proj.results_count(results).should == 1
    end    
    
    it 'posts a murmur' do
        now = System::DateTime.now
        proj = MingleServer.new("http://localhost:8080", "mingleuser", "secret").GetProject("apitest")
        count = proj.get_murmurs.count
        proj.send_murmur("I was murmured at " + now.to_string)
        proj.get_murmurs.count.should == count + 1
    end
end
