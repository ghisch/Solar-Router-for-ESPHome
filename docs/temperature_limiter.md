# Temperature limiters

A temperature limiter is designed to monitor a temperature and **stop energy diverting when a threshold is reached**. The regulation is reactivated **when restart condition is ready again** .

The 2 thresholds regulation is named hysteresis. This mechansim avoid regulation bouncing.
??? Note "More details about hysteresis and Schmitt trigger here"
    The implementation of hysteresis in this package is similar to the electronic circuit named [Schmitt trigger](https://en.wikipedia.org/wiki/Schmitt_trigger). The circuit is named a **trigger** because the output retains its value until the input changes sufficiently to trigger a change.

    ![](images/hysteresis.png)  
    Transfer function of a Schmitt trigger. The horizontal and vertical axes are input voltage and output voltage, respectively. T and −T are the switching thresholds, and M and −M are the output voltage levels.

    ![](images/schmitt_trigger.png)  
    Comparison of the action of an ordinary comparator (A) and a Schmitt trigger (B) on a noisy analog input signal (U). The green dotted lines are the circuit's switching thresholds. The Schmitt trigger tends to remove noise from the signal.

    source: [wikipedia](https://en.wikipedia.org/wiki/Schmitt_trigger)

!!! warning "If temperature is not reachable, `safety_limit` is activated and energy divertion is stopped" 

![HA](images/temperature_limiter_controls.png){ align=left }
!!! note ""
    **Controls**
    
    * ***Restart temperature***  
      Define the temperature when regulation can restart after a safety limit.
    * ***Stop temperature***  
      Define the temperature when regulation is stopped due to threshold reached.
    * ***Use for cooling***  
      When regulation is use on a heating system *restart temperature* has to be lower than *stop temperature*. This is the oposit for a cooling system.

<pre> 








</pre>

![HA](images/temperature_limiter_sensor.png){ align=left }
!!! note ""
    **Sensors**
    
    * ***Safety limit***  
      This binary sensor shows if safety limit is activated or not.
    * ***safety temperature***
      This sensors show the actual temperature which is compared with thresholds. 
<pre> 




</pre>
