----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2023 09:03:31 PM
-- Design Name: 
-- Module Name: RippleCarryAdderSim - Behavioral
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

entity RippleCarryAdderSim is
--  Port ( );
end RippleCarryAdderSim;

architecture Behavioral of RippleCarryAdderSim is

component RippleCarryAdder is
  Port (
  A, B    : in  std_logic_vector(31 downto 0);
  S       : out std_logic_vector(31 downto 0);
  Cout    : out std_logic
);
end component;

 signal As, Bs, Sum : std_logic_vector(31 downto 0);
 signal Cout: std_logic;

begin
  RippleCarryAdderSim: RippleCarryAdder port map(A => As, B => Bs, S => Sum, Cout => Cout);

  sim_process: process
   begin
     As <= (others => '0');
     Bs <= (others => '0');
     wait for 20 ns;
     As <= X"12345678";
     Bs <= X"12345678";
     wait for 20 ns;
     As <= X"aaaaaaaa";
     wait for 20 ns;
     Bs <= X"cccccccc";
     wait for 30 ns;
     Bs <= X"f0f0f0f0";
     wait for 20 ns;
     As <= X"FFFFFFFF";
     Bs <= X"FFFFFFFF";
     wait;
   end process sim_process;
  
end Behavioral;
