----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/12/2024 09:42:46 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
Port (
        opcode : in STD_LOGIC_VECTOR(3 downto 0);
        --en: in std_logic;
        clk : in STD_LOGIC;
        rst : in std_logic;
        res : out STD_LOGIC_VECTOR(31 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
signal rom1, rom2: STD_LOGIC_VECTOR(31 downto 0);
signal resultout: STD_LOGIC_VECTOR(31 downto 0);
signal romAddr1: std_logic_vector(3 downto 0) := "0000";
signal romAddr2: std_logic_vector(3 downto 0) := romAddr1 + "0001";
signal old_opcode: std_logic_vector(3 downto 0) := "1111";

component ControlUnit is
    Port (
        opcode : in STD_LOGIC_VECTOR(3 downto 0);
        clock : in STD_LOGIC;
        operand1, operand2: in STD_LOGIC_VECTOR(31 downto 0);
        result : out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

component RomMemory is
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
             en : in std_logic;
            clk : in STD_LOGIC;
           dout : out STD_LOGIC_VECTOR (31 downto 0));
end component;


begin

Memory1: RomMemory port map (
        addr => romAddr1, 
        en => '1', 
        clk => clk,
        dout => rom1
    );

Memory2: RomMemory port map (
        addr => romAddr2, 
        en => '1', 
        clk => clk,
        dout => rom2
    );
    
ControlUnit_inst: ControlUnit port map (
            opcode => opcode,
            clock => clk,
            operand1 => rom1,
            operand2 => rom2,
            result => resultout
        );    
        
process(clk, rst)
begin
    if rst='1' then
        romAddr1 <= "0000";
        romAddr2 <= romAddr1 + "0001";
    else
        if rising_edge(clk) then
            if opcode /= old_opcode then
                old_opcode <= opcode;
                end if; 
        --if en='1' then
        romAddr1 <= romAddr1 + "0001";
        romAddr2 <= romAddr2 + "0001"; 
        
        if romAddr2 ="1111" then
            romAddr1 <="0000";
            romAddr2 <="0001";
           end if;
        end if;
    end if;
end process;

res <= resultout;

end Behavioral;


