
t
Command: %s
53*	vivadotcl2C
/synth_design -top display -part xc7a35tcpg236-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px? 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
`
#Helper process launched with PID %s4824*oasys2
172802default:defaultZ8-7075h px? 
?
%s*synth2?
wStarting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1030.297 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2
display2default:default2
 2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
12default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
divider2default:default2
 2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/divider.v2default:default2
12default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2!
counter_N_bit2default:default2
 2default:default2i
SC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/counter_N_bit.v2default:default2
12default:default8@Z8-6157h px? 
W
%s
*synth2?
+	Parameter N bound to: 18 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
counter_N_bit2default:default2
 2default:default2
12default:default2
12default:default2i
SC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/counter_N_bit.v2default:default2
12default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
DFF2default:default2
 2default:default2_
IC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/DFF.v2default:default2
12default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
DFF2default:default2
 2default:default2
22default:default2
12default:default2_
IC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/DFF.v2default:default2
12default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
divider2default:default2
 2default:default2
32default:default2
12default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/divider.v2default:default2
12default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2%
ring_counter_4bit2default:default2
 2default:default2m
WC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ring_counter_4bit.v2default:default2
12default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys21
counter_N_bit__parameterized02default:default2
 2default:default2i
SC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/counter_N_bit.v2default:default2
12default:default8@Z8-6157h px? 
V
%s
*synth2>
*	Parameter N bound to: 2 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
counter_N_bit__parameterized02default:default2
 2default:default2
32default:default2
12default:default2i
SC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/counter_N_bit.v2default:default2
12default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2 
decoder_2to42default:default2
 2default:default2h
RC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/decoder_2to4.v2default:default2
12default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
decoder_2to42default:default2
 2default:default2
42default:default2
12default:default2h
RC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/decoder_2to4.v2default:default2
12default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
ring_counter_4bit2default:default2
 2default:default2
52default:default2
12default:default2m
WC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ring_counter_4bit.v2default:default2
12default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
pipeline2default:default2
 2default:default2d
NC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/pipeline.v2default:default2
232default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
PC2default:default2
 2default:default2^
HC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/PC.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PC2default:default2
 2default:default2
62default:default2
12default:default2^
HC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/PC.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2+
InstructionMemory_Bonus2default:default2
 2default:default2s
]C:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/InstructionMemory_Bonus.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2+
InstructionMemory_Bonus2default:default2
 2default:default2
72default:default2
12default:default2s
]C:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/InstructionMemory_Bonus.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
IFID2default:default2
 2default:default2`
JC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/IFID.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
IFID2default:default2
 2default:default2
82default:default2
12default:default2`
JC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/IFID.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
Control2default:default2
 2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
232default:default8@Z8-6157h px? 
?
-case statement is not full and has no default155*oasys2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
442default:default8@Z8-155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Control2default:default2
 2default:default2
92default:default2
12default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
Register2default:default2
 2default:default2d
NC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Register.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Register2default:default2
 2default:default2
102default:default2
12default:default2d
NC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Register.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

SignExtend2default:default2
 2default:default2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/SignExtend.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

SignExtend2default:default2
 2default:default2
112default:default2
12default:default2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/SignExtend.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
MUX32default:default2
 2default:default2`
JC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/MUX3.v2default:default2
232default:default8@Z8-6157h px? 
?
-case statement is not full and has no default155*oasys2`
JC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/MUX3.v2default:default2
292default:default8@Z8-155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MUX32default:default2
 2default:default2
122default:default2
12default:default2`
JC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/MUX3.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
IDEX2default:default2
 2default:default2`
JC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/IDEX.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
IDEX2default:default2
 2default:default2
132default:default2
12default:default2`
JC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/IDEX.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

ALUControl2default:default2
 2default:default2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ALUControl.v2default:default2
232default:default8@Z8-6157h px? 
?
-case statement is not full and has no default155*oasys2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ALUControl.v2default:default2
332default:default8@Z8-155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

ALUControl2default:default2
 2default:default2
142default:default2
12default:default2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ALUControl.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
ALU2default:default2
 2default:default2_
IC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ALU.v2default:default2
232default:default8@Z8-6157h px? 
?
-case statement is not full and has no default155*oasys2_
IC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ALU.v2default:default2
342default:default8@Z8-155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ALU2default:default2
 2default:default2
152default:default2
12default:default2_
IC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ALU.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
EXMEM2default:default2
 2default:default2a
KC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/EXMEM.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
EXMEM2default:default2
 2default:default2
162default:default2
12default:default2a
KC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/EXMEM.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

DataMemory2default:default2
 2default:default2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/DataMemory.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

DataMemory2default:default2
 2default:default2
