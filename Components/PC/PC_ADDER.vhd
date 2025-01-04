library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC_ADDER is
    Port (
        input_1 : in STD_LOGIC_VECTOR (31 downto 0);
        output_1 : out STD_LOGIC_VECTOR (31 downto 0)
    );
end PC_ADDER;


architecture Logic_01 of PC_ADDER is
    component adder_signed 
        port(
            input_1 : IN std_logic_vector(31 downto 0);
            input_2 : IN std_logic_vector(31 downto 0);
            output_1 : OUT std_logic_vector(31 downto 0)
        );
    end component;

    --signal adder_Input_1 : std_logic_vector(31 downto 0) := (others => '0');
    signal adder_Output_1 : std_logic_vector(31 downto 0) := ("00000000000000000000000000000100");

    begin

        ADD_Operation : adder_signed
            port map(
                input_1 => input_1,
                input_2 => adder_Output_1,
                output_1 => output_1
            );
end Logic_01;