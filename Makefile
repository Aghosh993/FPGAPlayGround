fpga:
	djtgcfg -d "Nexys2" prog -i 0 -f /home/aghosh01/other_simple_i2c/DS1621_interface.bit
prom:
	djtgcfg -d "Nexys2" prog -i 1 -f /home/aghosh01/HardwareTest/test.bit
lab4_p1:
	djtgcfg -d "Nexys2" prog -i 0 -f /home/aghosh01/Lab4_p1/rotationTest.bit
lab4_p1_prom:
	 djtgcfg -d "Nexys2" prog -i 1 -f /home/aghosh01/Lab4_p1/rotationTest.bit
lab4_p2:
	djtgcfg -d "Nexys2" prog -i 0 -f /home/aghosh01/Lab4_p2/rotationTest.bit
lab4_p2_prom:
	 djtgcfg -d "Nexys2" prog -i 1 -f /home/aghosh01/Lab4_p2/rotationTest.bit
lab4_p3:
	djtgcfg -d "Nexys2" prog -i 0 -f /home/aghosh01/Lab4_p3/rotationTest.bit
lab4_p3_prom:
	 djtgcfg -d "Nexys2" prog -i 1 -f /home/aghosh01/Lab4_p3/rotationTest.bit
lab6_enc:
	djtgcfg -d "Nexys2" prog -i 0 -f /home/aghosh01/Lab6_enc/encTest.bit
lab6_dec:
	djtgcfg -d "Nexys2" prog -i 0 -f /home/aghosh01/Lab6_dec/encTest.bit
simple_pwm:
	 djtgcfg -d "Nexys2" prog -i 0 -f toplevel.bit
simple_pwm_prom:
	 djtgcfg -d "Nexys2" prog -i 1 -f toplevel.bit
