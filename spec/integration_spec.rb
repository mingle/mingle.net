require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'card' do
    before do
        host = "http://localhost:8080"
        user = "mingleuser"
        pw = "secret"
        @project = MingleServer.new(host, user, pw).get_project("apitest")
    end
    
    it 'update invalid property name should fail' do
        card = @project.get_card(7)
        card.add_property_filter_to_post_data("bogus", "value")
        lambda {card.update()}.should raise_error(MingleWebException)
    end
end