172default:default2
12default:default2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/DataMemory.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
MEMWB2default:default2
 2default:default2a
KC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/MEMWB.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MEMWB2default:default2
 2default:default2
182default:default2
12default:default2a
KC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/MEMWB.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

Forwarding2default:default2
 2default:default2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Forwarding.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Forwarding2default:default2
 2default:default2
192default:default2
12default:default2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Forwarding.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2#
HazardDetection2default:default2
 2default:default2k
UC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/HazardDetection.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
HazardDetection2default:default2
 2default:default2
202default:default2
12default:default2k
UC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/HazardDetection.v2default:default2
232default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
pipeline2default:default2
 2default:default2
212default:default2
12default:default2d
NC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/pipeline.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
SSD2default:default2
 2default:default2_
IC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/SSD.v2default:default2
12default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
SSD2default:default2
 2default:default2
222default:default2
12default:default2_
IC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/SSD.v2default:default2
12default:default8@Z8-6155h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2

ReadDataEx2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
372default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
PCout2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
372default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
Cathode32default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
442default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
Cathode22default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
442default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
Cathode12default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
442default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
Cathode02default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
442default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
Cathode72default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
442default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
Cathode62default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
442default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
Cathode52default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
442default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
Cathode42default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
442default:default8@Z8-567h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
display2default:default2
 2default:default2
232default:default2
12default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
12default:default8@Z8-6155h px? 
?
%s*synth2?
wFinished RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1030.297 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1030.297 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1030.297 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0382default:default2
1030.2972default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2l
VC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/constrs_1/new/implementation.xdc2default:default8Z20-179h px? 
?
No nets matched '%s'.
507*	planAhead2
sw_clk_IBUF2default:default2l
VC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/constrs_1/new/implementation.xdc2default:default2
382default:default8@Z12-507h px?
?
"'%s' expects at least one object.
55*common2 
set_property2default:default2l
VC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/constrs_1/new/implementation.xdc2default:default2
382default:default8@Z17-55h px?
?
Finished Parsing XDC File [%s]
178*designutils2l
VC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/constrs_1/new/implementation.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2j
VC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/constrs_1/new/implementation.xdc2default:default2-
.Xil/display_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1059.8162default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0152default:default2
1059.8162default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
!inferring latch for variable '%s'327*oasys2
y0_reg2default:default2h
RC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/decoder_2to4.v2default:default2
182default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
y1_reg2default:default2h
RC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/decoder_2to4.v2default:default2
192default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
y2_reg2default:default2h
RC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/decoder_2to4.v2default:default2
202default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
y3_reg2default:default2h
RC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/decoder_2to4.v2default:default2
212default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2

regdst_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
462default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
jump_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
472default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
bne_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
492default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
beq_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
482default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
memread_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
502default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2 
memwrite_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
522default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2

ALUSrc_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
532default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2 
regwrite_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
542default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
	ALUop_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/Control.v2default:default2
