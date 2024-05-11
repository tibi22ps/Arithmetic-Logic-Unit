----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 01:32:07 AM
-- Design Name: 
-- Module Name: InmultireSim - Behavioral
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

entity Inmultire_tb is
end Inmultire_tb;

architecture testbench of Inmultire_tb is
    signal A, B, M : std_logic_vector(63 downto 0);
    signal CLK, START : STD_LOGIC := '0';
    constant clk_period : time := 1 ns;
    
  
    component Inmultire
        Port (
            A, B : in std_logic_vector(31 downto 0);
            M : out std_logic_vector(63 downto 0);
            CLK : in STD_LOGIC;
            START : in STD_LOGIC
        );
    end component;

begin
    
    uut: Inmultire
        port map (
            A => A(31 downto 0),
            B => B(31 downto 0),
            M => M,
            CLK => CLK,
            START => START
        );

    process
    begin
        CLK <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        CLK <= '1';
        wait for clk_period/2;
    end process;

    process
    begin
        wait for 10 ns; 

        A <= X"12345678";
        B <= X"12345678";
        START <= '1'; 
        wait for 50 ns; 
        START <= '0'; 
        
        A <= X"aaaaaaaa";
        B <= X"cccccccc";
        START <= '1'; 
        wait for 50 ns; 
        START <= '0';

        A <= X"FFFFFFFF";
        B <= X"FFFFFFFF";
        START <= '1'; 
        wait for 50 ns;
        START <= '0'; 
        wait;
    end process;

end testbench;
