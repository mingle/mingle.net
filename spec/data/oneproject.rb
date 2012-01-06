def fake_project
<<-ONEPROJECT
<?xml version="1.0" encoding="UTF-8"?>
<project>
  <name>api test project</name>
  <identifier>test</identifier>
  <description>this is a project for testing</description>
  <created_at type="datetime">2011-11-29T22:52:34Z</created_at>
  <updated_at type="datetime">2012-01-04T22:36:16Z</updated_at>

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
  <time_zone>Pacific Time (US &amp; Canada)</time_zone>
  <precision type="integer">2</precision>
  <anonymous_accessible type="boolean">false</anonymous_accessible>

  <auto_enroll_user_type nil="true"></auto_enroll_user_type>
</project>
ONEPROJECT
end