552default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
out_reg2default:default2`
JC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/MUX3.v2default:default2
302default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
control_reg2default:default2f
PC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ALUControl.v2default:default2
302default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2

result_reg2default:default2_
IC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/ALU.v2default:default2
352default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
CA_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
482default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
CB_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
492default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
CC_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
502default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
CD_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
512default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
CE_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
522default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
CF_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
532default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
CG_reg2default:default2c
MC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.srcs/sources_1/new/display.v2default:default2
542default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:17 ; elapsed = 00:00:18 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input   32 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   18 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               18 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 13    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	  31 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   32 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 7     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   18 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   9 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 5     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   9 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 54    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   9 Input    1 Bit        Muxes := 10    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:25 ; elapsed = 00:00:26 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
j
%s*synth2R
>
Distributed RAM: Preliminary Mapping	Report (see note below)
2default:defaulth px? 
?
%s*synth2p
\+------------+------------------------+-----------+----------------------+----------------+
2default:defaulth px? 
?
%s*synth2q
]|Module Name | RTL Object             | Inference | Size (Depth x Width) | Primitives     | 
2default:defaulth px? 
?
%s*synth2p
\+------------+------------------------+-----------+----------------------+----------------+
2default:defaulth px? 
?
%s*synth2q
]|display     | pcpu/regsiter/regs_reg | Implied   | 32 x 32              | RAM32M x 18	   | 
2default:defaulth px? 
?
%s*synth2q
]|display     | pcpu/dm/memory_reg     | Implied   | 32 x 32              | RAM32X1S x 32	 | 
2default:defaulth px? 
?
%s*synth2q
]+------------+------------------------+-----------+----------------------+----------------+

2default:defaulth px? 
?
%s*synth2?
?Note: The table above is a preliminary report that shows the Distributed RAMs at the current stage of the synthesis flow. Some Distributed RAMs may be reimplemented as non Distributed RAM primitives later in the synthesis flow. Multiple instantiated RAMs are reported only once.
2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Timing Optimization : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
S
%s
*synth2;
'
Distributed RAM: Final Mapping	Report
2default:defaulth p
x
? 
?
%s
*synth2p
\+------------+------------------------+-----------+----------------------+----------------+
2default:defaulth p
x
? 
?
%s
*synth2q
]|Module Name | RTL Object             | Inference | Size (Depth x Width) | Primitives     | 
2default:defaulth p
x
? 
?
%s
*synth2p
\+------------+------------------------+-----------+----------------------+----------------+
2default:defaulth p
x
? 
?
%s
*synth2q
]|display     | pcpu/regsiter/regs_reg | Implied   | 32 x 32              | RAM32M x 18	   | 
2default:defaulth p
x
? 
?
%s
*synth2q
]|display     | pcpu/dm/memory_reg     | Implied   | 32 x 32              | RAM32X1S x 32	 | 
2default:defaulth p
x
? 
?
%s
*synth2q
]+------------+------------------------+-----------+----------------------+----------------+

2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Technology Mapping : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
uFinished IO Insertion : Time (s): cpu = 00:00:39 ; elapsed = 00:00:40 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:39 ; elapsed = 00:00:40 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:39 ; elapsed = 00:00:40 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:39 ; elapsed = 00:00:40 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:39 ; elapsed = 00:00:40 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:39 ; elapsed = 00:00:40 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
F
%s*synth2.
+------+---------+------+
2default:defaulth px? 
F
%s*synth2.
|      |Cell     |Count |
2default:defaulth px? 
F
%s*synth2.
+------+---------+------+
2default:defaulth px? 
F
%s*synth2.
|1     |BUFG     |     3|
2default:defaulth px? 
F
%s*synth2.
|2     |CARRY4   |    52|
2default:defaulth px? 
F
%s*synth2.
|3     |LUT1     |    12|
2default:defaulth px? 
F
%s*synth2.
|4     |LUT2     |   103|
2default:defaulth px? 
F
%s*synth2.
|5     |LUT3     |   136|
2default:defaulth px? 
F
%s*synth2.
|6     |LUT4     |    71|
2default:defaulth px? 
F
%s*synth2.
|7     |LUT5     |   135|
2default:defaulth px? 
F
%s*synth2.
|8     |LUT6     |   146|
2default:defaulth px? 
F
%s*synth2.
|9     |MUXF7    |    16|
2default:defaulth px? 
F
%s*synth2.
|10    |RAM32M   |    18|
2default:defaulth px? 
F
%s*synth2.
|11    |RAM32X1S |    32|
2default:defaulth px? 
F
%s*synth2.
|12    |FDRE     |   348|
2default:defaulth px? 
F
%s*synth2.
|13    |LD       |    44|
2default:defaulth px? 
F
%s*synth2.
|14    |LDC      |     2|
2default:defaulth px? 
F
%s*synth2.
|15    |LDCP     |     2|
2default:defaulth px? 
F
%s*synth2.
|16    |IBUF     |     9|
2default:defaulth px? 
F
%s*synth2.
|17    |OBUF     |    11|
2default:defaulth px? 
F
%s*synth2.
+------+---------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:39 ; elapsed = 00:00:40 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 23 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:28 ; elapsed = 00:00:38 . Memory (MB): peak = 1059.816 ; gain = 0.000
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:00:39 ; elapsed = 00:00:40 . Memory (MB): peak = 1059.816 ; gain = 29.520
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:012default:default2 
00:00:00.0412default:default2
1062.7892default:default2
0.0002default:defaultZ17-268h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
1662default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
v
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12default:default2
182default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1062.7892default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2?
?  A total of 98 instances were transformed.
  LD => LDCE: 44 instances
  LDC => LDCE: 2 instances
  LDCP => LDCP (GND, LDCE, LUT3(x2), VCC): 2 instances
  RAM32M => RAM32M (inverted pins: WCLK) (RAMD32(x6), RAMS32(x2)): 18 instances
  RAM32X1S => RAM32X1S (RAMS32): 32 instances
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
672default:default2
342default:default2
12default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:482default:default2
00:00:542default:default2
1062.7892default:default2
32.4922default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2]
IC:/Users/ZWK/Desktop/pipeline_sourcecode/p2_FPGA.runs/synth_1/display.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2x
dExecuting : report_utilization -file display_utilization_synth.rpt -pb display_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri Nov 13 13:25:03 20202default:defaultZ17-206h px? 


End Record