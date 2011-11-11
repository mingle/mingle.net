require File.dirname(__FILE__)+'/spec_helper'

describe "mingle results set" do
#    it "get results" do
#        web.should_receive(:get).
#          with('my_project/cards/execute_mql.xml?mql=SELECT Some Stuff').and_return(results.to_xml)
#        
#        results = mingle.get_results 'my_project', 'SELECT Some Stuff'
#        results.first.priority.should ==  'Low'     
#    end
    
    def mingle() @mingle ||= Mingle.new web end
    def web() @web ||= StubWebApi.new end
    
    def results
<<-RESULTS
<results type="array"> 
  <result> 
    <priority>Low</priority> 
  </result> 
</results>
RESULTS
    end
end