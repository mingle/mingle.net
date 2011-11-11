def fake_stories
<<-STORIES
<?xml version="1.0" encoding="UTF-8"?>
<cards type="array">
  <card>
    <name>Rendering Test</name>
    <description>{% dashboard-panel %}
 {% panel-heading %}Reports{% panel-heading %}
 {% panel-content %}

* Current Release: {{project-variable name: Current Release}} &lt;br&gt;
* Current Sprint: {{project-variable name: Current Sprint}} 
 {% panel-content %}
{% dashboard-panel %}


{% dashboard-panel %}
 {% panel-heading %}Burnup - Current Release{% panel-heading %}
 {% panel-content %}

{{
  daily-history-chart
    chart-width: 800
    plot-width: 750

    chart-height: 500
    plot-height: 431

    y-title: Story Points
    x-labels-step: 7

    aggregate: SUM ('Story Points')
    start-date: (Release Start Date)
    end-date:  (Release End Date)
    chart-conditions: type = Story AND Release = (Current Release)

    series:
      - label: Total Scope
        color: green
        line-width: 4
 
      - label: Completed Stories
        color: red
        line-width: 4
        conditions: 'Status' = Accepted
}}

 {% panel-content %}
{% dashboard-panel %}



{% dashboard-panel %}
 {% panel-heading %}Story Completion - By Task{% panel-heading %}
 {% panel-content %}

p=. _As tasks are completed these bars grow taller._

{{
  ratio-bar-chart
    totals: SELECT Story, COUNT(*) WHERE type = Task and Sprint = (Current Sprint)
    restrict-ratio-with: 'Task Status' = Done 
    color: purple
    chart-height: 500
    chart-width: 800
    plot-width: 600
    plot-x-offset: 200 
    label-font-angle: 30
}}

 {% panel-content %}
{% dashboard-panel %}


{% dashboard-panel %}
 {% panel-heading %}Story Status{% panel-heading %}
 {% panel-content %}

{{
  stack-bar-chart

    conditions: Type = Story AND Sprint = (Current Sprint)
    cumulative: false

    chart-width: 800
    plot-width: 700
    chart-height: 350
    plot-x-offset: 80
    x-title: Story Status
    y-title: Story Points

    series:
    - data: SELECT Status, SUM('Story Points')
      label: Series
      color: #2d00bf
      combine: overlay-bottom
}}

&lt;br/&gt;

{{
  pivot-table
    columns: Status
    rows: Feature
    conditions: Type = Story AND Sprint = (Current Sprint)
    aggregation: SUM('Story Points')
    totals: true
    empty-columns: true
    empty-rows: false
}}

 
 {% panel-content %}
{% dashboard-panel %}


{% dashboard-panel %}
 {% panel-heading %}Which stories are the largest potential bottlenecks?{% panel-heading %}
 {% panel-content %}

