require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'integration' do

    it 'creates a card' do
        proj = MingleServer.new(ENV['MINGLETESTTARGET'],"mingleuser","secret").GetProject(apitest)
        card = proj.create_card("Defect", "This is a new card")
        card.type.should == "Defect" 
    end

    it 'should get a property of managed list of text items' do
        proj = MingleServer.new(ENV['MINGLETESTTARGET'], "mingleuser", "secret").GetProject(apitest)
        card = proj.get_card(120)
        card.card_properties["Priority"].value.should == "Essential"
        card.card_properties["Story Status"].value.should == "New"
        card.card_properties["Owner"].value.should == "mingleuser"
        
    end
    
    it 'should get results from execute_mql' do
        proj = MingleServer.new(ENV['MINGLETESTTARGET'], "mingleuser", "secret").GetProject(apitest)
        results = proj.exec_mql("select count(number)")
        proj.results_count(results).should == 1
    end    
    
    it 'posts a murmur' do
        now = System::DateTime.now
        proj = MingleServer.new(ENV['MINGLETESTTARGET'], "mingleuser", "secret").GetProject(apitest)
		body = now.to_string
        proj.send_murmur(body).body.should == body
    end
    
    it 'updates the value of a property with a multi-worded name' do
        proj = MingleServer.new(ENV['MINGLETESTTARGET'], "mingleuser", "secret").GetProject(apitest)
        card = proj.get_card(120)
        card.AddPropertyFilterToPostData("Two Word","New value")
        card.Update()
        target = proj.get_card(120)
        target.card_properties["Two Word"].value.should == "New value"
        target.AddPropertyFilterToPostData("Two Word","")
        target.Update
        card = proj.get_card(120)
        target.card_properties["Two Word"].value.should == ""
    end

    it 'updates the value of a property' do
        proj = MingleServer.new(ENV['MINGLETESTTARGET'], "mingleuser", "secret").GetProject(apitest)
        card = proj.get_card(120)
        card.AddPropertyFilterToPostData("TestProperty","New value")
        card.Update()
        target = proj.get_card(120)
        target.card_properties["TestProperty"].value.should == "New value"
        target.AddPropertyFilterToPostData("TestProperty","")
        target.Update
        card = proj.get_card(120)
        target.card_properties["TestProperty"].value.should == ""
    end
    
    it 'gets the indirect cards by type name' do
        proj = MingleServer.new(ENV['MINGLETESTTARGET'],"mingleuser","secret").GetProject(apitest)
        proj.get_cards_of_type("Iteration").count.should == 11
    end
    
        
    it 'gets the list of projects' do
        @mingle = MingleServer.new(ENV['MINGLETESTTARGET'],"mingleuser", "secret")
        @mingle.get_project_list().count.should > 0
    end

	it 'updates the card name' do
		card = MingleServer.new(ENV['MINGLETESTTARGET'],"mingleuser", "secret").get_project(apitest).get_card(45)
		card.add_card_attribute_filter_to_post_data("name", "xxx")
		card.update
		card.name.should == "xxx"
		card.add_card_attribute_filter_to_post_data("name", "ready to test")
		card.update
		card.name.should == "ready to test"
	end
    
end
