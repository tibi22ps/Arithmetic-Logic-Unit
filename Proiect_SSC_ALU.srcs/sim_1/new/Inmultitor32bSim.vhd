----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2023 12:51:51 AM
-- Design Name: 
-- Module Name: Inmultitor32bSim - Behavioral
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

entity Inmultitor32bSim is
--  Port ( );
end Inmultitor32bSim;

architecture Behavioral of Inmultitor32bSim is
signal AA,BB : std_logic_vector(15 downto 0);
signal PP : std_logic_vector(31 downto 0);

component Inmultitor32b 
Port ( AA : in  STD_LOGIC_VECTOR (15 downto 0);
       BB : in  STD_LOGIC_VECTOR (15 downto 0);
       PP : out  STD_LOGIC_VECTOR (31 downto 0)
       );
end component;

begin
UUT: Inmultitor32b port map(AA, BB, PP);
    
sim_process :process
   begin
		AA<="1111111111111111";
		BB<="1111000011110000";

        wait for 20 ns;
		AA<="1111111111111111";
		BB<="1111111111111111";
		
		wait for 20 ns;
		AA<="1111111111111111";
		BB<="0000000000000001";
		
		wait for 20 ns;
	    AA<="0001001000110100";
        BB<="0001001000110100";
        
        wait for 20 ns;
        AA<="1010101010101010";
        BB<="0000000000000000";

      wait;
end process sim_process;

end Behavioral;
