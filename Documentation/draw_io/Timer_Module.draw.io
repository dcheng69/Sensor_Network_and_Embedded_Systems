<mxfile host="app.diagrams.net" modified="2024-02-29T05:45:21.046Z" agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82" etag="p2qJdEYEpOYmnpw6V0dH" version="23.1.6" type="device">
  <diagram name="Page-1" id="QDzUM2jWfPYtyCVAIG6L">
    <mxGraphModel dx="1619" dy="834" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-1" value="&lt;h1&gt;Timer Module&lt;/h1&gt;&lt;p&gt;Flow chart for the Timer Module, does not employ the interrupt due to the complexity of the code&lt;/p&gt;" style="text;html=1;spacing=5;spacingTop=-20;whiteSpace=wrap;overflow=hidden;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="10" y="10" width="230" height="120" as="geometry" />
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-2" value="start" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="364" y="100" width="100" height="50" as="geometry" />
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-3" value="Input Time Interval in register r0" style="shape=parallelogram;perimeter=parallelogramPerimeter;whiteSpace=wrap;html=1;fixedSize=1;align=center;" vertex="1" parent="1">
          <mxGeometry x="359" y="200" width="110" height="50" as="geometry" />
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-4" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="414" y="150" as="sourcePoint" />
            <mxPoint x="414" y="200" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-5" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="_MwnlcYJFzZ9qp5ictd8-9" target="_MwnlcYJFzZ9qp5ictd8-20">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="414" y="790" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-6" value="yes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="_MwnlcYJFzZ9qp5ictd8-5">
          <mxGeometry x="-0.8" y="-1" relative="1" as="geometry">
            <mxPoint x="17" y="23" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-7" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="_MwnlcYJFzZ9qp5ictd8-9" target="_MwnlcYJFzZ9qp5ictd8-14">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="550" y="690" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-8" value="no" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="_MwnlcYJFzZ9qp5ictd8-7">
          <mxGeometry x="-0.0608" relative="1" as="geometry">
            <mxPoint x="-16" y="-17" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-9" value="Remaining equals #0?" style="rhombus;whiteSpace=wrap;html=1;shadow=0;fontFamily=Helvetica;fontSize=12;align=center;strokeWidth=1;spacing=6;spacingTop=-4;" vertex="1" parent="1">
          <mxGeometry x="364" y="650" width="100" height="80" as="geometry" />
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-10" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="_MwnlcYJFzZ9qp5ictd8-3" target="_MwnlcYJFzZ9qp5ictd8-11">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="480" y="290" as="sourcePoint" />
            <mxPoint x="414" y="310" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-11" value="Assign Input Time Intervals o Counter low and high 16-bit" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="346" y="300" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-12" value="Set Control Register Values" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="346" y="410" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-13" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="_MwnlcYJFzZ9qp5ictd8-11" target="_MwnlcYJFzZ9qp5ictd8-12">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="440" y="380" as="sourcePoint" />
            <mxPoint x="440" y="430" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-23" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="_MwnlcYJFzZ9qp5ictd8-14" target="_MwnlcYJFzZ9qp5ictd8-24">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="570" y="555" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-14" value="Read Counter Snapshots values into register" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="346" y="524.5" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-15" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="_MwnlcYJFzZ9qp5ictd8-12" target="_MwnlcYJFzZ9qp5ictd8-14">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="424" y="370" as="sourcePoint" />
            <mxPoint x="424" y="420" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-16" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="_MwnlcYJFzZ9qp5ictd8-14" target="_MwnlcYJFzZ9qp5ictd8-9">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="424" y="480" as="sourcePoint" />
            <mxPoint x="424" y="535" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-17" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="_MwnlcYJFzZ9qp5ictd8-20" target="_MwnlcYJFzZ9qp5ictd8-19">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="414" y="870" as="sourcePoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-19" value="end" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="364" y="910" width="100" height="50" as="geometry" />
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-20" value="Clear Control/Status Register Values" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="346" y="790" width="136" height="60" as="geometry" />
        </mxCell>
        <mxCell id="_MwnlcYJFzZ9qp5ictd8-24" value="VGA Display Count Down" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;" vertex="1" parent="1">
          <mxGeometry x="590" y="514.5" width="80" height="80" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
