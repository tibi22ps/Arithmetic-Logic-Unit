----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2023 09:50:14 PM
-- Design Name: 
-- Module Name: RippleCarrySubtractor - Behavioral
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

entity RippleCarrySubtractor is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           D : out STD_LOGIC_VECTOR (31 downto 0);
           Bout : out STD_LOGIC);
end RippleCarrySubtractor;

architecture Behavioral of RippleCarrySubtractor is

  signal B_2s_comp : std_logic_vector(31 downto 0);
  signal C : std_logic_vector(30 downto 0);

  component FullAdder
    Port (
      A, B, Cin : in  std_logic;
      S, Cout : out std_logic
    );
  end component FullAdder;

begin
  B_2s_comp <= (not B) + "1";
  
  FA0: FullAdder port map (A(0), B_2s_comp(0), '0', D(0), C(0));

  FA1to30: for i in 1 to 30 generate
    FullAdder_inst : FullAdder
      port map (A(i), B_2s_comp(i), C(i-1), D(i), C(i));
  end generate FA1to30;

  FullAdder_inst_31 : FullAdder
    port map (A(31), B_2s_comp(31), C(30), D(31), Bout);


end Behavioral;
