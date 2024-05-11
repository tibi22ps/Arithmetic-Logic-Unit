----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/12/2024 11:14:44 PM
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity ALU_tb is
--  Port ( );
end ALU_tb;


architecture Behavioral of ALU_tb is
    signal clk_tb : STD_LOGIC := '0';
    signal rst_tb : STD_LOGIC := '0';
    signal opcode_tb : STD_LOGIC_VECTOR(3 downto 0):="0000";
    signal res_tb : STD_LOGIC_VECTOR(31 downto 0);
    --signal en_tb: std_logic:='0';
    

    constant clk_period : time := 10 ns;

begin

    UUT: entity work.ALU
        port map (
            opcode => opcode_tb,
            --en => '1',
            clk => clk_tb,
            rst => rst_tb,
            res => res_tb
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
        wait for 10 ns; 

    
        opcode_tb <= "0000";
        wait for 10 ns;
        
        
        opcode_tb <= "0001";
        wait for 10 ns;
        

        opcode_tb <= "0010";
        wait for 10 ns;

        
        opcode_tb <= "0100";
        wait for 10 ns;
        
        
        opcode_tb <= "0101";
        wait for 10 ns;
        

        opcode_tb <= "0110";
        wait for 10 ns;
        
        
        opcode_tb <= "0111";
        wait for 10 ns;
        
                
        opcode_tb <= "1000";
        wait for 10 ns;
    
                
        opcode_tb <= "1001";
        wait for 10 ns;      

            
        opcode_tb <= "1010";
        wait for 10 ns;
        
                        
        opcode_tb <= "1011";
        wait for 10 ns;

                
        opcode_tb <= "1100";
        --wait for 10 ns;
    end process;

end Behavioral;
