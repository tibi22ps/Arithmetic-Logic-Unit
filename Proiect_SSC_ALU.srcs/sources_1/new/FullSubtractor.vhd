----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 07:29:13 PM
-- Design Name: 
-- Module Name: FullSubtractor - Behavioral
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

entity FullSubtractor is
port( A, B, Bin : in std_logic;
Diff, Bout : out std_logic);
end FullSubtractor;

architecture Behavioral of FullSubtractor is

begin
Diff <= (A xor B) xor Bin;
Bout <= ((not A) and (B or Bin)) or (B and Bin);

end Behavioral;
