@prefix doap:  <http://usefulinc.com/ns/doap#> .
@prefix lv2:   <http://lv2plug.in/ns/lv2core#> .

<XS_URI>
  a lv2:Plugin , lv2:MixerPlugin ;

  doap:name         "xswitch8" ;
  doap:description  "8 input audio switch" ;
  doap:shortdesc    "xswitch8" ;
  doap:license      <http://io7m.com/license/isc.txt> ;

  lv2:optionalFeature lv2:hardRTCapable ;

  lv2:port
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  0 ;
      lv2:symbol "in_L0" ;
      lv2:name   "Input 0 L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  1 ;
      lv2:symbol "in_R0" ;
      lv2:name   "Input 0 R"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  2 ;
      lv2:symbol "in_L1" ;
      lv2:name   "Input 1 L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  3 ;
      lv2:symbol "in_R1" ;
      lv2:name   "Input 1 R"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  4 ;
      lv2:symbol "in_L2" ;
      lv2:name   "Input 2 L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  5 ;
      lv2:symbol "in_R2" ;
      lv2:name   "Input 2 R"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  6 ;
      lv2:symbol "in_L3" ;
      lv2:name   "Input 3 L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  7 ;
      lv2:symbol "in_R3" ;
      lv2:name   "Input 3 R"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  8 ;
      lv2:symbol "in_L4" ;
      lv2:name   "Input 4 L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  9 ;
      lv2:symbol "in_R4" ;
      lv2:name   "Input 4 R"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  10 ;
      lv2:symbol "in_L5" ;
      lv2:name   "Input 5 L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  11 ;
      lv2:symbol "in_R5" ;
      lv2:name   "Input 5 R"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  12 ;
      lv2:symbol "in_L6" ;
      lv2:name   "Input 6 L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  13 ;
      lv2:symbol "in_R6" ;
      lv2:name   "Input 6 R"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  14 ;
      lv2:symbol "in_L7" ;
      lv2:name   "Input 7 L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index  15 ;
      lv2:symbol "in_R7" ;
      lv2:name   "Input 7 R"
    ]
    ,
    [
      a lv2:AudioPort , lv2:OutputPort ;
		  lv2:index  16 ;
		  lv2:symbol "out_L" ;
      lv2:name   "Output L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:OutputPort ;
		  lv2:index  17 ;
		  lv2:symbol "out_R" ;
      lv2:name   "Output R"
    ]
    ,
    [
      a lv2:InputPort, lv2:ControlPort ;
      lv2:index        18 ;
      lv2:symbol       "select" ;
      lv2:name         "Select" ;
      lv2:default      1.0 ;
      lv2:minimum      1.0 ;
      lv2:maximum      8.0 ;
      lv2:portProperty lv2:integer;
    ]
    .
