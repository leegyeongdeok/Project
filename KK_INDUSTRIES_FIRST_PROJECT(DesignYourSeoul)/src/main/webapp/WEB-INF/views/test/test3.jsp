<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<style>
.co- a {
    tab1 : $ color-button-passive;
    & [aria-selected = "true"] {
        tab1 : $ color-button-selected;
    }
}

</style>
</head>
<body>
	<ul class="tablist" role="tablist">
		<li id="tab1" class="tab" aria-controls="panel1" aria-selected="true"
			role="tab" tabindex="0"><a href="#">Prices</a></li>
		<li id="tab2" class="tab" aria-controls="panel2" role="tab"
			aria-selected="false" tabindex="0"><a href="#">Features</a></li>
	</ul>

</body>
</html>


