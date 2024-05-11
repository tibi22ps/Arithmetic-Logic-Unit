----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2023 09:00:24 PM
-- Design Name: 
-- Module Name: RippleCarryAdder - Behavioral
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

entity RippleCarryAdder is
  Port (
  A, B    : in  std_logic_vector(31 downto 0);
  S       : out std_logic_vector(31 downto 0);
  Cout    : out std_logic
);
end RippleCarryAdder;

architecture Behavioral of RippleCarryAdder is
  signal C : std_logic_vector(30 downto 0);


  component FullAdder
    Port (
      A, B, Cin : in  std_logic;
      S, Cout : out std_logic
    );
  end component FullAdder;

begin
  FA0: FullAdder port map (A(0), B(0), '0', S(0), C(0));

  FA1to30: for i in 1 to 30 generate
    FullAdder_inst : FullAdder
      port map (A(i), B(i), C(i-1), S(i), C(i));
  end generate FA1to30;

  FullAdder_inst_31 : FullAdder
    port map (A(31), B(31), C(30), S(31), Cout);

end Behavioral;
