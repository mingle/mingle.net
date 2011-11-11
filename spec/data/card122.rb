def fake_card122
<<-CARD122
<cards type="array"> 
<card> 
<name>Test Story</name> 
<description>h2. Narrative



As a ______________, I can ______________, so that ______________.





h2. Acceptance Criteria



_Enter the Acceptance Criteria here._





h2. Related Stories



* #0

* #0





















h2. Tasks



{{table query: SELECT Number, Name, Owner, 'Estimated Hours', 'Task Status' WHERE Type = Task and Story = THIS CARD}}





h2. Defects



{{table query: SELECT Number, Name, Owner, Priority, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description> 
<card_type url="http://frodo:8443/api/v2/projects/test/card_types/23.xml"> 
    <name>Story</name> 
</card_type> 
<id type="integer">430</id> 
<number type="integer">122</number> 
<project url="http://frodo:8443/api/v2/projects/test.xml"> 
    <name>test</name> 
    <identifier>test</identifier> 
</project> 
<version type="integer">1</version> 
<project_card_rank type="integer">1</project_card_rank> 
<created_on type="datetime">2011-05-17T19:08:04Z</created_on> 
<modified_on type="datetime">2011-05-17T19:08:04Z</modified_on> 
<modified_by url="http://frodo:8443/api/v2/users/2.xml"> 
    <name>admin</name> 
    <login>admin</login> 
</modified_by> 
<created_by url="http://frodo:8443/api/v2/users/2.xml"> 
    <name>admin</name> 
    <login>admin</login> 
</created_by> 
<properties type="array"> 
    <property type_description="Managed text list" hidden="false"> 
    <name>Status</name> 
    <value>Ready for Analysis</value> 
    </property> 
    <property type_description="Managed text list" hidden="false"> 
    <name>Priority</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Automatically generated from the team list" hidden="false"> 
    <name>Owner</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Managed number list" hidden="false"> 
    <name>Story Points</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Card" hidden="false"> 
    <name>Depend on</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Date" hidden="true"> 
    <name>Date Created</name> 
    <value type="date">2010-03-01</value> 
    </property> 
    <property type_description="Date" hidden="true"> 
    <name>Date Analysis Started</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Date" hidden="true"> 
    <name>Date Analysis Ended</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Date" hidden="true"> 
    <name>Date Development Started</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Date" hidden="true"> 
    <name>Date Development Ended</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Date" hidden="true"> 
    <name>Date Testing Started</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Date" hidden="true"> 
    <name>Date Testing Ended</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Date" hidden="true"> 
    <name>Date Accepted</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Date" hidden="true"> 
    <name>Date of BA Approval</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Aggregate" hidden="false"> 
    <name>Estimated Task Hours</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Card" hidden="true"> 
    <name>Sprint Added to Scope</name> 
    <value url="http://frodo:8443/api/v2/projects/test/cards/24.xml"> 
        <number type="integer">24</number> 
    </value> 
    </property> 
    <property type_description="Card" hidden="true"> 
    <name>Sprint Completed</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Card" hidden="true"> 
    <name>Scope</name> 
    <value url="http://frodo:8443/api/v2/projects/test/cards/21.xml"> 
        <number type="integer">21</number> 
    </value> 
    </property> 
    <property type_description="Any card used in tree" hidden="false"> 
    <name>Epic Story</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Any card used in tree" hidden="false"> 
    <name>Release</name> 
    <value url="http://frodo:8443/api/v2/projects/test/cards/21.xml"> 
        <number type="integer">21</number> 
    </value> 
    </property> 
    <property type_description="Any card used in tree" hidden="false"> 
    <name>Feature</name> 
    <value nil="true"></value> 
    </property> 
    <property type_description="Any card used in tree" hidden="false"> 
    <name>Sprint</name> 
    <value url="http://frodo:8443/api/v2/projects/test/cards/25.xml"> 
        <number type="integer">25</number> 
    </value> 
    </property> 
</properties> 
<tags> 
</tags> 
</card> 
</cards>
CARD122
end