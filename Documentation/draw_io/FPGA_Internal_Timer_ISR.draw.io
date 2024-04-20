<mxfile host="app.diagrams.net" modified="2024-03-09T22:47:39.077Z" agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82" etag="UQDvV81b-9u-UA4pCv3J" version="24.0.4" type="device">
  <diagram name="Page-1" id="LbaIyfaI6Z5ZG-EQ8f-V">
    <mxGraphModel dx="1092" dy="645" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="QmamGLVsoUdfzHaOqyEX-1" value="&lt;h1&gt;FPGA Internal Timer ISR&lt;/h1&gt;&lt;p&gt;This Flow chart demonstrate how the ISR for FPGA Internal Timer works&lt;/p&gt;" style="text;html=1;spacing=5;spacingTop=-20;whiteSpace=wrap;overflow=hidden;rounded=0;" parent="1" vertex="1">
          <mxGeometry x="10" y="10" width="290" height="90" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-1" value="start" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="298" y="100" width="100" height="50" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-2" value="Input counter_val, counter_direction, counter_step_val stored in Memory" style="shape=parallelogram;perimeter=parallelogramPerimeter;whiteSpace=wrap;html=1;fixedSize=1;align=center;" vertex="1" parent="1">
          <mxGeometry x="287.5" y="200" width="121" height="70" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-3" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="347.66" y="150" as="sourcePoint" />
            <mxPoint x="347.66" y="200" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-4" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-2" target="0zQtwd_YpY-hMVoNY9RC-5">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="408.5" y="290" as="sourcePoint" />
            <mxPoint x="342.5" y="310" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-7" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-5" target="0zQtwd_YpY-hMVoNY9RC-6">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-5" value="Read counter_direction to r4, counter_step_val to r5" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="280" y="340" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-10" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-6" target="0zQtwd_YpY-hMVoNY9RC-9">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-13" value="no" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="0zQtwd_YpY-hMVoNY9RC-10">
          <mxGeometry x="-0.2094" y="-1" relative="1" as="geometry">
            <mxPoint y="-11" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-11" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-6" target="0zQtwd_YpY-hMVoNY9RC-8">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-12" value="yes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="0zQtwd_YpY-hMVoNY9RC-11">
          <mxGeometry x="-0.1807" y="-2" relative="1" as="geometry">
            <mxPoint x="23" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-6" value="Value equals #0?" style="rhombus;whiteSpace=wrap;html=1;shadow=0;fontFamily=Helvetica;fontSize=12;align=center;strokeWidth=1;spacing=6;spacingTop=-4;" vertex="1" parent="1">
          <mxGeometry x="298" y="460" width="100" height="80" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-15" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-8" target="0zQtwd_YpY-hMVoNY9RC-14">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-8" value="Counting Up, Add value in r5 to r4" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="83.5" y="600" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-26" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-9" target="0zQtwd_YpY-hMVoNY9RC-16">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-9" value="Counting Down, Subs value in r5 from r4" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="470" y="470" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-19" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-14" target="0zQtwd_YpY-hMVoNY9RC-18">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-21" value="yes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="0zQtwd_YpY-hMVoNY9RC-19">
          <mxGeometry x="0.0219" y="1" relative="1" as="geometry">
            <mxPoint y="-9" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-20" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-14" target="0zQtwd_YpY-hMVoNY9RC-17">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-22" value="no" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="0zQtwd_YpY-hMVoNY9RC-20">
          <mxGeometry x="-0.1828" y="1" relative="1" as="geometry">
            <mxPoint x="10" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-14" value="r4 greater than threshold?" style="rhombus;whiteSpace=wrap;html=1;shadow=0;fontFamily=Helvetica;fontSize=12;align=center;strokeWidth=1;spacing=6;spacingTop=-4;" vertex="1" parent="1">
          <mxGeometry x="101.5" y="710" width="100" height="80" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-28" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-16" target="0zQtwd_YpY-hMVoNY9RC-27">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-29" value="yes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="0zQtwd_YpY-hMVoNY9RC-28">
          <mxGeometry x="-0.0421" y="-1" relative="1" as="geometry">
            <mxPoint y="-11" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-16" value="Check C and V flag set?" style="rhombus;whiteSpace=wrap;html=1;shadow=0;fontFamily=Helvetica;fontSize=12;align=center;strokeWidth=1;spacing=6;spacingTop=-4;" vertex="1" parent="1">
          <mxGeometry x="488" y="580" width="100" height="80" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-24" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-17" target="0zQtwd_YpY-hMVoNY9RC-23">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-17" value="Write value in r4 back to memory" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="352" y="870" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-18" value="reset value to #0" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="352" y="720" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-34" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-23" target="0zQtwd_YpY-hMVoNY9RC-33">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-23" value="call func_number_display" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="352" y="990" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-25" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-18" target="0zQtwd_YpY-hMVoNY9RC-17">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="162" y="900" as="sourcePoint" />
            <mxPoint x="162" y="940" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-27" value="reset value to #threshold" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="660" y="590" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-30" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.5;entryDx=0;entryDy=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-16" target="0zQtwd_YpY-hMVoNY9RC-17">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="668" y="540" as="sourcePoint" />
            <mxPoint x="668" y="590" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-31" value="no" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="0zQtwd_YpY-hMVoNY9RC-30">
          <mxGeometry x="-0.8014" relative="1" as="geometry">
            <mxPoint x="22" y="26" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-32" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.5;entryDx=0;entryDy=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="0zQtwd_YpY-hMVoNY9RC-27" target="0zQtwd_YpY-hMVoNY9RC-17">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="548" y="540" as="sourcePoint" />
            <mxPoint x="548" y="590" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="0zQtwd_YpY-hMVoNY9RC-33" value="end" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="370" y="1110" width="100" height="50" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
