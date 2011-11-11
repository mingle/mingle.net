def fake_cardtypes
<<-CARDTYPES
<?xml version="1.0" encoding="UTF-8"?> 
<card_types type="array"> 
  <card_type> 
    <id type="integer">40</id> 
    <name>Story</name> 
    <color>#ff3300</color> 
    <position type="integer">1</position> 
    <property_definitions type="array"> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/242.xml"> 
        <name>Status</name> 
        <position nil="true"></position> 
        <data_type>string</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/248.xml"> 
        <name>Owner</name> 
        <position nil="true"></position> 
        <data_type>user</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/252.xml"> 
        <name>Story Points</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/263.xml"> 
        <name>Depend on</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/249.xml"> 
        <name>Date Created</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/268.xml"> 
        <name>Date Analysis Started</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/251.xml"> 
        <name>Date Analysis Ended</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/243.xml"> 
        <name>Date Development Started</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/244.xml"> 
        <name>Date Development Ended</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/258.xml"> 
        <name>Date Testing Started</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/259.xml"> 
        <name>Date Testing Ended</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/250.xml"> 
        <name>Date Accepted</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/274.xml"> 
        <name>Sprint Added to Scope</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/275.xml"> 
        <name>Sprint Completed</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/254.xml"> 
        <name>Epic Story</name> 
        <position type="integer">1</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/255.xml"> 
        <name>Feature</name> 
        <position type="integer">2</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/246.xml"> 
        <name>Release</name> 
        <position type="integer">1</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/247.xml"> 
        <name>Sprint</name> 
        <position type="integer">2</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/269.xml"> 
        <name>Estimated Task Hours</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
    </property_definitions> 
  </card_type> 
  <card_type> 
    <id type="integer">44</id> 
    <name>Release</name> 
    <color>#990024</color> 
    <position type="integer">2</position> 
    <property_definitions type="array"> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/266.xml"> 
        <name>Start Date</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/267.xml"> 
        <name>End Date</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/271.xml"> 
        <name>Points Scheduled</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/272.xml"> 
        <name>Points Completed</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
    </property_definitions> 
  </card_type> 
  <card_type> 
    <id type="integer">43</id> 
    <name>Sprint</name> 
    <color>#ff0db6</color> 
    <position type="integer">3</position> 
    <property_definitions type="array"> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/266.xml"> 
        <name>Start Date</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/267.xml"> 
        <name>End Date</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/246.xml"> 
        <name>Release</name> 
        <position type="integer">1</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/270.xml"> 
        <name>Velocity</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/273.xml"> 
        <name>Total Points in Sprint</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
    </property_definitions> 
  </card_type> 
  <card_type> 
    <id type="integer">42</id> 
    <name>Task</name> 
    <color>#ffe066</color> 
    <position type="integer">4</position> 
    <property_definitions type="array"> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/253.xml"> 
        <name>Task Status</name> 
        <position nil="true"></position> 
        <data_type>string</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/248.xml"> 
        <name>Owner</name> 
        <position nil="true"></position> 
        <data_type>user</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/263.xml"> 
        <name>Depend on</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/264.xml"> 
        <name>Date Task Completed</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/265.xml"> 
        <name>Hours Remaining</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/246.xml"> 
        <name>Release</name> 
        <position type="integer">1</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/247.xml"> 
        <name>Sprint</name> 
        <position type="integer">2</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/245.xml"> 
        <name>Story</name> 
        <position type="integer">3</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
    </property_definitions> 
  </card_type> 
  <card_type> 
    <id type="integer">41</id> 
    <name>Defect</name> 
    <color>#000599</color> 
    <position type="integer">5</position> 
    <property_definitions type="array"> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/256.xml"> 
        <name>Defect Status</name> 
        <position nil="true"></position> 
        <data_type>string</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/248.xml"> 
        <name>Owner</name> 
        <position nil="true"></position> 
        <data_type>user</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/261.xml"> 
        <name>Date Reported</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/260.xml"> 
        <name>Date Fixed</name> 
        <position nil="true"></position> 
        <data_type>date</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/262.xml"> 
        <name>Days Open</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/263.xml"> 
        <name>Depend on</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/246.xml"> 
        <name>Release</name> 
        <position type="integer">1</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/247.xml"> 
        <name>Sprint</name> 
        <position type="integer">2</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/245.xml"> 
        <name>Story</name> 
        <position type="integer">3</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/257.xml"> 
        <name>Task</name> 
        <position type="integer">4</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
    </property_definitions> 
  </card_type> 
  <card_type> 
    <id type="integer">45</id> 
    <name>Feature</name> 
    <color>#296600</color> 
    <position type="integer">6</position> 
    <property_definitions type="array"> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/263.xml"> 
        <name>Depend on</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/280.xml"> 
        <name>Percent Complete - Feature</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/254.xml"> 
        <name>Epic Story</name> 
        <position type="integer">1</position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/276.xml"> 
        <name>Total Points - Feature</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/277.xml"> 
        <name>Completed Points - Feature</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
    </property_definitions> 
  </card_type> 
  <card_type> 
    <id type="integer">46</id> 
    <name>Epic Story</name> 
    <color>#00d91d</color> 
    <position type="integer">7</position> 
    <property_definitions type="array"> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/263.xml"> 
        <name>Depend on</name> 
        <position nil="true"></position> 
        <data_type>card</data_type> 
        <is_numeric type="boolean">false</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/281.xml"> 
        <name>Percent Complete</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/278.xml"> 
        <name>Total Points</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
      <property_definition url="http://localhost:8080/api/v2/projects/test/property_definitions/279.xml"> 
        <name>Completed Points</name> 
        <position nil="true"></position> 
        <data_type>numeric</data_type> 
        <is_numeric type="boolean">true</is_numeric> 
      </property_definition> 
    </property_definitions> 
  </card_type> 
</card_types> 
CARDTYPES
end
