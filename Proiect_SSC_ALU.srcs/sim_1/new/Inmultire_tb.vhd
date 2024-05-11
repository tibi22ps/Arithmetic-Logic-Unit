----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2023 01:40:28 AM
-- Design Name: 
-- Module Name: Inmultire_tb - Behavioral
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

entity Inmultire_tb is
--  Port ( );
end Inmultire_tb;

architecture Behavioral of Inmultire_tb is
    signal A, B : std_logic_vector(7 downto 0);
    signal P : std_logic_vector(15 downto 0);

    component Inmultire
        port (
            A : in  STD_LOGIC_VECTOR (7 downto 0);
            B : in  STD_LOGIC_VECTOR (7 downto 0);
            P : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

begin
    UUT : Inmultire port map(A, B, P);

    sim_process: process
    begin
        A <= (others => '0');
        B <= (others => '0');
        wait for 20 ns;
        A <= "10101010";
        B <= "11001100";
        wait for 20 ns;

        A <= "11110000";
        B <= "00001111";
        wait for 20 ns;

        A <= "01010101";
        B <= "01010101";
        
        wait for 20 ns;
        A <= "11111111";
        B <= "11111111";
        
        wait;
    end process sim_process;

end Behavioral;