p((((. _Taller bars indicate larger risk_

{{
  stack-bar-chart
    chart-width: 800
    plot-width: 700
    chart-height: 490
    plot-x-offset: 80
    legend-max-width: 300
    x-title: Card
    y-title: Dependents

    conditions: 
    labels: SELECT DISTINCT 'Depend On' WHERE 'Depend On' IS NOT NULL
    cumulative: false
    series:
    - label:
      color: red
      data: SELECT 'depend on', COUNT(*) WHERE type = story
      combine: overlay-bottom
}}

 {% panel-content %}
{% dashboard-panel %}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">698</id>
    <number type="integer">80</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">80</project_card_rank>
    <created_on type="datetime">2011-09-26T20:58:24Z</created_on>
    <modified_on type="datetime">2011-09-26T20:58:24Z</modified_on>
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
        <name>Status</name>
        <value>Ready for Analysis</value>
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
        <value type="date">2011-09-26</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/2.xml">
          <number type="integer">2</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=698&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Create Website Profile</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">510</id>
    <number type="integer">58</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">22</project_card_rank>
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
        <name>Status</name>
        <value>Accepted</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>2</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value nil="true"></value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Analysis Started</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Analysis Ended</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Development Started</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Development Ended</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Testing Started</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Testing Ended</name>
        <value type="date">2011-01-21</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Accepted</name>
        <value type="date">2011-01-21</value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/3.xml">
          <number type="integer">3</number>
        </value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value>0.00</value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/15.xml">
          <number type="integer">15</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/12.xml">
          <number type="integer">12</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/3.xml">
          <number type="integer">3</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=510&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Edit/Modify Project</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">509</id>
    <number type="integer">57</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">23</project_card_rank>
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
        <name>Status</name>
        <value>Ready for Development</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>8</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value nil="true"></value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Analysis Started</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Analysis Ended</name>
        <value type="date">2011-01-13</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value>13.00</value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/14.xml">
          <number type="integer">14</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/11.xml">
          <number type="integer">11</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/3.xml">
          <number type="integer">3</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=509&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>User Session Timeout</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">508</id>
    <number type="integer">56</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">24</project_card_rank>
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
        <name>Status</name>
        <value>Ready for Analysis</value>
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
        <value type="date">2011-01-12</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value nil="true"></value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=508&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Create Simple Grid Request</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">507</id>
    <number type="integer">55</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">25</project_card_rank>
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
        <name>Status</name>
        <value>Ready for Testing</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>1</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value nil="true"></value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Analysis Started</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Analysis Ended</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Development Started</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Development Ended</name>
        <value type="date">2011-01-13</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value>5.00</value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/14.xml">
          <number type="integer">14</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/10.xml">
          <number type="integer">10</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/3.xml">
          <number type="integer">3</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=507&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Subscribe to a Preview Subscription Services</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">506</id>
    <number type="integer">54</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">26</project_card_rank>
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
        <name>Status</name>
        <value>In Analysis</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>13</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/58.xml">
          <number type="integer">58</number>
        </value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Analysis Started</name>
        <value type="date">2011-01-13</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value>5.00</value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/14.xml">
          <number type="integer">14</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/9.xml">
          <number type="integer">9</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/3.xml">
          <number type="integer">3</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=506&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Subscribe to a Preview Review Subscription Services</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">505</id>
    <number type="integer">53</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">27</project_card_rank>
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
        <name>Status</name>
        <value>Ready for Analysis</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>3</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value nil="true"></value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/14.xml">
          <number type="integer">14</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/9.xml">
          <number type="integer">9</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/2.xml">
          <number type="integer">2</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=505&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Delete Selection for a Segment</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">504</id>
    <number type="integer">52</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">28</project_card_rank>
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
        <name>Status</name>
        <value>In Development</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>1</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value nil="true"></value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Analysis Started</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Analysis Ended</name>
        <value type="date">2011-01-13</value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Development Started</name>
        <value type="date">2011-01-13</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value>8.00</value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/15.xml">
          <number type="integer">15</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/12.xml">
          <number type="integer">12</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/3.xml">
          <number type="integer">3</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=504&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Run a Project and Aggregate the Grid</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">503</id>
    <number type="integer">51</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">29</project_card_rank>
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
        <name>Status</name>
        <value>Ready for Analysis</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>3</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/38.xml">
          <number type="integer">38</number>
        </value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/14.xml">
          <number type="integer">14</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/10.xml">
          <number type="integer">10</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/2.xml">
          <number type="integer">2</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=503&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Compare Grids</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">502</id>
    <number type="integer">50</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">30</project_card_rank>
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
        <name>Status</name>
        <value>Ready for Analysis</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>21</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value nil="true"></value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/14.xml">
          <number type="integer">14</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/10.xml">
          <number type="integer">10</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/2.xml">
          <number type="integer">2</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=502&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Create a Help Framework</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">501</id>
    <number type="integer">49</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">31</project_card_rank>
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
        <name>Status</name>
        <value>Ready for Analysis</value>
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
        <value url="http://localhost:8080/api/v2/projects/test/cards/50.xml">
          <number type="integer">50</number>
        </value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value nil="true"></value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=501&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Display Detailed Product Information</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">500</id>
    <number type="integer">48</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">32</project_card_rank>
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
        <name>Status</name>
        <value>Ready for Analysis</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>3</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/38.xml">
          <number type="integer">38</number>
        </value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/15.xml">
          <number type="integer">15</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/13.xml">
          <number type="integer">13</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/2.xml">
          <number type="integer">2</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=500&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
  <card>
    <name>Sort Output During Review</name>
    <description>h2. Narrative

As a ______________, I can ______________, so that ______________.


h2. Acceptance Criteria

_Enter the Acceptance Criteria here._


h2. Related Stories

* #0
* #0










h2. Tasks

{{table query: SELECT Number, Name, Owner, 'Hours Remaining', 'Task Status' WHERE Type = Task and Story = THIS CARD}}


h2. Defects

{{table query: SELECT Number, Name, Owner, 'Defect Status' WHERE Type = Defect and Story = THIS CARD}}</description>
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
      <name>Story</name>
    </card_type>
    <id type="integer">499</id>
    <number type="integer">47</number>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <version type="integer">1</version>
    <project_card_rank type="integer">33</project_card_rank>
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
        <name>Status</name>
        <value>Ready for Analysis</value>
      </property>
      <property type_description="Automatically generated from the team list" hidden="false">
        <name>Owner</name>
        <value nil="true"></value>
      </property>
      <property type_description="Managed number list" hidden="false">
        <name>Story Points</name>
        <value>8</value>
      </property>
      <property type_description="Card" hidden="false">
        <name>Depend on</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/58.xml">
          <number type="integer">58</number>
        </value>
      </property>
      <property type_description="Date" hidden="true">
        <name>Date Created</name>
        <value type="date">2011-01-12</value>
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
      <property type_description="Card" hidden="true">
        <name>Sprint Added to Scope</name>
        <value nil="true"></value>
      </property>
      <property type_description="Card" hidden="true">
        <name>Sprint Completed</name>
        <value nil="true"></value>
      </property>
      <property type_description="Aggregate" hidden="false">
        <name>Estimated Task Hours</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any number" hidden="false">
        <name>Tfs Work Item</name>
        <value nil="true"></value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Epic Story</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/14.xml">
          <number type="integer">14</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Release</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/1.xml">
          <number type="integer">1</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Feature</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/10.xml">
          <number type="integer">10</number>
        </value>
      </property>
      <property type_description="Any card used in tree" hidden="false">
        <name>Sprint</name>
        <value url="http://localhost:8080/api/v2/projects/test/cards/2.xml">
          <number type="integer">2</number>
        </value>
      </property>
    </properties>
    <tags>
    </tags>
    <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=499&amp;content_provider%5Btype%5D=card">
    </rendered_description>
  </card>
</cards>

STORIES
end
