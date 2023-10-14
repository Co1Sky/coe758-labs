library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Hit_Or_Miss_Check is
	Port (
		CPU_ADD			: in STD_LOGIC_VECTOR(15 downto 0);
		CLK				: in STD_LOGIC;
		HIT_OR_MISS		: out STD_LOGIC);
end Hit_Or_Miss_Check;

architecture Behavioral of Hit_Or_Miss_Check is
	type check_array is array (7 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal check_memorytag : check_array := ((others=> (others=>'0'))); -- Creates check_array and initializes everything to "00000000" --
	
	signal cpu_address : STD_LOGIC_VECTOR(15 downto 0);
	signal cpu_tag : STD_LOGIC_VECTOR (7 downto 0) := cpu_address(15 downto 8);
	signal cpu_index : STD_LOGIC_VECTOR (2 downto 0) := cpu_address(7 downto 5);
	signal cpu_offset : STD_LOGIC_VECTOR (4 downto 0) := cpu_address(4 downto 0);
	
	signal tag_hit : STD_LOGIC;
	
begin
	process(clk)
	begin
		if(clk'Event AND clk='1') then
			if(check_memorytag(to_integer(unsigned(cpu_index))) = cpu_tag) then
				tag_hit <= '1';
			else
				tag_hit <= '0';
			end if;
		end if;	
	end process; 
end Behavioral;

