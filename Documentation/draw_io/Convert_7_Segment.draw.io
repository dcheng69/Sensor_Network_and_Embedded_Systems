<mxfile host="app.diagrams.net" modified="2024-02-27T21:13:25.359Z" agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82" etag="KL4hAg-9GAGkElg5EKxt" version="23.1.6" type="device">
  <diagram name="Page-1" id="kqe0RsJhqqTveRB52qq7">
    <mxGraphModel dx="1294" dy="774" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="1g3wQfYBi3QpLigv-xs1-1" value="&lt;h1&gt;Number Display Module (Convert to 7-Segment byte)&lt;/h1&gt;" style="text;html=1;spacing=5;spacingTop=-20;whiteSpace=wrap;overflow=hidden;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="10" y="10" width="310" height="90" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-2" value="start" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="364" y="100" width="100" height="50" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-3" value="Input Number in register r0" style="shape=parallelogram;perimeter=parallelogramPerimeter;whiteSpace=wrap;html=1;fixedSize=1;align=center;" vertex="1" parent="1">
          <mxGeometry x="359" y="200" width="110" height="50" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-4" value="This function use assembly to achieve a switch case format code to map the 4-bit value into related byte representation of 7-segment value, here only give an example of 4 cases." style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="10" y="120" width="240" height="90" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-5" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="414" y="150" as="sourcePoint" />
            <mxPoint x="414" y="200" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-11" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-6" target="1g3wQfYBi3QpLigv-xs1-7">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-14" value="no" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="1g3wQfYBi3QpLigv-xs1-11">
          <mxGeometry x="-0.8" y="-1" relative="1" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-24" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-6" target="1g3wQfYBi3QpLigv-xs1-17">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-28" value="yes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="1g3wQfYBi3QpLigv-xs1-24">
          <mxGeometry x="-0.0608" relative="1" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-6" value="Input Number equals #0?" style="rhombus;whiteSpace=wrap;html=1;shadow=0;fontFamily=Helvetica;fontSize=12;align=center;strokeWidth=1;spacing=6;spacingTop=-4;" vertex="1" parent="1">
          <mxGeometry x="364" y="290" width="100" height="80" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-12" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-7" target="1g3wQfYBi3QpLigv-xs1-8">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-15" value="no" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="1g3wQfYBi3QpLigv-xs1-12">
          <mxGeometry x="0.3818" y="3" relative="1" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-25" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-7" target="1g3wQfYBi3QpLigv-xs1-18">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-29" value="yes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="1g3wQfYBi3QpLigv-xs1-25">
          <mxGeometry x="0.0508" relative="1" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-7" value="Input Number equals #1?" style="rhombus;whiteSpace=wrap;html=1;shadow=0;fontFamily=Helvetica;fontSize=12;align=center;strokeWidth=1;spacing=6;spacingTop=-4;" vertex="1" parent="1">
          <mxGeometry x="364" y="410" width="100" height="80" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-13" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-8" target="1g3wQfYBi3QpLigv-xs1-9">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-16" value="no" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="1g3wQfYBi3QpLigv-xs1-13">
          <mxGeometry x="0.3333" y="2" relative="1" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-26" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-8" target="1g3wQfYBi3QpLigv-xs1-19">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-30" value="yes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="1g3wQfYBi3QpLigv-xs1-26">
          <mxGeometry x="-0.0769" y="1" relative="1" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-8" value="Input Number equals #2?" style="rhombus;whiteSpace=wrap;html=1;shadow=0;fontFamily=Helvetica;fontSize=12;align=center;strokeWidth=1;spacing=6;spacingTop=-4;" vertex="1" parent="1">
          <mxGeometry x="364" y="520" width="100" height="80" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-27" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-9" target="1g3wQfYBi3QpLigv-xs1-20">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-31" value="yes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="1g3wQfYBi3QpLigv-xs1-27">
          <mxGeometry x="-0.0606" y="-2" relative="1" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-9" value="Input Number equals #3?" style="rhombus;whiteSpace=wrap;html=1;shadow=0;fontFamily=Helvetica;fontSize=12;align=center;strokeWidth=1;spacing=6;spacingTop=-4;" vertex="1" parent="1">
          <mxGeometry x="364" y="630" width="100" height="80" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-10" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-3" target="1g3wQfYBi3QpLigv-xs1-6">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="480" y="290" as="sourcePoint" />
            <mxPoint x="480" y="340" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-17" value="Assign value for #0 to r1" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="760" y="310" width="120" height="40" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-18" value="Assign value for #0 to r1" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="700" y="430" width="120" height="40" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-19" value="Assign value for #0 to r1" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="620" y="540" width="120" height="40" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-34" style="edgeStyle=elbowEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.75;entryDx=0;entryDy=0;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-20" target="1g3wQfYBi3QpLigv-xs1-22">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="680" y="720" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-20" value="Assign value for #0 to r1" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="530" y="650" width="120" height="40" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-38" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-22" target="1g3wQfYBi3QpLigv-xs1-23">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-22" value="Return with value in register&amp;nbsp; r1" style="shape=parallelogram;perimeter=parallelogramPerimeter;whiteSpace=wrap;html=1;fixedSize=1;align=center;" vertex="1" parent="1">
          <mxGeometry x="354" y="750" width="110" height="50" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-23" value="end" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="359" y="850" width="100" height="50" as="geometry" />
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-35" style="edgeStyle=elbowEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.75;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-19" target="1g3wQfYBi3QpLigv-xs1-22">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="850" y="660" as="sourcePoint" />
            <mxPoint x="650" y="774" as="targetPoint" />
            <Array as="points">
              <mxPoint x="790" y="670" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-36" style="edgeStyle=elbowEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.75;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-18" target="1g3wQfYBi3QpLigv-xs1-22">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="810" y="570" as="sourcePoint" />
            <mxPoint x="520" y="794" as="targetPoint" />
            <Array as="points">
              <mxPoint x="910" y="600" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="1g3wQfYBi3QpLigv-xs1-37" style="edgeStyle=elbowEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.75;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" edge="1" parent="1" source="1g3wQfYBi3QpLigv-xs1-17" target="1g3wQfYBi3QpLigv-xs1-22">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="930" y="480" as="sourcePoint" />
            <mxPoint x="560" y="814" as="targetPoint" />
            <Array as="points">
              <mxPoint x="1020" y="630" />
            </Array>
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
