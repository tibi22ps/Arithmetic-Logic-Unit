----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2023 09:57:26 PM
-- Design Name: 
-- Module Name: RippleCarrySubtractorSim - Behavioral
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

entity RippleCarrySubtractorSim is
--  Port ( );
end RippleCarrySubtractorSim;

architecture Behavioral of RippleCarrySubtractorSim is

 component RippleCarrySubtractor
    Port (
      A, B : in  std_logic_vector(31 downto 0);
      D : out std_logic_vector(31 downto 0);
      Bout : out std_logic
    );
  end component;
  
  signal As, Bs, Dif : std_logic_vector(31 downto 0);
  signal Bout : std_logic;

begin
  RippleCarrySubtractorSim: RippleCarrySubtractor port map(A => As, B => Bs, D => Dif, Bout => Bout);

  sim_process: process
  begin
    -- Test Case 1: A - B where A > B
    As <= X"12345678";
    Bs <= X"00000001";
    wait for 20 ns;

    -- Test Case 2: A - B where A < B (result is negative)
    As <= X"00000001";
    Bs <= X"12345678";
    wait for 20 ns;

    -- Test Case 3: A - B where A = B (result is 0)
    As <= X"12345678";
    Bs <= X"12345678";
    wait for 20 ns;

    
    As <= X"f0f0f0f0";
    Bs <= X"12345678";
    wait for 20 ns;


    As <= X"12345678";
    Bs <= X"f0f0f0f0";
    wait for 20 ns;

    wait;
  end process sim_process;

end Behavioral;