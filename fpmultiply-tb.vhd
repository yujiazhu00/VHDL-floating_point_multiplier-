LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity fpmultiply_tb is
end entity;

architecture fpmultiply_tb_arch of fpmultiply_tb is

component fpmultiply
port (a,b: in STD_LOGIC_VECTOR(31 downto 0);
m: out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal a_tb, b_tb: STD_LOGIC_VECTOR(31 downto 0);
signal m_tb: STD_LOGIC_VECTOR(31 downto 0);

begin

DUT1:  fpmultiply port map(a => a_tb,
b => b_tb,
m => m_tb);

STIM: process

begin

a_tb <= std_logic_vector'("01000000001000000000000000000000");
b_tb <= std_logic_vector'("00111111110000000000000000000000");
wait for 2 ns;

end process;
end architecture;
