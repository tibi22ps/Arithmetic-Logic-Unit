----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/12/2024 07:45:03 PM
-- Design Name: 
-- Module Name: ControlUnit_tb - Behavioral
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

entity ControlUnit_tb is
--  Port ( );
end ControlUnit_tb;

architecture Behavioral of ControlUnit_tb is
    signal clocks: std_logic :='0';
    constant clk_period : time := 10 ns;
    signal opcodes : std_logic_vector(3 downto 0) := "0000";
    signal operand1s, operand2s, results : std_logic_vector(31 downto 0) := (others => '0');
    --signal sum_res, sub_res, mul_res, div_res, operation_remainder : std_logic_vector(31 downto 0);
    
component ControlUnit 
    Port (
         opcode : in STD_LOGIC_VECTOR(3 downto 0);
         clock : in STD_LOGIC;
         operand1, operand2: in STD_LOGIC_VECTOR(31 downto 0);
         result : out STD_LOGIC_VECTOR(31 downto 0)
     );
end component;

begin

    UUT : ControlUnit
        port map (
            opcode => opcodes,
            clock => clocks,
            operand1 => operand1s,
            operand2 => operand2s,
            result => results
        );

     process
     begin
           clocks <= '0';
           wait for clk_period/2;  --for 0.5 ns signal is '0'.
           clocks <= '1';
           wait for clk_period/2;  --for next 0.5 ns signal is '1'.
      end process;

    UC: process
    begin
        wait for 20 ns;

        opcodes <= "0000";  -- sum
        operand1s <= x"00000dc1";
        operand2s <= x"000004c6";
        wait for 20 ns;

        opcodes <= "0001";  -- sub
        --operand1s <= x"00000dc1";
        --operand2s <= x"000004c6";
        wait for 20 ns;

        opcodes <= "0010";  -- mul
        --operand1s <= x"12341224";
        --operand2s <= x"12341234";
        wait for 20 ns;
        
        --opcode <= "0011";  -- div
        --operand1 <= x"12341224";
        --operand2 <= x"12341234";
        --wait for 20 ns;

        opcodes <= "0100";  -- and
        --operand1s <= x"56ad101c";
        --operand2s <= x"10040286";
        wait for 20 ns;
        
        opcodes <= "0101";  -- or
        --operand1s <= x"124578a1";
        --operand2s <= x"1008911b";
        wait for 20 ns;
        
        opcodes <= "0110";  -- not
        --operand1s <= x"01234567";
        --operand2s <= x"10000000";
        wait for 20 ns;
        
        opcodes <= "0111";  -- xor
        --operand1s <= x"11111111";
        --operand2s <= x"10000000";
        wait for 20 ns;
        
        opcodes <= "1000";  -- left shift
        --operand1s <= x"0fffffff";
        --operand2s <= x"10002300";
        wait for 20 ns;
       
        opcodes <= "1001";  -- right shift
        --operand1s <= x"0fffffff";
        --operand2s <= x"10002300";
        wait for 20 ns;
        
        opcodes <= "1010";  -- inc
        --operand1s <= x"0ffffffe";
        --operand2s <= x"10002300";
        wait for 20 ns;

        opcodes <= "1011";  -- dec
        --operand1s <= x"ffffffff";
        --operand2s <= x"10002300";
        wait for 20 ns;        
        
        opcodes <="1100";  --nand
        --operand1s <=x"10010011";
        --operand2s <=x"01101100";
        wait for 20 ns;
        
        operand1s <= x"000004c6";
        
                opcodes <= "1000";  -- left shift
                --operand1s <= x"0fffffff";
                --operand2s <= x"10002300";
                wait for 20 ns;
               
                opcodes <= "1001";  -- right shift
                --operand1s <= x"0fffffff";
                --operand2s <= x"10002300";
                wait for 20 ns;
                
                opcodes <= "1010";  -- inc
                --operand1s <= x"0ffffffe";
                --operand2s <= x"10002300";
                wait for 20 ns;
        
                opcodes <= "1011";  -- dec
                --operand1s <= x"ffffffff";
                --operand2s <= x"10002300";
                wait for 20 ns;        
                
                opcodes <="1100";  --nand
                --operand1s <=x"10010011";
                --operand2s <=x"01101100";
                wait for 20 ns;
                opcodes <= "0110";  -- not
        
        wait;
    end process;

end Behavioral;