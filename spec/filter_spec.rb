require File.dirname(__FILE__)+'/spec_helper'

describe 'filter tests' do
    before do
        @filter = ThoughtWorksMingleLib::MingleFilter.new
        @filter.name = "myprop"
        @filter.value = "myvalue"
        @filter.Condition = "<="
    end
            
    it 'formats a filters string' do
        @filter.FilterFormatString.should == "filters[]=[myprop][<=][myvalue]"       
    end
    
    it 'formats a card data string' do
        @filter.CardDataString.should == "card[myprop]=myvalue"       
    end
    
    it 'formats a favorite string' do
        @filter.FavoriteString.should == "myprop=myvalue"       
    end
    
    it 'formats a card property name string' do
        @filter.CardPropertyNameString.should == "card[properties][][name]=myprop"
    end
    
    it 'formats a card property name string' do
        @filter.CardPropertyValueString.should == "card[properties][][value]=myvalue"
    end

    it 'formats a transition execution string' do
        @filter.TransitionFormatString.should == "transition_execution[myprop]=[myvalue]"
    end
    
    it 'formats a mql filter string' do
        @filter.MqlString.should == "myprop <= 'myvalue'"
    end

end