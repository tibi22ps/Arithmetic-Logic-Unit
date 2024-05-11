@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 119b3732634f44bdb3968e95a121f080 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot ALU_tb_behav xil_defaultlib.ALU_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
