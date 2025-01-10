library ieee;
use ieee.std_logic_1164.all;

-- Inputs with 32 bits wide
entity multiplexter32to1 is
    port(
        input_1 : IN std_logic_vector(31 downto 0);
        input_2 : IN std_logic_vector(31 downto 0);
        input_3 : IN std_logic_vector(31 downto 0);
        input_4 : IN std_logic_vector(31 downto 0);
        input_5 : IN std_logic_vector(31 downto 0);
        input_6 : IN std_logic_vector(31 downto 0);
        input_7 : IN std_logic_vector(31 downto 0);
        input_8 : IN std_logic_vector(31 downto 0);
        input_9 : IN std_logic_vector(31 downto 0);
        input_10 : IN std_logic_vector(31 downto 0);
        input_11 : IN std_logic_vector(31 downto 0);
        input_12 : IN std_logic_vector(31 downto 0);
        input_13 : IN std_logic_vector(31 downto 0);
        input_14 : IN std_logic_vector(31 downto 0);
        input_15 : IN std_logic_vector(31 downto 0);
        input_16 : IN std_logic_vector(31 downto 0);
        input_17 : IN std_logic_vector(31 downto 0);
        input_18 : IN std_logic_vector(31 downto 0);
        select_bus : IN std_logic_vector(4 downto 0);
        output_1 : OUT std_logic_vector(31 downto 0)
    );
end entity multiplexter32to1;


architecture multiplexer32To1_Architecture of multiplexter32to1 is
    begin
        process(select_bus, input_1, input_2, input_3, input_4, input_5, input_6, input_7, input_8, input_9, input_10, input_11, input_12, input_13, input_14, input_15, input_16, input_17, input_18, input_19, input_20, input_21, input_22, input_23, input_24, input_25, input_26, input_27, input_28, input_29, input_30, input_31, input_32)
        begin
            case select_bus is
                when "00000" =>
                    output_1 <= input_1;
                when "00001" =>
                    output_1 <= input_2;
                when "00010" =>
                    output_1 <= input_3;
                when "00011" =>
                    output_1 <= input_4;
                when "00100" =>
                    output_1 <= input_5;
                when "00101" =>
                    output_1 <= input_6;
                when "00110" =>
                    output_1 <= input_7;
                when "00111" =>
                    output_1 <= input_8;
                when "01000" =>
                    output_1 <= input_9;
                when "01001" =>
                    output_1 <= input_10;
                when "01010" =>
                    output_1 <= input_11;
                when "01011" =>
                    output_1 <= input_12;
                when "01100" =>
                    output_1 <= input_13;
                when "01101" =>
                    output_1 <= input_14;
                when "01110" =>
                    output_1 <= input_15;
                when "01111" =>
                    output_1 <= input_16;
                when "10000" =>
                    output_1 <= input_17;
                when "10001" =>
                    output_1 <= input_18;
                when "10010" =>
                    output_1 <= input_19;
                when "10011" =>
                    output_1 <= input_20;
                when "10100" =>
                    output_1 <= input_21;
                when "10101" =>
                    output_1 <= input_22;
                when "10110" =>
                    output_1 <= input_23;
                when "10111" =>
                    output_1 <= input_24;
                when "11000" =>
                    output_1 <= input_25;
                when "11001" =>
                    output_1 <= input_26;
                when "11010" =>
                    output_1 <= input_27;
                when "11011" =>
                    output_1 <= input_28;
                when "11100" =>
                    output_1 <= input_29;
                when "11101" =>
                    output_1 <= input_30;
                when "11110" =>
                    output_1 <= input_31;
                when "11111" =>
                    output_1 <= input_32;
                when others =>
                    output_1 <= (others => '0');
            end case;
        end process;
end architecture multiplexer32To1_Architecture;