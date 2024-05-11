----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 04:26:24 AM
-- Design Name: 
-- Module Name: SSDNexys - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSDNexys is
Port 
(
signal digits: in std_logic_vector(31 downto 0);
signal clk: in std_logic;
signal an:out std_logic_vector(7 downto 0);
signal cat:out std_logic_vector(6 downto 0)
 );
end SSDNexys;

architecture Behavioral of SSDNexys is
    signal hex_digits : std_logic_vector(31 downto 0);
    signal an_counter : std_logic_vector(2 downto 0) := "000";
begin

process(clk)
begin
if clk='1' and clk'event then
   hex_digits <= digits;
   an_counter <= an_counter + 1;
  end if;
end process;

process(an_counter)
    begin
        case an_counter is
            when "000" =>
                cat <= hex_digits(3 downto 0);
                an <= "11111110";
            when "001" =>
                cat <= hex_digits(7 downto 4);
                an <= "11111101";
            when "010" =>
                cat <= hex_digits(11 downto 8);
                an <= "11111011";
            when "011" =>
                cat <= hex_digits(15 downto 12);
                an <= "11110111";
            when "100" =>
                cat <= hex_digits(19 downto 16);
                an <= "11101111";
            when "101" =>
                cat <= hex_digits(23 downto 20);
                an <= "11011111";
            when "110" =>
                cat <= hex_digits(27 downto 24);
                an <= "10111111";
            when "111" =>
                cat <= hex_digits(31 downto 28);
                an <= "01111111";
            when others =>
                cat <= (others => 'X');
                an <= (others => 'X');
    end case;
end process;

end Behavioral;

