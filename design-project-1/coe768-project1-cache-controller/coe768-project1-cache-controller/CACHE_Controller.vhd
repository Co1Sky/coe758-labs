library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Cache_Controller is
	Port (
			-- Input --
			CLK				: in STD_LOGIC;
			ADD				: in STD_LOGIC_VECTOR(15 downto 0);
			WR_RD			: in STD_LOGIC;
			CS				: in STD_LOGIC;
			-- Output --
			SD_ADD			: out STD_LOGIC_VECTOR(15 downto 0);
			SD_WR_RD		: out STD_LOGIC;
			SD_MSTRB		: out STD_LOGIC;
			S_DOUT_E		: out STD_LOGIC;
			S_DIN_E			: out STD_LOGIC;
			S_WE			: out STD_LOGIC;
			S_ADD			: out STD_LOGIC_VECTOR(7 downto 0));
end Cache_Controller;

architecture Behavioral of Cache_Controller is

	Component Hit_Or_Miss_Check
	Port (
		CPU_ADD			: in STD_LOGIC_VECTOR(15 downto 0);
		CLK				: in STD_LOGIC;
		HIT_OR_MISS		: out STD_LOGIC);
	end Component;
	
	signal cache_hit : STD_LOGIC;
	
begin


end Behavioral;

