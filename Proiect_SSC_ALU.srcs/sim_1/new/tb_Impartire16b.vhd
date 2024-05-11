----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 07:42:23 PM
-- Design Name: 
-- Module Name: tb_Impartire16b - Behavioral
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

entity tb_Impartire16b is
--  Port ( );
end tb_Impartire16b;

architecture Behavioral of tb_Impartire16b is

 signal A,Q : STD_LOGIC_VECTOR(15 downto 0);
 signal B,R : STD_LOGIC_VECTOR(7 downto 0);


    component Impartire16b is
        port (
            A : in  STD_LOGIC_VECTOR (15 downto 0);
            B : in  STD_LOGIC_VECTOR (7 downto 0);
            Q : out STD_LOGIC_VECTOR (15 downto 0);
            R : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

begin
    DUT: Impartire16b port map (A => A, B => B, Q => Q, R => R);

    stimulus: process
    begin
        -- Test case 1: A = 16#1234#, B = 16#12#, Expected Q = 16#10#, R = 16#4#
        A <= "0001001000110100";
        B <= "00010010";
        wait for 10 ns;

        -- Test case 2: A = 16#ABCD#, B = 16#34#, Expected Q = 16#429#, R = 16#29#
        A <= "1010101111001101";
        B <= "00110100";
        wait for 10 ns;

        -- Add more test cases as needed

        wait;
    end process;

end Behavioral;
