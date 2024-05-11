----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 07:22:21 PM
-- Design Name: 
-- Module Name: Impartitor16b - Behavioral
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

entity Impartire16b is
    port (
        A : in  STD_LOGIC_VECTOR (15 downto 0);
        B : in  STD_LOGIC_VECTOR (7 downto 0);
        Q : out STD_LOGIC_VECTOR (15 downto 0);
        R : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Impartire16b;

architecture behavioral of Impartire16b is
    component FullSubtractor is
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Bin  : in  STD_LOGIC;
            Diff : out STD_LOGIC;
            Bout : out STD_LOGIC
        );
    end component;

    signal A_shifted   : STD_LOGIC_VECTOR(23 downto 0);
    signal Q_temp      : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal R_temp      : STD_LOGIC_VECTOR(7 downto 0)  := (others => '0');
    signal borrow      : STD_LOGIC := '0';

begin
    -- Ini?ializare A_shifted cu A ?i Q_temp cu 0
    A_shifted <= A & "00000000";

    -- Procesul principal de împ?r?ire
    divide_process: for i in 15 downto 0 generate
        -- Shiftare la stânga A_shifted ?i Q_temp
        A_shifted <= A_shifted(22 downto 0) & '0';
        Q_temp    <= Q_temp(14 downto 0) & '0';

        -- Ad?ugare bitul curent al lui A la Q_temp
        Q_temp(0) <= A_shifted(23);

        -- Sc?dere între Q_temp ?i B
        subtractor: for j in 7 downto 0 generate
            f_sub: FullSubtractor port map(Q_temp(j), B(j), borrow, Q_temp(j), borrow);
        end generate;

        -- Ad?ugare rest la A_shifted
        A_shifted(23) <= not borrow;

        -- Shiftare la stânga R_temp ?i ad?ugare la R_temp a restului
        R_temp <= R_temp(6 downto 0) & borrow;

        -- Resetare borrow
        borrow <= '0';
    end generate;

    -- Rezultatele finale
    Q <= Q_temp;
    R <= R_temp;

end behavioral;

