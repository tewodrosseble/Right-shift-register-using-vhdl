library ieee;
use ieee.std_logic_1164.all;

entity shiftregistervhdl is port (
d : in std_logic;
clk : in std_logic;
reset : in std_logic;
q : out std_logic);
end entity;

architecture behaviour of shiftregistervhdl is 
signal r_reg : std_logic_vector(3 downto 0);
signal r_next : std_logic_vector(3 downto 0);
begin 

process (reset, clk)
begin 
-- D flip flop
if (reset = '1') then 
r_reg <= (others => '0');

elsif clk'event and clk = '1' then 
r_reg <= r_next;
end if;
end process;

--next state logic 
r_next <= d & r_reg(3 downto 1);

--output logic 
q <= r_reg(0);
end behaviour;