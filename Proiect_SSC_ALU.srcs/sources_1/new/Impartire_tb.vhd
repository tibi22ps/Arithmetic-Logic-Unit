----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/12/2024 04:15:58 AM
-- Design Name: 
-- Module Name: Impartire_tb - Behavioral
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

entity Impartire_tb is
--  Port ( );
end Impartire_tb;

architecture sim of Impartire_tb is
    signal reset : std_logic := '0';
    signal clk : std_logic := '0';
    constant clk_period : time := 10 ns;
    signal a, b : std_logic_vector(31 downto 0) := (others => '0');
    signal quotient, remainder : std_logic_vector(31 downto 0);

    component Impartire
        Port (
            a, b : in  std_logic_vector(31 downto 0);
            clk, reset : in std_logic;
            quotient, remainder : out std_logic_vector(31 downto 0)
        );
    end component;

begin
    UUT: Impartire
        port map (
            a => a,
            b => b,
            clk => clk,
            reset => reset,
            quotient => quotient,
            remainder => remainder
        );

    CLK_PROCESS: process
     begin
           clk <= '0';
           wait for clk_period/2;  --for 0.5 ns signal is '0'.
           clk <= '1';
           wait for clk_period/2;  --for next 0.5 ns signal is '1'.
      end process;

    STIMULUS_PROCESS: process
    begin
        wait for 10 ns;
        a <= x"8F1A2B3C";  
        b <= x"00000008";  
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;
        a <= x"01000000";  
        b <= x"00000001";
        reset <= '1';
        wait for 10 ns;
        reset <= '0'; 
        wait for 10 ns;
        a <= x"01000000";  
        b <= x"00000001"; 
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;
        a <= x"ABC00000";  
        b <= x"ABC00000";
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;
        a <= x"ABCD1234";  
        b <= x"00000000";
        reset <= '1';
        wait for 10 ns;
        reset <= '0'; 
        wait for 10 ns;
        a <= x"12345678";  
        b <= x"12345679";         
        wait;
    end process;

end sim;