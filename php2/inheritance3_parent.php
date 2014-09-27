<?php
  $object = new Son;
  $object->test();
  $object->test2();

  class Dad
  {
    function test()
    {
      echo "[Class Dad] I am your Father<br>";
    }
  }

  class Son extends Dad
  {
    function test()   //test method is over-ridden
    {
      echo "[Class Son] I am Luke<br>";
    }
  	
    function test2()
    {
      parent::test();
    }
  }
?>