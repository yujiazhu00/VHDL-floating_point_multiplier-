library IEEE;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity fpmultiply is
port (a,b: in STD_LOGIC_VECTOR(31 downto 0);
m: out STD_LOGIC_VECTOR(31 downto 0));

end entity;

architecture arch_fpmultiply of fpmultiply is

signal expa, expb: STD_LOGIC_VECTOR(7 downto 0);
signal manta, mantb: STD_LOGIC_VECTOR(23 downto 0);
signal mantm: UNSIGNED(47 downto 0);
signal expm: UNSIGNED(7 downto 0);

signal expmF: UNSIGNED(7 downto 0);
signal mantF: UNSIGNED(22 downto 0);

begin

expa <= a(30 downto 23);
expb <= b(30 downto 23);
manta <= '1' & a(22 downto 0);
mantb <= '1' & b(22 downto 0);

mantm <= unsigned(manta) * unsigned(mantb);
expm <= unsigned(expa) + unsigned(expb);

expmF <= (unsigned(expm) - to_unsigned(126,8)) when (mantm(47) = '1') else (unsigned(expm)-to_unsigned(127,8));

mantF <= mantm(46 downto 24) when (mantm(47) = '1') else mantm(45 downto 23);

m <= '0' & std_logic_vector(expmF) & std_logic_vector(mantF);

end architecture;
