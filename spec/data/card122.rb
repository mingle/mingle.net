def fake_card122
<<-CARD122
<cards type="array"> 
<card>
  <name>Release 2</name>
  <description>{% two-columns %}
{% left-column %}

{% dashboard-half-panel %}
{% panel-heading %} Burn-Up - This Release {% panel-heading %}
{% panel-content %}

{{ 
  data-series-chart 
    conditions: 'Release' = THIS CARD AND 'Type' = 'Story' AND 'Iteration' IS NOT NULL
    cumulative: true
    x-labels-start: 
    x-labels-end: 
    x-labels-step: 
    x-labels-conditions: Type = Iteration
    x-title:  Iteration
    y-title:  Total Scope
    chart-height: 400
    chart-width: 420
    show-start-label: true
    legend-max-width: 200
    series: 
    - label: Scope
      color: black   
      line-width: 1
      data: SELECT 'Added to Scope in Iteration', SUM('Planning Estimate') 
    - label: Analysis complete
      color: green
      line-width: 2
      data: SELECT 'Analysis Completed in Iteration', SUM('Planning Estimate') WHERE 'Analysis Completed in Iteration' IS NOT NULL
      trend: true
      trend-line-width: 1
    - label: Development complete
      color: orange
      line-width: 2
      data: SELECT 'Development Completed in Iteration', SUM('Planning Estimate') WHERE 'Development Completed in Iteration' IS NOT NULL
      trend: true
      trend-line-width: 1
    - label: QA complete
      color: purple
      line-width: 2
      data: SELECT 'QA Completed in Iteration', SUM('Planning Estimate') WHERE 'QA Completed in Iteration' IS NOT NULL
      trend: true
      trend-line-width: 1
    - label: Accepted
      color: blue
      line-width: 2
      data: SELECT 'Accepted in Iteration', SUM('Planning Estimate') WHERE  'Accepted in Iteration' IS NOT NULL 
      trend: true
      trend-line-width: 1
}}


{% panel-content %}
{% dashboard-half-panel %}
{% left-column %}

{% right-column %}

{% dashboard-half-panel %}
{% panel-heading %}Story Scoreboard - This Release{% panel-heading %}
{% panel-content %}

