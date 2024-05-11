----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 03:58:04 AM
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
    
entity ControlUnit is
    Port (
        opcode : in STD_LOGIC_VECTOR(3 downto 0);
        clock : in STD_LOGIC;
        operand1, operand2: in STD_LOGIC_VECTOR(31 downto 0);
        result : out STD_LOGIC_VECTOR(31 downto 0)
    );
end ControlUnit;

architecture Behavioral of ControlUnit is
    signal sum_res,sub_res, mul_res, div_res  : STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
    signal couts, bouts, rst: STD_LOGIC;
    
    component RippleCarryAdder
    Port (A : in  STD_LOGIC_VECTOR (31 downto 0);
          B : in  STD_LOGIC_VECTOR (31 downto 0);
          S:out STD_LOGIC_VECTOR (31 downto 0);
          Cout    : out std_logic
        );
     end component;
     
    component RippleCarrySubtractor
    Port (A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          D : out STD_LOGIC_VECTOR (31 downto 0);
          Bout : out STD_LOGIC);
     end component;
     
component Inmultitor32b 
     Port ( AA : in  STD_LOGIC_VECTOR (15 downto 0);
            BB : in  STD_LOGIC_VECTOR (15 downto 0);
            PP : out  STD_LOGIC_VECTOR (31 downto 0)
            );
     end component;
    
--    component Impartire is
--        port (
--        a, b : in  std_logic_vector(31 downto 0);
--        clk, reset : in std_logic;
--        quotient, remainder : out std_logic_vector(31 downto 0)
--          );
--    end component;
    
begin

Adunare: RippleCarryAdder port map(A=>operand1,B=>operand2,S=>sum_res(31 downto 0), cout=>couts);
Scadere: RippleCarrySubtractor port map(A=>operand1,B=>operand2,D=>sub_res(31 downto 0), bout=>bouts);

Inmultirea: Inmultitor32b port map(AA =>operand1(15 downto 0),BB =>operand2(15 downto 0), PP =>mul_res);
--Impartirea: Impartire port map (a => operand1,b => operand2,clk=>clock, reset=>rst,quotient => div_res(31 downto 0),remainder => operation_remainder);

    process(clock)
    begin
    
        
        if rising_edge(clock) then
                case opcode is
                    when "0000" => result <= sum_res;
                        --adunare
                    when "0001" => result <= sub_res;
                        --scadere
                    when "0010" => result <= mul_res;
                        --inmultire
                   -- when "0011" => result <= div_res(31 downto 16) & operation_remainder(15 downto 0);
                        --impartire
                    when "0100" =>
                        result <= operand1 and operand2;  -- AND
                    when "0101" =>
                        result <= operand1 or operand2;  -- OR
                    when "0110" =>
                       result <= not operand1;  -- NOT
                    when "0111" =>
                        result <= operand1 xor operand2;  -- XOR
                    when "1000" =>
                        result <= operand1(30 downto 0) & "0"; -- Left Shift
                    when "1001" =>
                        result <= "0" & operand1(31 downto 1);  -- Right Shift
                    when "1010" =>
                        result <= operand1 + X"00000001";  -- Increment
                    when "1011" =>
                        result <= operand1 - X"00000001";  -- Decrement
                    when "1100" =>
                        result <= operand1 nand operand2; --Nand
                    when others =>
                        result <= (others => 'X');  -- Unknown opcode
                end case;
            end if;
    end process;


end Behavioral;