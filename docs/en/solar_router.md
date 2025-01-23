# Solar Router / Diverter

**Solar Router for [ESPHome](http://esphome.io)** has been designed to work with [Home Assistant](http://home-assistant.io) and it requires the installation of [ESPHome integration](https://www.home-assistant.io/integrations/esphome/).  

## Variable regulation

![HA](images/SolarRouterInHomeAssistant.png){ align=left }
!!! note ""
    **Controls**
    
    * ***Activate Solar Routing***  
      Control if Solar routing should be activated or not
    * ***Reactivity***  
      How fast will be the solar routing
      From 1 to 100. 1 is the slowest, 100 is the fastest.
    * ***Regulator opening***  
      What is the current percentage of gate opening to send energy to the load 
    * ***Target grid exchange***  
      What is the target of energy exchanged with the grid.  
      &lt; 0 energy is sent to the grid  
      &gt; 0 energy is used from the grid
!!! note ""
    **Sensors**
    
    * ***Real Power***  
      Energy actually exchanged with the grid. Updated every secondes. 

<br>  
<br>  
<br>  

!!! note 
    When solar routing is deactivated, regulator opening slider can be modified "by hand".  
    If you modify the triac opening state while the solar routing is enabled, the routing algorithm will immediately modify the value to meet target grid exchange level.

## ON/OFF regulation

![HA](images/SolarRouterONOFFInHomeAssistant.png){ align=left }
!!! note ""
    **Controls**
    
    * ***Activate Solar Routing***  
      Control if Solar routing should be activated or not
    * ***Energy divertion***  
      Ectivate energy divertion or not 
    * ***Start power level***  
      Define the level of energy when divertion has to start  
    * ***Start tempo***  
      How long the start level has to be exceed before diverting energy  
    * ***Stop power level***  
      Define the level of energy when divertion has to stop  
    * ***Start tempo***  
      How long the stop level has to be reached before diverting energy
!!! note ""
    **Sensors**
    
    * ***Real Power***  
      Energy actually exchanged with the grid. Updated every secondes.
    * ***Start Tempo***
      Counter defining when enegy divertion has to start 
    * ***Stop Tempo***
      Counter defining when enegy divertion has to stop 

<br>
<br>


!!! note 
    When solar routing is deactivated, regulator opening slider can be modified "by hand".  
    If you modify the triac opening state while the solar routing is enabled, the routing algorithm will immediately modify the value to meet target grid exchange level.
