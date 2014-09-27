<?php

interface MyInterface{
	function mycount();
}


interface Another{
	function show();
}

class A implements MyInterface, Another{
	
	function mycount(){
		return 17;
	}
	
	function show(){
		return $this->mycount();
	}
}

//$myInterface = new MyInterface(); // Causes Fatal error_get_last

$a = new A();
echo $a->show();
