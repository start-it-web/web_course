<?php
class Animals
{
    public function move()
    {
       echo __METHOD__."<br/>";          // the constant contains [the name of the class]::[its method name] 
    }
}
 
class Mammals extends Animals
{
   public function move()               // method overriding
   { 
       echo __METHOD__."=walk"."<br/>";
   }
}
 
class Birds  extends Animals
{
    public function move()             // method overriding
    {
       echo __METHOD__."=fly"."<br/>";
    }
}
 
class Amphibias  extends Animals
{
    public function move()             // method overriding
    {
       echo __METHOD__."=crawl"."<br/>";
    }
}
 
$animal = new Animals();
$animal->move();                        // the output will be "Animals::move"
$mammal = new Mammals();
$mammal->move();                        // the output will be "Mammals::move=walk"
$bird = new Birds();
$bird->move();                          // the output will be "Birds::move=fly"
$amphibia = new Amphibias();
$amphibia->move();                      // the output will be "Amphibias::move=crawl"
