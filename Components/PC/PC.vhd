library ieee;
use ieee.std_logic_1164.all;


entity PC is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           input_Address : in STD_LOGIC_VECTOR (31 downto 0);
           output_Address : out STD_LOGIC_VECTOR (31 downto 0));
end PC;



architecture Logic_01 of PC is
    --signal PC_reg , PC_input : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

    begin
        process(clk, reset)
        begin
            if reset = '1' then
                output_Address  <= (others => '0');
            elsif rising_edge(clk) then
                output_Address  <= input_Address;
            end if;
        end process;

end Logic_01;


