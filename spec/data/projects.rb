def fake_projectlist
<<-PROJECTLIST
<?xml version="1.0" encoding="UTF-8"?> 
<projects type="array"> 
  <project> 
    <name>nathan</name> 
    <identifier>nathan</identifier> 
    <description>This project holds the latest updates to templates for the Catalyst Programme. When creating new Catalyst projects the template used should be derived from the latest state of this project. Initially created for Andy Carmichael.</description> 
    <created_at type="datetime">2011-01-28T12:04:52Z</created_at> 
    <updated_at type="datetime">2011-08-10T20:28:26Z</updated_at> 
    <created_by url="http://localhost:8080/api/v2/users/1.xml"> 
      <name>Mark Richter</name> 
      <login>mrichter</login> 
    </created_by> 
    <modified_by url="http://localhost:8080/api/v2/users/1.xml"> 
      <name>Mark Richter</name> 
      <login>mrichter</login> 
    </modified_by> 
    <keywords> 
      <keyword>card</keyword> 
      <keyword>#</keyword> 
    </keywords> 
    <template nil="true"></template> 
    <email_address nil="true"></email_address> 
    <email_sender_name nil="true"></email_sender_name> 
    <date_format>%d %b %Y</date_format> 
    <time_zone>London</time_zone> 
    <precision type="integer">2</precision> 
    <anonymous_accessible type="boolean">false</anonymous_accessible> 
    <auto_enroll_user_type nil="true"></auto_enroll_user_type> 
  </project> 
  <project> 
    <name>test</name> 
    <identifier>test</identifier> 
    <description> 
    </description> 
    <created_at type="datetime">2011-08-12T17:59:34Z</created_at> 
    <updated_at type="datetime">2011-08-12T17:59:42Z</updated_at> 
    <created_by url="http://localhost:8080/api/v2/users/1.xml"> 
      <name>Mark Richter</name> 
      <login>mrichter</login> 
    </created_by> 
    <modified_by url="http://localhost:8080/api/v2/users/1.xml"> 
      <name>Mark Richter</name> 
      <login>mrichter</login> 
    </modified_by> 
    <keywords> 
      <keyword>card</keyword> 
      <keyword>#</keyword> 
    </keywords> 
    <template nil="true"></template> 
    <email_address> 
    </email_address> 
    <email_sender_name> 
    </email_sender_name> 
    <date_format>%d %b %Y</date_format> 
    <time_zone>Arizona</time_zone> 
    <precision type="integer">2</precision> 
    <anonymous_accessible type="boolean">false</anonymous_accessible> 
    <auto_enroll_user_type nil="true"></auto_enroll_user_type> 
  </project> 
</projects> 
PROJECTLIST
end