| - |*Current Iteration*|*Release*|*Project*|
|*Scheduled*|{{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Iteration' = (Current Iteration)}}  | {{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Release' = THIS CARD}} | {{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Release' IS NOT NULL}} |
|*Velocity*|{{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Iteration' = (Current Iteration) and 'Accepted in Iteration' IS NOT NULL}}  | {{ average query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Accepted in Iteration' IS NOT NULL and 'Release' = THIS CARD}} | {{ average query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Accepted in Iteration' IS NOT NULL and 'Release' IS NOT NULL}} |
|*QA Completed*|{{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Iteration' = (Current Iteration) and 'QA Completed in Iteration' IS NOT NULL}}  | {{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'QA Completed in Iteration' IS NOT NULL and 'Release' = THIS CARD}} | {{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'QA Completed in Iteration' IS NOT NULL and 'Release' IS NOT NULL}} |
|*Development Completed*|{{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Iteration' = (Current Iteration) and 'Development Completed in Iteration' IS NOT NULL}}  | {{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Development Completed in Iteration' IS NOT NULL and 'Release' = THIS CARD}} | {{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Development Completed in Iteration' IS NOT NULL and 'Release' IS NOT NULL}} |
|*Analysis Completed*|{{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Iteration' = (Current Iteration) and 'Analysis Completed in Iteration' IS NOT NULL}}  | {{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Analysis Completed in Iteration' IS NOT NULL and 'Release' = THIS CARD}} | {{ value query: SELECT SUM('Planning Estimate') WHERE Type = Story and 'Analysis Completed in Iteration' IS NOT NULL and 'Release' IS NOT NULL}} |


h3. Release Breakdown

{{

 table query: SELECT name, 'Start Date', 'End Date', 'Story Count', 'Total Planning Estimate', 'Avg Story TTL'  WHERE Type = 'Release' ORDER BY Name
}}







{% panel-content %}
{% dashboard-half-panel %}
{% right-column %}

{% two-columns %}


{% two-columns %}
{% left-column %}

{% dashboard-half-panel %}
{% panel-heading %}Product Progress - This Release {% panel-heading %}
{% panel-content %}


h3. Completeness By Feature

{{
    ratio-bar-chart
    totals: SELECT 'Feature - Story', COUNT(*) WHERE Type = Story and Release = THIS CARD
    restrict-ratio-with: 'Story Status' = 'Accepted'
    color: purple
    plot-x-offset: 90
    chart-height: 400 
    chart-width: 500
    x-title: Feature
    y-title: Completeness 
}}

h3. Backlog Allocation By Feature - This Release

{{
  pie-chart
    data: SELECT  'Feature - Story', Count(*) WHERE Type = Story and 'Story Status' != New and 'Story Status' != Deleted  AND Release = THIS CARD
}}


{% panel-content %}
{% dashboard-half-panel %}
{% left-column %}

{% right-column %}

{% dashboard-half-panel %}
{% panel-heading %}Defect Metrics - This Release{% panel-heading %}
{% panel-content %}


&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;

h3. Defect Stats - This Release

_Totals articulated in story points_

| *Total Scope* | {{ value query: SELECT SUM('Defect Estimate') WHERE Type = 'Defect' AND Release = THIS CARD }} |
| *Not Yet In Development* | %{color:red}{{ value query: SELECT SUM('Defect Estimate') WHERE Type = 'Defect' AND Release = THIS CARD AND 'Defect Status' &lt; 'in progress' }}% |
| *In Progress* | %{color:red}{{ value query: SELECT SUM('Defect Estimate') WHERE Type = 'Defect' AND Release = THIS CARD AND 'Defect Status' = 'in progress' }}% |
| *Fixed* | %{color:blue}{{ value query: SELECT SUM('Defect Estimate') WHERE Type = 'Defect' AND Release = THIS CARD AND  'Defect Status' = 'Fixed' }}% |

&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;

h3. Defects Reported - This Release

{{ 
  data-series-chart 
    conditions: 'Type' = 'Defect' AND Release = THIS CARD
    x-title: Iteration
    y-title: Number of Defects Found/Fixed
    x-labels-conditions: Type = Iteration
    cumulative: false
    plot-x-offset: 90
    chart-height: 400 
    chart-width: 500
    legend-max-width: 200
    chart-type: bar
    series:  
    - label: Defects Closed
      color: darkgreen
      data: SELECT 'Defect Fix Completed in Iteration', COUNT(*) WHERE 'Defect Fix Completed in Iteration' IS NOT NULL and 'Defect Status' = 'Closed'
    - label: Defects Opened
      color: darkred
      data: SELECT 'Defect Reported in Iteration', COUNT(*) WHERE 'Defect Reported in Iteration' IS NOT NULL and 'Defect Status' IS NOT NULL
  
}}



{% panel-content %}
{% dashboard-half-panel %}
{% right-column %}

{% two-columns %}

{% dashboard-panel %}
{% panel-heading %}Overall Story Allocation - This Release{% panel-heading %}
{% panel-content %}


{{
  pivot-table:
    conditions: Type = 'Story' and Release = THIS CARD
    rows: 'Priority'
    columns: 'Story Status'
    empty-rows: true
    empty-columns: true
    totals: true
}}



{% panel-content %}
{% dashboard-panel %}</description>
  <card_type url="http://localhost:8080/api/v2/projects/test/card_types/84.xml">
    <name>Release</name>
  </card_type>
  <id type="integer">2220</id>
  <number type="integer">32</number>
  <project url="http://localhost:8080/api/v2/projects/test.xml">

    <name>test</name>
    <identifier>test</identifier>
  </project>
  <version type="integer">1</version>
  <project_card_rank type="integer">85</project_card_rank>
  <created_on type="datetime">2011-11-29T22:52:49Z</created_on>

  <modified_on type="datetime">2011-12-12T18:56:42Z</modified_on>
  <modified_by url="http://localhost:8080/api/v2/users/1.xml">
    <name>Mark Richter</name>
    <login>mrichter</login>
  </modified_by>
  <created_by url="http://localhost:8080/api/v2/users/30.xml">
    <name>mingleuser</name>

    <login>mingleuser</login>
  </created_by>
  <properties type="array">
    <property type_description="Aggregate" hidden="false">
      <name>Story Count</name>
      <value>19.00</value>
    </property>

    <property type_description="Date" hidden="false">
      <name>Start Date</name>
      <value type="date">2010-05-01</value>
    </property>
    <property type_description="Date" hidden="false">
      <name>End Date</name>
      <value type="date">2010-07-31</value>

    </property>
    <property type_description="Aggregate" hidden="false">
      <name>Total Planning Estimate</name>
      <value>26.00</value>
    </property>
    <property type_description="Aggregate" hidden="false">
      <name>Avg Defect TTL</name>

      <value nil="true"></value>
    </property>
    <property type_description="Aggregate" hidden="false">
      <name>Avg Story TTL</name>
      <value nil="true"></value>
    </property>
    <property type_description="Aggregate" hidden="false">
      <name>Total Points Accepted</name>

      <value nil="true"></value>
    </property>
    <property type_description="Managed text list" hidden="true">
      <name>Closed</name>
      <value>No</value>
    </property>
    <property type_description="Aggregate" hidden="false">
      <name>Total Iterations</name>

      <value>6.00</value>
    </property>
    <property type_description="Aggregate" hidden="false">
      <name>Total Closed Iterations</name>
      <value>1.00</value>
    </property>
    <property type_description="Aggregate" hidden="false">

      <name>Total Open Iterations</name>
      <value>5.00</value>
    </property>
    <property type_description="Formula" hidden="false">
      <name>Number of Iterations Remaining</name>
      <value nil="true"></value>
    </property>

  </properties>
  <tags>
  </tags>
  <rendered_description url="http://localhost:8080/api/v2/projects/test/render?content_provider%5Bid%5D=2220&amp;content_provider%5Btype%5D=card">
  </rendered_description>
</card>
</cards>
CARD122
end