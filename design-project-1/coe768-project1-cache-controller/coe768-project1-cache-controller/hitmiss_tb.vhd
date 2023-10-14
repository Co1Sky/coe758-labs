LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY hitmiss_tb IS
END hitmiss_tb;
 
ARCHITECTURE behavior OF hitmiss_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Hit_Or_Miss_Check
    PORT(
         CPU_ADD : IN  std_logic_vector(15 downto 0);
         CLK : IN  std_logic;
         HIT_OR_MISS : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CPU_ADD : std_logic_vector(15 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal HIT_OR_MISS : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Hit_Or_Miss_Check PORT MAP (
          CPU_ADD => CPU_ADD,
          CLK => CLK,
          HIT_OR_MISS => HIT_OR_MISS
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
