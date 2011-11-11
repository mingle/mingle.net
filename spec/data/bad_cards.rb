def bad_cards
<<-BADCARDS
  <card>

    <name>Release Backlog</name>
    <description>h2. Stories in this Sprint

{{table query: SELECT Number, Name, Status, 'Story Points' WHERE Type = Story AND Sprint = THIS CARD}}

|\3. Total Points | {{value query: SELECT SUM('Story Points') WHERE Sprint = THIS CARD}} |
|\3. Accepted Points | {{value query: SELECT SUM('Story Points') WHERE Sprint = THIS CARD AND Status = Accepted}} |

h2. Burndown

{{ 
  data-series-chart 
    conditions: Sprint = THIS CARD AND 'Type' = 'Task'
    cumulative: True

    x-labels-start: THIS CARD.Start Date
    x-labels-end: THIS CARD.End Date
    x-labels-step: 1

    x-title: Date
    y-title: Estimated Task Hours


    chart-width: 800
    plot-width: 550
    chart-height: 320

    series: 

    - label: Task Completion
      color: red
      line-width: 4
      data: SELECT 'Date Task Completed', SUM('Estimated Hours') WHERE 'Date Task Completed' IS NOT NULL
      down-from: SELECT SUM('Estimated Hours')
      trend: false
}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/43.xml">
      <name>Sprint</name>
    </card_type>
    <id type="integer">454</id>
    <number type="integer">2</number>

    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">78</project_card_rank>
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
      <property type_description="Date" hidden="false">
        <name>Start Date</name>
        <value nil="true"></value>
      </property>
      <property type_description="Date" hidden="false">

        <name>End Date</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Velocity</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">

        <name>Total Points in Sprint</name>
        <value>54.00</value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>

        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=454&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
BADCARDS
end