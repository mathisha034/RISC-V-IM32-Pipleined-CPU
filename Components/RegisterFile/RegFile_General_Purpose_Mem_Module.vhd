-- Memory Module for General Purpose Registers
-- This will be implemented in the Register File
-- This will be a 32x32 memory module
-- Therefore this will only have 2 input streams and 1 output stream


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity General_Purpose_Mem_Module is
    port(
        ReadRegister1 : in std_logic_vector(31 downto 0);
        ReadRegister2 : in std_logic_vector(31 downto 0);
        WriteAddress  : in std_logic_vector(31 downto 0);
        WriteData     : in std_logic_vector(31 downto 0);
        ReadData_1      : out std_logic_vector(31 downto 0);
        ReadData_2      : out std_logic_vector(31 downto 0);

        Clock         : in std_logic;
        Reset         : in std_logic;
        WriteEnable   : in std_logic


    );

end General_Purpose_Mem_Module;


architecture logic_1 of General_Purpose_Mem_Module is

    -- Declaration of memory array type
    type gen_reg_array is array(0 to 31) of std_logic_vector(31 downto 0);

    begin

    

    process(Clock , Reset, ReadRegister1, ReadRegister2)

        variable general_purpose_registers : gen_reg_array :=(
            0 => X"00000000",
            -- initialize all other registers to 32 X's
            others => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        );

    begin

        ReadData_1 <= general_purpose_registers(to_integer(unsigned(ReadRegister1)));
        ReadData_2 <= general_purpose_registers(to_integer(unsigned(ReadRegister2)));
        
        if rising_edge(Clock) then

            if Reset = '1' then
                general_purpose_registers := (
                    0 => X"00000000",
                    others => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
                );

            end if;

            if WriteEnable = '1' then
                general_purpose_registers(to_integer(unsigned(WriteAddress))) := WriteData;
            end if;
        end if;

    end process;

end logic_1;
    


        