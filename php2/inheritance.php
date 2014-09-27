<?php

class Animals
{
    public function move()
    {
       echo __METHOD__."<br/>";
    }
}
 
class Mammals extends Animals
{
}
 
$animal = new Animals();
$animal->move();
$mammal = new Mammals();
$mammal->move();                // you still can call the method from the parent class, because Mammals inherits it