require File.dirname(__FILE__)+'/spec_helper'

describe "murmurs" do
#    it "gets murmurs for a card" do
#        murmurs = mingle.get_murmurs 'my_project'
#        murmurs.count.should == 2
#    end
    
    it "gets murmurs by project id" do
        web.should_receive(:get).
         with('my_project/murmurs.xml').and_return(no_murmurs)

        mingle.get_murmurs 'my_project'
    end

    it "gets the body" do
        murmurs = wrap_hack(mingle.get_murmurs 'my_project')
        murmurs.first.body.should == 'first murmur'
        murmurs.last.body.should == 'second murmur'
    end
    
    it "gets the author's name" do
        murmurs = wrap_hack(mingle.get_murmurs 'my_project')
        murmurs.first.author_name.should == 'Jim Author'
        murmurs.last.author_name.should == 'Jill Writer'
    end
    
    def mingle() @mingle ||= Mingle.new web end
    def web() @web ||= StubWebApi.new end
    def wrap_hack(list) System::Collections::Generic::List.of(System::Object).new(list) end
end

def no_murmurs
    '<murmurs type="array" />'.to_xml
end

def murmurs_xml
<<-MURMURS
<murmurs type="array">
    <murmur>
        <author>
            <name>Jim Author</name>
        </author>
        <body>first murmur</body>
    </murmur>
    <murmur>
        <author>
            <name>Jill Writer</name>
        </author>
        <body>second murmur</body>
    </murmur>
</murmurs>
MURMURS
end

