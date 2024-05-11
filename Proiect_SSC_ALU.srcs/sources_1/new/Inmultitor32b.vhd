----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2023 07:48:22 PM
-- Design Name: 
-- Module Name: Inmultitor32b - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Inmultitor32b is
Port ( AA : in  STD_LOGIC_VECTOR (15 downto 0);
           BB : in  STD_LOGIC_VECTOR (15 downto 0);
           PP : out  STD_LOGIC_VECTOR (31 downto 0));
end Inmultitor32b;

architecture Behavioral of Inmultitor32b is

component Inmultire is
	Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           P: out  STD_LOGIC_VECTOR (15 downto 0));
end component;	
signal mLow , mHigh , nLow, nHigh: STD_LOGIC_VECTOR (7 downto 0);
signal mLow_nLow ,mHigh_nLow ,mLow_nHigh,mHigh_nHigh  :STD_LOGIC_VECTOR (15 downto 0);
signal mHigh_nHigh2: STD_LOGIC_VECTOR (31 downto 0);

signal first,second,third,fourth,answer : integer;		  
begin
mLow <= AA(7 downto 0);
mHigh <= AA(15 downto 8);
nLow <= BB(7 downto 0);
nHigh <= BB(15 downto 8);

m00 :Inmultire port map(mLow,nLow,mLow_nLow);
m01 :Inmultire port map (mHigh,nLow,mHigh_nLow);
m02 :Inmultire port map (mLow,nHigh,mLow_nHigh);
m03 :Inmultire port map (mHigh,nHigh,mHigh_nHigh);

mHigh_nHigh2(15 downto 0) <= mHigh_nHigh(15 downto 0);


first <=to_integer(unsigned(mLow_nLow));
second <= to_integer(unsigned(mHigh_nLow));
third <= to_integer(unsigned(mLow_nHigh));

fourth <= to_integer(shift_left(unsigned(mHigh_nHigh2),16));

answer <= first+(second+third)*256+fourth;

PP <=std_logic_vector(to_signed(answer,32));
end Behavioral;