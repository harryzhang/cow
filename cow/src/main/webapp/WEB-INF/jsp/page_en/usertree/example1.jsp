
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Spacetree - Tree Animation</title>

<!-- CSS Files 
<link type="text/css" href="../css/base.css" rel="stylesheet" />
<link type="text/css" href="../css/Spacetree.css" rel="stylesheet" />
-->
<link rel="stylesheet" href='<c:url value="/res/css/base.css?v="/>${cssversion}'/>
<link rel="stylesheet" href='<c:url value="/res/css/Spacetree.css?v="/>${cssversion}'/>

<!--[if IE]><script language="javascript" type="text/javascript" src="../../Extras/excanvas.js"></script><![endif]-->


<script type="text/javascript" src='<c:url value="/res/js/jit.js?v="/>${jsversion}'></script>
<script type="text/javascript" src='<c:url value="/res/js/example1.js?v="/>${jsversion}'></script>
<!-- JIT Library File 	
<script language="javascript" type="text/javascript" src="../../jit.js"></script>
-->
<!-- Example File 
<script language="javascript" type="text/javascript" src="example1.js"></script>
-->
</head>

<body onload="init();">
<div id="container">

<div id="left-container">



<div class="text">
<h4>
Tree Animation    
</h4> 

            A static JSON Tree structure is used as input for this animation.<br /><br />
            <b>Click</b> on a node to select it.<br /><br />
            You can <b>select the tree orientation</b> by changing the select box in the right column.<br /><br />
            You can <b>change the selection mode</b> from <em>Normal</em> selection (i.e. center the selected node) to 
            <em>Set as Root</em>.<br /><br />
            <b>Drag and Drop the canvas</b> to do some panning.<br /><br />
            Leaves color depend on the number of children they actually have.
            
</div>

<div id="id-list"></div>


<div style="text-align:center;"><a href="example1.js">See the Example Code</a></div>            
</div>

<div id="center-container">
    <div id="infovis"></div>    
</div>

<div id="right-container">

<h4>Tree Orientation</h4>
<table>
    <tr>
        <td>
            <label for="r-left">Left </label>
        </td>
        <td>
            <input type="radio" id="r-left" name="orientation" checked="checked" value="left" />
        </td>
    </tr>
    <tr>
         <td>
            <label for="r-top">Top </label>
         </td>
         <td>
            <input type="radio" id="r-top" name="orientation" value="top" />
         </td>
    </tr>
    <tr>
         <td>
            <label for="r-bottom">Bottom </label>
          </td>
          <td>
            <input type="radio" id="r-bottom" name="orientation" value="bottom" />
          </td>
    </tr>
    <tr>
          <td>
            <label for="r-right">Right </label>
          </td> 
          <td> 
           <input type="radio" id="r-right" name="orientation" value="right" />
          </td>
    </tr>
</table>

<h4>Selection Mode</h4>
<table>
    <tr>
        <td>
            <label for="s-normal">Normal </label>
        </td>
        <td>
            <input type="radio" id="s-normal" name="selection" checked="checked" value="normal" />
        </td>
    </tr>
    <tr>
         <td>
            <label for="s-root">Set as Root </label>
         </td>
         <td>
            <input type="radio" id="s-root" name="selection" value="root" />
         </td>
    </tr>
</table>

</div>

<div id="log"></div>
</div>
</body>
</html>
