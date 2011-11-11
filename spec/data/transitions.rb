def fake_transitions
<<-TRANSITIONS
<?xml version="1.0" encoding="UTF-8"?> 
<transitions type="array"> 
  <transition> 
    <id type="integer">80</id> 
    <name>Accepted</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/80.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>Ready for Signoff</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Card" hidden="true"> 
        <name>Sprint Completed</name> 
        <value url="http://localhost:8080/api/v2/projects/test/cards/3.xml"> 
          <number type="integer">3</number> 
        </value> 
      </property> 
      <property type_description="Date" hidden="true"> 
        <name>Date Accepted</name> 
        <value type="date">2011-08-12</value> 
      </property> 
      <property type_description="Automatically generated from the team list" hidden="false"> 
        <name>Owner</name> 
        <value nil="true"></value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>Accepted</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml"> 
      <name>Story</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">78</id> 
    <name>Complete Analysis</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/78.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>In Analysis</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Date" hidden="true"> 
        <name>Date Analysis Ended</name> 
        <value type="date">2011-08-12</value> 
      </property> 
      <property type_description="Automatically generated from the team list" hidden="false"> 
        <name>Owner</name> 
        <value nil="true"></value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>Ready for Development</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml"> 
      <name>Story</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">79</id> 
    <name>Complete Development</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/79.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>In Development</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Date" hidden="true"> 
        <name>Date Development Ended</name> 
        <value type="date">2011-08-12</value> 
      </property> 
      <property type_description="Automatically generated from the team list" hidden="false"> 
        <name>Owner</name> 
        <value nil="true"></value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>Ready for Testing</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml"> 
      <name>Story</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">85</id> 
    <name>Complete Fix</name> 
    <require_comment type="boolean">true</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/85.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Defect Status</name> 
        <value>Fix in progress</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Date" hidden="false"> 
        <name>Date Fixed</name> 
        <value type="date">2011-08-12</value> 
      </property> 
      <property type_description="Automatically generated from the team list" hidden="false"> 
        <name>Owner</name> 
        <value nil="true"></value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Defect Status</name> 
        <value>Fixed</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml"> 
      <name>Defect</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">82</id> 
    <name>Complete Testing</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/82.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>In Testing</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Date" hidden="true"> 
        <name>Date Testing Ended</name> 
        <value type="date">2011-08-12</value> 
      </property> 
      <property type_description="Automatically generated from the team list" hidden="false"> 
        <name>Owner</name> 
        <value nil="true"></value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>Ready for Signoff</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml"> 
      <name>Story</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">87</id> 
    <name>Finish Task</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/87.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Task Status</name> 
        <value>In progress</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Managed number list" hidden="false"> 
        <name>Hours Remaining</name> 
        <value>0</value> 
      </property> 
      <property type_description="Date" hidden="true"> 
        <name>Date Task Completed</name> 
        <value type="date">2011-08-12</value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Task Status</name> 
        <value>Done</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml"> 
      <name>Task</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">77</id> 
    <name>Start Analysis</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/77.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>Ready for Analysis</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Date" hidden="true"> 
        <name>Date Analysis Started</name> 
        <value type="date">2011-08-12</value> 
      </property> 
      <property type_description="Automatically generated from the team list" hidden="false"> 
        <name>Owner</name> 
        <value url="http://localhost:8080/api/v2/users/1.xml"> 
          <name>Mark Richter</name> 
          <login>mrichter</login> 
        </value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>In Analysis</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml"> 
      <name>Story</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">83</id> 
    <name>Start Development</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/83.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>Ready for Development</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Date" hidden="true"> 
        <name>Date Development Started</name> 
        <value type="date">2011-08-12</value> 
      </property> 
      <property type_description="Automatically generated from the team list" hidden="false"> 
        <name>Owner</name> 
        <value url="http://localhost:8080/api/v2/users/1.xml"> 
          <name>Mark Richter</name> 
          <login>mrichter</login> 
        </value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>In Development</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml"> 
      <name>Story</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">84</id> 
    <name>Start Fix</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/84.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Defect Status</name> 
        <value>New</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Automatically generated from the team list" hidden="false"> 
        <name>Owner</name> 
        <value url="http://localhost:8080/api/v2/users/1.xml"> 
          <name>Mark Richter</name> 
          <login>mrichter</login> 
        </value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Defect Status</name> 
        <value>Fix in progress</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/41.xml"> 
      <name>Defect</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">86</id> 
    <name>Start Task</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/86.xml</transition_execution_url> 
    <user_input_required type="array"> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/265.xml"> 
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
            <value>0</value> 
          </property_value> 
          <property_value> 
            <value>0.5</value> 
          </property_value> 
          <property_value> 
            <value>1</value> 
          </property_value> 
          <property_value> 
            <value>2</value> 
          </property_value> 
          <property_value> 
            <value>3</value> 
          </property_value> 
          <property_value> 
            <value>4</value> 
          </property_value> 
          <property_value> 
            <value>5</value> 
          </property_value> 
          <property_value> 
            <value>6</value> 
          </property_value> 
          <property_value> 
            <value>7</value> 
          </property_value> 
          <property_value> 
            <value>8</value> 
          </property_value> 
        </property_value_details> 
        <is_managed type="boolean">true</is_managed> 
      </property_definition> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Task Status</name> 
        <value>New</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Task Status</name> 
        <value>In progress</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/42.xml"> 
      <name>Task</name> 
    </card_type> 
  </transition> 
  <transition> 
    <id type="integer">81</id> 
    <name>Start Testing</name> 
    <require_comment type="boolean">false</require_comment> 
    <transition_execution_url>http://localhost:8080/api/v2/projects/test/transition_executions/81.xml</transition_execution_url> 
    <user_input_required type="array"> 
    </user_input_required> 
    <user_input_optional type="array"> 
    </user_input_optional> 
    <if_card_has_properties type="array"> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>Ready for Testing</value> 
      </property> 
    </if_card_has_properties> 
    <if_card_has_properties_set type="array"> 
    </if_card_has_properties_set> 
    <will_set_card_properties type="array"> 
      <property type_description="Date" hidden="true"> 
        <name>Date Testing Started</name> 
        <value type="date">2011-08-12</value> 
      </property> 
      <property type_description="Automatically generated from the team list" hidden="false"> 
        <name>Owner</name> 
        <value url="http://localhost:8080/api/v2/users/1.xml"> 
          <name>Mark Richter</name> 
          <login>mrichter</login> 
        </value> 
      </property> 
      <property type_description="Managed text list" hidden="false"> 
        <name>Status</name> 
        <value>In Testing</value> 
      </property> 
    </will_set_card_properties> 
    <card_type url="http://localhost:8080/api/v2/projects/test/card_types/40.xml"> 
      <name>Story</name> 
    </card_type> 
  </transition> 
</transitions> 
TRANSITIONS
end
