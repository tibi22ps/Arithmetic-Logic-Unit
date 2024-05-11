----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2023 03:08:19 AM
-- Design Name: 
-- Module Name: RomMemory_tb - Behavioral
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

entity RomMemory_tb is
end RomMemory_tb;

architecture Behavioral of RomMemory_tb is
    signal addr_tb : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal en_tb : STD_LOGIC := '1'; 
    signal clk_tb : STD_LOGIC:='0';
    signal dout_tb : STD_LOGIC_VECTOR(31 downto 0);
    constant clk_period : time := 1 ns;

    component RomMemory
        Port ( addr : in STD_LOGIC_VECTOR(3 downto 0);
               en : in std_logic;
               clk : in STD_LOGIC;
               dout : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

begin
    UUT: RomMemory port map (
    addr => addr_tb,
    en => en_tb,
    clk => clk_tb,
    dout => dout_tb
);

    clk_process: process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;

    stimulus_process: process
    begin
        en_tb<='1';
        addr_tb <= "0000";
        wait for 20 ns;
        en_tb<='0';
        
        wait for 10 ns; 
        
        en_tb<='1';
        addr_tb <= "0010";
        wait for 20 ns;
        en_tb<='0';

        wait for 10 ns; 
        
        en_tb<='1';
        addr_tb <= "1000";
        wait for 20 ns;
        en_tb<='0';
        
        wait for 10 ns; 
        
        addr_tb<= "0100";
        wait;
    end process;

end Behavioral;
