def fake_propertydefinitions
<<-PROPERTIES
<?xml version="1.0" encoding="UTF-8"?>
<property_definitions type="array">
  <property_definition>
    <id type="integer">279</id>
    <name>Completed Points</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>

    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>

    </project>
    <column_name>cp_completed_points</column_name>
    <position nil="true"></position>
    <property_values_description>Aggregate</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/46.xml">
        <name>Epic Story</name>

      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">277</id>
    <name>Completed Points - Feature</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>

    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>

      <identifier>test</identifier>
    </project>
    <column_name>cp_completed_points___feature</column_name>
    <position nil="true"></position>
    <property_values_description>Aggregate</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/45.xml">

        <name>Feature</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">250</id>
    <name>Date Accepted</name>

    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>

    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_accepted_on</column_name>
    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>

    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">251</id>

    <name>Date Analysis Ended</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>
    <restricted type="boolean">false</restricted>

    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_analysis_completed_on</column_name>
    <position nil="true"></position>

    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>

    <id type="integer">268</id>
    <name>Date Analysis Started</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_date_analysis_started</column_name>

    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">249</id>
    <name>Date Created</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_added_on</column_name>

    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">244</id>
    <name>Date Development Ended</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_enddate</column_name>

    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">243</id>
    <name>Date Development Started</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_startdate</column_name>

    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">260</id>
    <name>Date Fixed</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_fixed_on</column_name>

    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">
        <name>Defect</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">261</id>
    <name>Date Reported</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_reported_on</column_name>

    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">
        <name>Defect</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">264</id>
    <name>Date Task Completed</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_task_completed_on</column_name>

    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml">
        <name>Task</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">259</id>
    <name>Date Testing Ended</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_testing_completed_on</column_name>

    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">258</id>
    <name>Date Testing Started</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_testing_started_on</column_name>

    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">262</id>
    <name>Days Open</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_days_open</column_name>

    <position nil="true"></position>
    <property_values_description>Formula</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">
        <name>Defect</name>
      </card_type>
    </card_types>
    <formula>('Date Fixed' - 'Date Reported')</formula>

    <null_is_zero nil="true"></null_is_zero>
  </property_definition>
  <property_definition>
    <id type="integer">256</id>
    <name>Defect Status</name>
    <description nil="true"></description>
    <data_type>string</data_type>

    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">true</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>

      <identifier>test</identifier>
    </project>
    <column_name>cp_defect_status</column_name>
    <position nil="true"></position>
    <property_values_description>Managed text list</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">

        <name>Defect</name>
      </card_type>
    </card_types>
    <property_value_details type="array">
      <property_value>
        <id type="integer">257</id>
        <value>New</value>

        <color nil="true"></color>
        <position type="integer">1</position>
      </property_value>
      <property_value>
        <id type="integer">258</id>
        <value>Fix in progress</value>
        <color nil="true"></color>

        <position type="integer">2</position>
      </property_value>
      <property_value>
        <id type="integer">259</id>
        <value>Fixed</value>
        <color nil="true"></color>
        <position type="integer">3</position>

      </property_value>
    </property_value_details>
    <is_managed type="boolean">true</is_managed>
  </property_definition>
  <property_definition>
    <id type="integer">263</id>
    <name>Depend on</name>

    <description nil="true"></description>
    <data_type>card</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>

    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_depend_on_card_id</column_name>
    <position nil="true"></position>
    <property_values_description>Any card</property_values_description>

    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/46.xml">
        <name>Epic Story</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/45.xml">
        <name>Feature</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">

        <name>Story</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml">
        <name>Task</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">
        <name>Defect</name>

      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">267</id>
    <name>End Date</name>
    <description nil="true"></description>
    <data_type>date</data_type>

    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>

      <identifier>test</identifier>
    </project>
    <column_name>cp_end_date</column_name>
    <position nil="true"></position>
    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/44.xml">

        <name>Release</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/43.xml">
        <name>Sprint</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>

    <id type="integer">254</id>
    <name>Epic Story</name>
    <description nil="true"></description>
    <data_type>card</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_feature___feature_card_id</column_name>

    <position type="integer">1</position>
    <property_values_description>Any card used in tree</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/45.xml">
        <name>Feature</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">

        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">269</id>
    <name>Estimated Task Hours</name>

    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>

    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_estimated_hours_from_tasks</column_name>
    <position nil="true"></position>
    <property_values_description>Aggregate</property_values_description>

    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">255</id>

    <name>Feature</name>
    <description nil="true"></description>
    <data_type>card</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>

    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_feature___feature_1_card_id</column_name>
    <position type="integer">2</position>

    <property_values_description>Any card used in tree</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>

    <id type="integer">265</id>
    <name>Hours Remaining</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">true</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_estimated_hours</column_name>

    <position nil="true"></position>
    <property_values_description>Managed number list</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml">
        <name>Task</name>
      </card_type>
    </card_types>
    <property_value_details type="array">

      <property_value>
        <id type="integer">263</id>
        <value>0</value>
        <color nil="true"></color>
        <position type="integer">1</position>
      </property_value>
      <property_value>

        <id type="integer">264</id>
        <value>0.5</value>
        <color nil="true"></color>
        <position type="integer">2</position>
      </property_value>
      <property_value>
        <id type="integer">269</id>

        <value>1</value>
        <color nil="true"></color>
        <position type="integer">3</position>
      </property_value>
      <property_value>
        <id type="integer">265</id>
        <value>2</value>

        <color nil="true"></color>
        <position type="integer">4</position>
      </property_value>
      <property_value>
        <id type="integer">270</id>
        <value>3</value>
        <color nil="true"></color>

        <position type="integer">5</position>
      </property_value>
      <property_value>
        <id type="integer">266</id>
        <value>4</value>
        <color nil="true"></color>
        <position type="integer">6</position>

      </property_value>
      <property_value>
        <id type="integer">271</id>
        <value>5</value>
        <color nil="true"></color>
        <position type="integer">7</position>
      </property_value>

      <property_value>
        <id type="integer">267</id>
        <value>6</value>
        <color nil="true"></color>
        <position type="integer">8</position>
      </property_value>
      <property_value>

        <id type="integer">268</id>
        <value>7</value>
        <color nil="true"></color>
        <position type="integer">9</position>
      </property_value>
      <property_value>
        <id type="integer">273</id>

        <value>8</value>
        <color nil="true"></color>
        <position type="integer">10</position>
      </property_value>
    </property_value_details>
    <is_managed type="boolean">true</is_managed>
  </property_definition>

  <property_definition>
    <id type="integer">248</id>
    <name>Owner</name>
    <description>Individual assigned to a work item</description>
    <data_type>user</data_type>
    <is_numeric type="boolean">false</is_numeric>

    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>

    </project>
    <column_name>cp_owner_user_id</column_name>
    <position nil="true"></position>
    <property_values_description>Automatically generated from the team list</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>

      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml">
        <name>Task</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">
        <name>Defect</name>
      </card_type>
    </card_types>

  </property_definition>
  <property_definition>
    <id type="integer">281</id>
    <name>Percent Complete</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>

    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>

    </project>
    <column_name>cp_percent_complete</column_name>
    <position nil="true"></position>
    <property_values_description>Formula</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/46.xml">
        <name>Epic Story</name>

      </card_type>
    </card_types>
    <formula>('Completed Points' / 'Total Points')</formula>
    <null_is_zero nil="true"></null_is_zero>
  </property_definition>
  <property_definition>
    <id type="integer">280</id>
    <name>Percent Complete - Feature</name>

    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>

    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_percent_complete___feature</column_name>
    <position nil="true"></position>
    <property_values_description>Formula</property_values_description>

    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/45.xml">
        <name>Feature</name>
      </card_type>
    </card_types>
    <formula>('Completed Points - Feature' / 'Total Points - Feature')</formula>
    <null_is_zero nil="true"></null_is_zero>
  </property_definition>

  <property_definition>
    <id type="integer">272</id>
    <name>Points Completed</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_completed_points_in_release</column_name>

    <position nil="true"></position>
    <property_values_description>Aggregate</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/44.xml">
        <name>Release</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">271</id>
    <name>Points Scheduled</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_total_points_in_release</column_name>

    <position nil="true"></position>
    <property_values_description>Aggregate</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/44.xml">
        <name>Release</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">246</id>
    <name>Release</name>
    <description nil="true"></description>
    <data_type>card</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_planning___release_card_id</column_name>

    <position type="integer">1</position>
    <property_values_description>Any card used in tree</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/43.xml">
        <name>Sprint</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml">

        <name>Task</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">
        <name>Defect</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>

      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">247</id>
    <name>Sprint</name>
    <description nil="true"></description>
    <data_type>card</data_type>

    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>

      <identifier>test</identifier>
    </project>
    <column_name>cp_planning___sprint_card_id</column_name>
    <position type="integer">2</position>
    <property_values_description>Any card used in tree</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml">

        <name>Task</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">
        <name>Defect</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>

      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">274</id>
    <name>Sprint Added to Scope</name>
    <description nil="true"></description>
    <data_type>card</data_type>

    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>

      <identifier>test</identifier>
    </project>
    <column_name>cp_added_to_scf703c40910ba5591</column_name>
    <position nil="true"></position>
    <property_values_description>Any card</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">

        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">275</id>
    <name>Sprint Completed</name>

    <description nil="true"></description>
    <data_type>card</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">true</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">true</transition_only>

    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_sprint_completed_card_id</column_name>
    <position nil="true"></position>
    <property_values_description>Any card</property_values_description>

    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">266</id>

    <name>Start Date</name>
    <description nil="true"></description>
    <data_type>date</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>

    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_start_date</column_name>
    <position nil="true"></position>

    <property_values_description>Any date</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/44.xml">
        <name>Release</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/43.xml">
        <name>Sprint</name>

      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">242</id>
    <name>Status</name>
    <description nil="true"></description>
    <data_type>string</data_type>

    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">true</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>

      <identifier>test</identifier>
    </project>
    <column_name>cp_status</column_name>
    <position nil="true"></position>
    <property_values_description>Managed text list</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">

        <name>Story</name>
      </card_type>
    </card_types>
    <property_value_details type="array">
      <property_value>
        <id type="integer">247</id>
        <value>Ready for Analysis</value>

        <color>#ff8cec</color>
        <position type="integer">1</position>
      </property_value>
      <property_value>
        <id type="integer">248</id>
        <value>In Analysis</value>
        <color>#f200ea</color>

        <position type="integer">2</position>
      </property_value>
      <property_value>
        <id type="integer">243</id>
        <value>Ready for Development</value>
        <color>#f23000</color>
        <position type="integer">3</position>

      </property_value>
      <property_value>
        <id type="integer">244</id>
        <value>In Development</value>
        <color>#f29900</color>
        <position type="integer">4</position>
      </property_value>

      <property_value>
        <id type="integer">245</id>
        <value>Ready for Testing</value>
        <color>#f2d200</color>
        <position type="integer">5</position>
      </property_value>
      <property_value>

        <id type="integer">246</id>
        <value>In Testing</value>
        <color>#81f200</color>
        <position type="integer">6</position>
      </property_value>
      <property_value>
        <id type="integer">249</id>

        <value>Ready for Signoff</value>
        <color>#059900</color>
        <position type="integer">7</position>
      </property_value>
      <property_value>
        <id type="integer">250</id>
        <value>Accepted</value>

        <color>#002680</color>
        <position type="integer">8</position>
      </property_value>
    </property_value_details>
    <is_managed type="boolean">true</is_managed>
  </property_definition>
  <property_definition>

    <id type="integer">245</id>
    <name>Story</name>
    <description nil="true"></description>
    <data_type>card</data_type>
    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_planning___story_card_id</column_name>

    <position type="integer">3</position>
    <property_values_description>Any card used in tree</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml">
        <name>Task</name>
      </card_type>
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">

        <name>Defect</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">252</id>
    <name>Story Points</name>

    <description>Fibonacci series from 1 to 13</description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">true</restricted>
    <transition_only type="boolean">false</transition_only>

    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_estimate___planning</column_name>
    <position nil="true"></position>
    <property_values_description>Managed number list</property_values_description>

    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml">
        <name>Story</name>
      </card_type>
    </card_types>
    <property_value_details type="array">
      <property_value>
        <id type="integer">260</id>

        <value>1</value>
        <color>#ffd1cc</color>
        <position type="integer">1</position>
      </property_value>
      <property_value>
        <id type="integer">256</id>
        <value>2</value>

        <color>#ffa6a6</color>
        <position type="integer">2</position>
      </property_value>
      <property_value>
        <id type="integer">261</id>
        <value>3</value>
        <color>#ff5959</color>

        <position type="integer">3</position>
      </property_value>
      <property_value>
        <id type="integer">272</id>
        <value>5</value>
        <color>#ff4040</color>
        <position type="integer">4</position>

      </property_value>
      <property_value>
        <id type="integer">255</id>
        <value>8</value>
        <color>#bf0000</color>
        <position type="integer">5</position>
      </property_value>

      <property_value>
        <id type="integer">251</id>
        <value>13</value>
        <color>#590300</color>
        <position type="integer">6</position>
      </property_value>
      <property_value>

        <id type="integer">262</id>
        <value>21</value>
        <color>#0d0000</color>
        <position type="integer">7</position>
      </property_value>
    </property_value_details>
    <is_managed type="boolean">true</is_managed>

  </property_definition>
  <property_definition>
    <id type="integer">257</id>
    <name>Task</name>
    <description nil="true"></description>
    <data_type>card</data_type>
    <is_numeric type="boolean">false</is_numeric>

    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>

    </project>
    <column_name>cp_planning___task_card_id</column_name>
    <position type="integer">4</position>
    <property_values_description>Any card used in tree</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml">
        <name>Defect</name>

      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">253</id>
    <name>Task Status</name>
    <description nil="true"></description>
    <data_type>string</data_type>

    <is_numeric type="boolean">false</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">true</restricted>
    <transition_only type="boolean">true</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>

      <identifier>test</identifier>
    </project>
    <column_name>cp_task_status</column_name>
    <position nil="true"></position>
    <property_values_description>Managed text list</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml">

        <name>Task</name>
      </card_type>
    </card_types>
    <property_value_details type="array">
      <property_value>
        <id type="integer">253</id>
        <value>New</value>

        <color>#ffdb26</color>
        <position type="integer">1</position>
      </property_value>
      <property_value>
        <id type="integer">254</id>
        <value>In progress</value>
        <color>#3aff33</color>

        <position type="integer">2</position>
      </property_value>
      <property_value>
        <id type="integer">252</id>
        <value>Done</value>
        <color>#003300</color>
        <position type="integer">3</position>

      </property_value>
    </property_value_details>
    <is_managed type="boolean">true</is_managed>
  </property_definition>
  <property_definition>
    <id type="integer">278</id>
    <name>Total Points</name>

    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>

    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_total_points</column_name>
    <position nil="true"></position>
    <property_values_description>Aggregate</property_values_description>

    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/46.xml">
        <name>Epic Story</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>
    <id type="integer">276</id>

    <name>Total Points - Feature</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>
    <restricted type="boolean">false</restricted>

    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_total_points___feature</column_name>
    <position nil="true"></position>

    <property_values_description>Aggregate</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/45.xml">
        <name>Feature</name>
      </card_type>
    </card_types>
  </property_definition>
  <property_definition>

    <id type="integer">273</id>
    <name>Total Points in Sprint</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_total_points_in_sprint</column_name>

    <position nil="true"></position>
    <property_values_description>Aggregate</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/43.xml">
        <name>Sprint</name>
      </card_type>
    </card_types>
  </property_definition>

  <property_definition>
    <id type="integer">270</id>
    <name>Velocity</name>
    <description nil="true"></description>
    <data_type>numeric</data_type>
    <is_numeric type="boolean">true</is_numeric>
    <hidden type="boolean">false</hidden>

    <restricted type="boolean">false</restricted>
    <transition_only type="boolean">false</transition_only>
    <project url="http://localhost:8080/api/v2/projects/test.xml">
      <name>test</name>
      <identifier>test</identifier>
    </project>
    <column_name>cp_velocity</column_name>

    <position nil="true"></position>
    <property_values_description>Aggregate</property_values_description>
    <card_types type="array">
      <card_type url="http://localhost:8080/api/v2/projects/test/card_types/43.xml">
        <name>Sprint</name>
      </card_type>
    </card_types>
  </property_definition>
</property_definitions>
PROPERTIES
end
