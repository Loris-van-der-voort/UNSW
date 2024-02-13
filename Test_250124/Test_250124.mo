within Test_250124;
model Test_250124
      package Medium=Buildings.Media.Air;
     parameter Modelica.Units.SI.Volume VRoo1=125.5472
    "Room 1 volume";
      parameter Modelica.Units.SI.MassFlowRate m_flow_nominal1=VRoo1 * 1.2 * 0.3 / (3600)
    "Nominal mass flow rate 1";
      parameter Modelica.Units.SI.MassFlowRate mRec_flow_nominal=8*VRoo1*1.2/3600
    "Nominal mass flow rate for recirculated air";
    .Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(extent = {{-77.28240972186764,61.56396361591834},{-57.28240972186764,81.56396361591834}},origin = {0.0,0.0},rotation = 0.0)));
    inner .Buildings.ThermalZones.EnergyPlus_9_6_0.Building building(idfName = Modelica.Utilities.Files.loadResource("modelica://Test_250124/Resources/CSIRO_B7_V6.idf"),epwName = Modelica.Utilities.Files.loadResource("modelica://Test_250124/Resources/AUS_ACT_Canberra.Intl.AP.949260_TMYx.2007-2021.epw"),weaName = Modelica.Utilities.Files.loadResource("modelica://Test_250124/Resources/AUS_ACT_Canberra.Intl.AP.949260_TMYx.2007-2021.mos")) annotation(Placement(transformation(extent = {{-84.0,-6.0},{-64.0,14.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.ThermalZones.EnergyPlus_9_6_0.ThermalZone zon(zoneName = "Basement:StairXLobbyXLift",redeclare replaceable package Medium = Medium,nPorts = 4) annotation(Placement(transformation(extent = {{8.0,42.0},{48.0,82.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sources.MassFlowSource_WeatherData bou(redeclare replaceable package Medium = Medium,nPorts = 1) annotation(Placement(transformation(extent = {{-46.71603038574567,-5.16837581078596},{-26.71603038574567,14.83162418921404}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.FixedResistances.PressureDrop res(redeclare replaceable package Medium = Medium,m_flow_nominal = m_flow_nominal1,dp_nominal = 100) annotation(Placement(transformation(extent = {{-26.711355129164282,23.253270411627184},{-6.711355129164282,43.253270411627184}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Movers.FlowControlled_m_flow fan(redeclare replaceable package Medium = Medium,m_flow_nominal = mRec_flow_nominal) annotation(Placement(transformation(extent = {{40.68755483791662,-54.42412350932326},{60.68755483791662,-34.42412350932326}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.HeatExchangers.HeaterCooler_u hea(redeclare replaceable package Medium = Medium,Q_flow_nominal = 1000,m_flow_nominal = mRec_flow_nominal,dp_nominal = 100) annotation(Placement(transformation(extent = {{78.77909370764651,-54.474559312369664},{98.77909370764651,-34.474559312369664}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.AddParameter addPar(p = 2) annotation(Placement(transformation(extent = {{-3.560457772358129,-91.5337058509727},{4.298246623619095,-83.67500145499548}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.Hysteresis hys(uLow = 0.5,uHigh = 0.75) annotation(Placement(transformation(extent = {{-54.45652115149681,-28.366788761781606},{-43.81870599770408,-17.728973607988877}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.Hysteresis hys2(uLow = 0.05,uHigh = 0.075) annotation(Placement(transformation(extent = {{-54.98306297174305,-67.28079241668746},{-44.34524781795032,-56.642977262894725}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.PID conPID(Ti = 1800) annotation(Placement(transformation(extent = {{-81.48579060188118,-87.53414521259498},{-72.81435120522204,-78.86270581593584}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.Sources.Pulse pul(amplitude = 6,period = 86400,shift = 21600,offset = 273.15 + 16) annotation(Placement(transformation(extent = {{-98.98961595533972,-87.31158283726606},{-90.86261407866111,-79.18458096058745}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Conversions.BooleanToReal booToRea(realTrue = mRec_flow_nominal/2) annotation(Placement(transformation(extent = {{-28.461112184782138,-28.042214393327196},{-19.538887815217862,-19.957785606672804}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Conversions.BooleanToReal booToRea2(realTrue = mRec_flow_nominal/2) annotation(Placement(transformation(extent = {{-35.01629857703603,-67.5437974847528},{-22.795393270424803,-56.470433425811294}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sources.Boundary_pT bou2(redeclare replaceable package Medium = Medium,nPorts = 1) annotation(Placement(transformation(extent = {{-62.807595541482286,26.805868160355757},{-49.820850163126565,39.79261353871149}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.MultiplyByParameter gai(k = 8) annotation(Placement(transformation(extent = {{-4.6137609575134695,-76.39765886328532},{2.723346055785348,-69.06055184998648}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.Add TAirLvgSet annotation(Placement(transformation(extent = {{17.566935080924175,-84.12589775086164},{26.947615093039154,-74.74521773874665}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.Add m_fan_set2 annotation(Placement(transformation(extent = {{3.3096599939425104,-30.690340006057497},{12.69034000605749,-21.309659993942503}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.Subtract sub annotation(Placement(transformation(extent = {{105.65105486870317,99.65105486870317},{118.34894513129683,112.34894513129683}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con(k = 273.15) annotation(Placement(transformation(extent = {{92.62061930580685,98.62061930580685},{99.37938069419315,105.37938069419315}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Interfaces.RealOutput TAirCelcisus2 annotation(Placement(transformation(extent = {{125.99348408347049,97.99348408347049},{142.0065159165295,114.00651591652951}},origin = {0.0,0.0},rotation = 0.0)));
        
        initial equation
  // Stop simulation if the hard-coded values differ from the ones computed by EnergyPlus.
  assert(
    abs(
      VRoo1-zon.V) < 0.01,
    "Zone volume VRoo differs from volume returned by EnergyPlus.");

        
equation
    connect(const.y,zon.qGai_flow[1]) annotation(Line(points = {{-56.28240972186764,71.56396361591833},{-21.070369034331943,71.56396361591833},{-21.070369034331943,72},{6,72}},color = {0,0,127}));
    connect(const.y,zon.qGai_flow[2]) annotation(Line(points = {{-56.28240972186764,71.56396361591833},{-21.070369034331943,71.56396361591833},{-21.070369034331943,72},{6,72}},color = {0,0,127}));
    connect(const.y,zon.qGai_flow[3]) annotation(Line(points = {{-56.28240972186764,71.56396361591833},{-21.070369034331943,71.56396361591833},{-21.070369034331943,72},{6,72}},color = {0,0,127}));
    connect(building.weaBus,bou.weaBus) annotation(Line(points = {{-64,4},{-56.462383018759965,4},{-56.462383018759965,5.0316241892140425},{-46.71603038574567,5.0316241892140425}},color = {255,204,51}));
    connect(bou.ports[1],zon.ports[1]) annotation(Line(points = {{-26.716030385745665,4.83162418921404},{28,4.83162418921404},{28,42.9}},color = {0,127,255}));
    connect(zon.ports[2],res.port_b) annotation(Line(points = {{28,42.9},{28,33.25327041162718},{-6.711355129164282,33.25327041162718}},color = {0,127,255}));
    connect(zon.ports[3],fan.port_a) annotation(Line(points = {{28,42.9},{28,-44.42412350932326},{40.68755483791662,-44.42412350932326}},color = {0,127,255}));
    connect(fan.port_b,hea.port_a) annotation(Line(points = {{60.68755483791662,-44.42412350932326},{69.73332427278157,-44.42412350932326},{69.73332427278157,-44.474559312369664},{78.77909370764651,-44.474559312369664}},color = {0,127,255}));
    connect(hea.port_b,zon.ports[4]) annotation(Line(points = {{98.77909370764651,-44.474559312369664},{104.77909370764651,-44.474559312369664},{104.77909370764651,36.60416555235718},{28,36.60416555235718},{28,42.9}},color = {0,127,255}));
    connect(conPID.y,hys.u) annotation(Line(points = {{-71.94720726555613,-83.19842551426541},{-71.94720726555613,-23.04788118488524},{-55.52030266687608,-23.04788118488524}},color = {0,0,127}));
    connect(conPID.y,hys2.u) annotation(Line(points = {{-71.94720726555613,-83.19842551426541},{-71.94720726555613,-61.96188483979109},{-56.04684448712233,-61.96188483979109}},color = {0,0,127}));
    connect(pul.y,conPID.u_s) annotation(Line(points = {{-90.04991389099325,-83.24808189892676},{-82.35293454154709,-83.24808189892676},{-82.35293454154709,-83.19842551426541}},color = {0,0,127}));
    connect(hys.y,booToRea.u) annotation(Line(points = {{-42.75492448232481,-23.04788118488524},{-29.353334621738565,-23.04788118488524},{-29.353334621738565,-24}},color = {255,0,255}));
    connect(hys2.y,booToRea2.u) annotation(Line(points = {{-43.28146630257105,-61.9618848397911},{-36.23838910769715,-62.00711545528205}},color = {255,0,255}));
    connect(bou2.ports[1],res.port_a) annotation(Line(points = {{-49.820850163126565,33.299240849533625},{-40.283191477063454,33.299240849533625},{-40.283191477063454,33.253270411627184},{-26.711355129164282,33.253270411627184}},color = {0,127,255}));
    connect(conPID.y,gai.u) annotation(Line(points = {{-71.94720726555613,-83.19842551426541},{-65.94720726555613,-83.19842551426541},{-65.94720726555613,-72.7291053566359},{-5.34747165884335,-72.7291053566359}},color = {0,0,127}));
    connect(gai.y,TAirLvgSet.u1) annotation(Line(points = {{3.457056757115229,-72.7291053566359},{16.628867079712677,-72.7291053566359},{16.628867079712677,-76.62135374116964}},color = {0,0,127}));
    connect(addPar.y,TAirLvgSet.u2) annotation(Line(points = {{5.0841170632168176,-87.60435365298409},{10.298246623619095,-87.60435365298409},{10.298246623619095,-88.24976174843864},{16.628867079712677,-88.24976174843864},{16.628867079712677,-82.24976174843864}},color = {0,0,127}));
    connect(TAirLvgSet.y,hea.u) annotation(Line(points = {{27.885683094250652,-79.43555774480414},{76.77909370764651,-79.43555774480414},{76.77909370764651,-38.474559312369664}},color = {0,0,127}));
    connect(m_fan_set2.y,fan.m_flow_in) annotation(Line(points = {{13.628408007268987,-26},{50.68755483791662,-26},{50.68755483791662,-32.42412350932326}},color = {0,0,127}));
    connect(booToRea.y,m_fan_set2.u1) annotation(Line(points = {{-18.646665378261435,-24},{-11.369738020351265,-24},{-11.369738020351265,-23.185795996365503},{2.3715919927310125,-23.185795996365503}},color = {0,0,127}));
    connect(booToRea2.y,m_fan_set2.u2) annotation(Line(points = {{-21.57330273976368,-62.00711545528205},{-12.138864594111267,-62.00711545528205},{-12.138864594111267,-28.814204003634497},{2.3715919927310125,-28.814204003634497}},color = {0,0,127}));
    connect(con.y,sub.u2) annotation(Line(points = {{100.05525683303178,102},{104.38126584244381,102},{104.38126584244381,102.1906329212219}},color = {0,0,127}));
    connect(sub.y,TAirCelcisus2) annotation(Line(points = {{119.61873415755619,106},{134,106}},color = {0,0,127}));
    connect(zon.TAir,sub.u1) annotation(Line(points = {{49,80},{55,80},{55,109.8093670787781},{104.38126584244381,109.8093670787781}},color = {0,0,127}));
    connect(zon.TAir,addPar.u) annotation(Line(points = {{49,80},{126,80},{126,-100},{-16,-100},{-16,-87.60435365298409},{-4.346328211955848,-87.60435365298409}},color = {0,0,127}));
    connect(zon.TAir,conPID.u_m) annotation(Line(points = {{49,80},{126,80},{126,-100},{-77.15007090355161,-100},{-77.15007090355161,-88.40128915226089}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}),experiment(StartTime = 0,StopTime = 60,Interval = 60,Tolerance = 0.000001,__Dymola_fixedstepsize = 0.01));
end Test_250124;
