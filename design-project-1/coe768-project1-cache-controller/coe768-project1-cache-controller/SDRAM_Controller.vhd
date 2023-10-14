library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SDRAM_Controller is
    Port ( 
			-- Input --
			clk			: in STD_LOGIC;
			add 		: in STD_LOGIC_VECTOR (15 downto 0);
			wr_rd 		: in STD_LOGIC;
			memstrb 	: in STD_LOGIC;
			din 		: in STD_LOGIC_VECTOR (7 downto 0);
			-- Output from Cache Controller --
			dout		: out STD_LOGIC_VECTOR (7 downto 0)
		 );
end SDRAM_Controller;

architecture Behavioral of SDRAM_Controller is
    type ramemory is array (7 downto 0, 31 downto 0) of std_logic_vector(7 downto 0);
    
	signal RAM_SIG: ramemory; 
	signal counter : integer := 0;
	
begin

process (CLK)
    begin
        if CLK'event and CLK = '1' then		  
				if counter = 0 then
					for I in 0 to 7 loop
						for J in 0 to 31 loop
							RAM_SIG(i,j) <= "11110000";
						end loop;
					end loop;
					counter <= 1;	
				end if;
				
				if memstrb = '1' then
					if wr_rd = '1' then
						RAM_SIG(to_integer(unsigned(add(7 downto 5))),to_integer(unsigned(add(4 downto 0)))) <= din;    
               ELSE
						dout <= RAM_SIG(to_integer(unsigned(add(7 downto 5))),to_integer(unsigned(add(4 downto 0))));
					end if;
				end if;
        end if;
    end process;


end Behavioral;