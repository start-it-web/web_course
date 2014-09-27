<?php
class A
{
    public $a = "public \n";             // Declaration of a public property and its initialization
    protected $b = "protected \n";       // Declaration of a protected property and its initialization
    private $c = "private \n";           // Declaration of a private property and its initialization
 
    function myFunction()
    {              
        echo $this->c;                   // Accessing the private property inside the class
    }
}
 
class B extends A
{
    function myFunction()
    {
        echo $this->b;                   // Accessing protected property of the parent class A
        echo $this->c;                   // Fatal error, attempt to access the private property of the parent class A
    }
}
 
$obj1 = new A();                         
$obj2 = new B();
echo $obj1->a;                           // Accessing of a public property is possible everywhere throughout the code
echo $obj1->b;                           // Fatal error, attempt to access the protected property of the class A
echo $obj1->c;                           // Fatal error, attempt to access the private property of the class A
$obj1->myFunction();                     // Accessing the private member through the object of the class A
$obj2->myFunction();                     // Accessing the protected member through the object of the class B