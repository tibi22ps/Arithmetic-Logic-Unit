----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2023 08:47:02 PM
-- Design Name: 
-- Module Name: FullAdderSim - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdderSim is
--  Port ( );
end FullAdderSim;

architecture Behavioral of FullAdderSim is

component FullAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;
 signal A : std_logic;
 signal B : std_logic;
 signal Cin : std_logic;
 signal S : std_logic;
 signal Cout : std_logic;

begin
FullAdderSim: FullAdder port map(A=> A, B => B, Cin => Cin, S => S, Cout => Cout);

A <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 50 ns;
B <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 40 ns, '0' after 60 ns;
Cin <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '1' after 40 ns;
end Behavioral;
