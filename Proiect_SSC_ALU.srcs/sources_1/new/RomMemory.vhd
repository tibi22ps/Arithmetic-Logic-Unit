----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 04:00:45 AM
-- Design Name: 
-- Module Name: RomMemory - Behavioral
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

entity RomMemory is
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
             en : in std_logic;
            clk : in STD_LOGIC;
           dout : out STD_LOGIC_VECTOR (31 downto 0));
end RomMemory;

architecture Behavioral of RomMemory is
type ROM_type is array (0 to 15) of STD_LOGIC_VECTOR(31 downto 0);
    constant ROM_data : ROM_type := (
        x"00000001", --1
        x"00000006", --6
        x"00000002", --2
        x"0000000A", --10
        x"0000000F", --15
        x"00000007", --7
        x"00000009", --9
        x"00000004", --4
        x"00000003", --3
        x"00000005", --5
        x"00000010", --16
        x"00000011", --17 
        x"00000dc8", --8
        x"0000000b", --11 
        x"0000000d", --13
        others => X"00000000");
        
        signal reg_dout : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
    process(clk, addr)
    begin
        if rising_edge(clk) then
            if en='1' then   
                reg_dout <= ROM_data(conv_integer(unsigned(addr)));                
            end if;
        end if;
    end process;
    dout <= reg_dout;
end Behavioral;
