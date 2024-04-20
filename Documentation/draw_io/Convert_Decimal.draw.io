<mxfile host="app.diagrams.net" modified="2024-02-27T21:04:14.896Z" agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82" etag="ZHKtX_0ClqNqfE8qc74v" version="23.1.6" type="device">
  <diagram name="Page-1" id="GcHC1O3y8cwaw4Zekikx">
    <mxGraphModel dx="1294" dy="774" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="yMz_ebxSkjTsVUsreGOL-1" value="&lt;h1&gt;Number Display Module (Convert Decimal Subroutine)&lt;/h1&gt;" style="text;html=1;spacing=5;spacingTop=-20;whiteSpace=wrap;overflow=hidden;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="10" y="10" width="310" height="90" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-2" value="start" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="364" y="100" width="100" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-3" value="Input Number in register r0" style="shape=parallelogram;perimeter=parallelogramPerimeter;whiteSpace=wrap;html=1;fixedSize=1;align=center;" vertex="1" parent="1">
          <mxGeometry x="359" y="200" width="110" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-4" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="yMz_ebxSkjTsVUsreGOL-2" target="yMz_ebxSkjTsVUsreGOL-3">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="404" y="450" as="sourcePoint" />
            <mxPoint x="404" y="500" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-5" value="This function will convert a Hex format number to specially constructed Decimal format. By specially constructed Decimal format, I mean that use 4-digit to store a Decimal digit." style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="10" y="120" width="240" height="90" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-6" value="Divide r0 by #10,&amp;nbsp;quotient in r0, reminder in r1" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="346" y="300" width="136" height="70" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-7" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="yMz_ebxSkjTsVUsreGOL-6">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="474" y="350" as="sourcePoint" />
            <mxPoint x="414" y="410" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-8" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="yMz_ebxSkjTsVUsreGOL-3" target="yMz_ebxSkjTsVUsreGOL-6">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="500" y="260" as="sourcePoint" />
            <mxPoint x="500" y="310" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-9" value="Add r1 to the r2 lower 4-bit" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="346" y="410" width="136" height="70" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-10" value="Shift r2 left 4-bit" style="rounded=1;whiteSpace=wrap;html=1;fontSize=12;glass=0;strokeWidth=1;shadow=0;" vertex="1" parent="1">
          <mxGeometry x="354" y="520" width="120" height="40" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-11" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="yMz_ebxSkjTsVUsreGOL-9" target="yMz_ebxSkjTsVUsreGOL-10">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="510" y="510" as="sourcePoint" />
            <mxPoint x="510" y="550" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-12" value="Input Number becomes #0?" style="rhombus;whiteSpace=wrap;html=1;shadow=0;fontFamily=Helvetica;fontSize=12;align=center;strokeWidth=1;spacing=6;spacingTop=-4;" vertex="1" parent="1">
          <mxGeometry x="364" y="610" width="100" height="80" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-13" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="yMz_ebxSkjTsVUsreGOL-10" target="yMz_ebxSkjTsVUsreGOL-12">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="474" y="585" as="sourcePoint" />
            <mxPoint x="474" y="625" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-14" value="No" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" target="yMz_ebxSkjTsVUsreGOL-6" source="yMz_ebxSkjTsVUsreGOL-12">
          <mxGeometry x="0.3333" y="20" relative="1" as="geometry">
            <mxPoint as="offset" />
            <mxPoint x="333" y="635" as="sourcePoint" />
            <mxPoint x="110" y="355" as="targetPoint" />
            <Array as="points">
              <mxPoint x="210" y="650" />
              <mxPoint x="210" y="335" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-18" value="&lt;div&gt;&lt;br/&gt;&lt;/div&gt;" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="yMz_ebxSkjTsVUsreGOL-12" target="yMz_ebxSkjTsVUsreGOL-20">
          <mxGeometry y="10" relative="1" as="geometry">
            <mxPoint as="offset" />
            <mxPoint x="420" y="990" as="sourcePoint" />
            <mxPoint x="414" y="750" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-19" value="Yes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="yMz_ebxSkjTsVUsreGOL-18">
          <mxGeometry x="-0.4043" y="2" relative="1" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-20" value="Return with value in register&amp;nbsp; r2" style="shape=parallelogram;perimeter=parallelogramPerimeter;whiteSpace=wrap;html=1;fixedSize=1;align=center;" vertex="1" parent="1">
          <mxGeometry x="359" y="750" width="110" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-22" value="end" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="364" y="850" width="100" height="50" as="geometry" />
        </mxCell>
        <mxCell id="yMz_ebxSkjTsVUsreGOL-23" value="" style="rounded=0;html=1;jettySize=auto;orthogonalLoop=1;fontSize=11;endArrow=block;endFill=0;endSize=8;strokeWidth=1;shadow=0;labelBackgroundColor=none;edgeStyle=orthogonalEdgeStyle;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" edge="1" parent="1" source="yMz_ebxSkjTsVUsreGOL-20" target="yMz_ebxSkjTsVUsreGOL-22">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="530" y="840" as="sourcePoint" />
            <mxPoint x="530" y="890" as="targetPoint" />
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
