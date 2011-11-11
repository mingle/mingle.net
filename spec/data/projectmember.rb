def fake_projectmembers
<<-PROJECTMEMBERS
<?xml version="1.0" encoding="UTF-8"?> 
<projects_members type="array"> 
  <projects_member> 
    <id>proj7_1</id> 
    <admin type="boolean">false</admin> 
    <readonly_member type="boolean">false</readonly_member> 
    <user url="http://localhost:8080/api/v2/users/1.xml"> 
      <id type="integer">1</id> 
      <name>Mark Richter</name> 
      <login>mrichter</login> 
      <email nil="true"></email> 
      <light type="boolean">false</light> 
      <icon_path nil="true"></icon_path> 
    </user> 
    <project url="http://localhost:8080/api/v2/projects/test.xml"> 
      <name>test</name> 
      <identifier>test</identifier> 
    </project> 
  </projects_member> 
  <projects_member> 
    <id>proj7_30</id> 
    <admin type="boolean">false</admin> 
    <readonly_member type="boolean">false</readonly_member> 
    <user url="http://localhost:8080/api/v2/users/30.xml"> 
      <id type="integer">30</id> 
      <name>mingleuser</name> 
      <login>mingleuser</login> 
      <email nil="true"></email> 
      <light type="boolean">false</light> 
      <icon_path nil="true"></icon_path> 
    </user> 
    <project url="http://localhost:8080/api/v2/projects/test.xml"> 
      <name>test</name> 
      <identifier>test</identifier> 
    </project> 
  </projects_member> 
</projects_members>  
PROJECTMEMBERS
end