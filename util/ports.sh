#!/bin/sh

index=0
for port in $(seq 0 7)
do
  index_L=${index}
  index_R=$(expr $index + 1)

  cat <<EOF
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:index    ${index_L} ;
      lv2:datatype lv2:float;
      lv2:symbol   "in_L${port}" ;
      lv2:name     "Input ${port} L"
    ]
    ,
    [
      a lv2:AudioPort , lv2:InputPort ;
      lv2:datatype lv2:float;
      lv2:index    ${index_R} ;
      lv2:symbol   "in_R${port}" ;
      lv2:name     "Input ${port} R"
    ]
    ,
EOF
  index=$(expr $index + 2)
done
