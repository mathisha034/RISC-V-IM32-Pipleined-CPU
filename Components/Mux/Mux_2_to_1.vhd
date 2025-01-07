library ieee;
use ieee.std_logic_1164.all;


entity Mux_2_to_1 is
    port(
        -- inputs
        input_1 : in std_logic_vector(31 downto 0);
        input_2 : in std_logic_vector(31 downto 0);
        select_bit  : in std_logic;

        -- outputs
        output  : out std_logic_vector(31 downto 0)
    );
end entity Mux_2_to_1;


architecture Logic_1 of Mux_2_to_1 is
begin
    process(input_1, input_2, select_bit)
    begin
        if select_bit = '0' then
            output <= input_1;
        else
            output <= input_2;
        end if;
    end process;
end architecture Logic_1;