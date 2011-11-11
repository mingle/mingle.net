def fake_card79
<<-CARD79
  <card>
    <name>45: Write tests</name>
    <description nil="true"></description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml">
      <name>Task</name>
    </card_type>
    <id type="integer">531</id>

    <number type="integer">79</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">1</project_card_rank>

    <created_on type="datetime">2011-08-12T17:59:41Z</created_on>
    <modified_on type="datetime">2011-08-12T17:59:41Z</modified_on>
    <modified_by url="http://localhost:8080/api/v2/users/1.xml">
      <name>Mark Richter</name>
      <login>mrichter</login>
    </modified_by>
    <created_by url="http://localhost:8080/api/v2/users/1.xml">

      <name>Mark Richter</name>
      <login>mrichter</login>
    </created_by>
    <properties type="array">
      <property type_description="Managed text list" hidden="false">
        <name>Task Status</name>
        <value>New</value>

      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value nil="true"></value>

      </property>
      <property type_description="Date" hidden="true">
        <name>Date Task Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Hours Remaining</name>
        <value>2</value>

      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">

        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/3.xml">
          <number type="integer">3</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Story</name>

        <value url="http://localhost:8080/api/v2/projects/test/cards/45.xml">
          <number type="integer">45</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=531&amp;content_provider%5Btype%5D=card">

    </rendered_description>
  </card>
CARD79
end