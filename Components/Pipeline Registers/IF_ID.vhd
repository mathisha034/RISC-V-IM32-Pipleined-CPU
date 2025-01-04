library ieee;
use ieee.std_logic_1164.all;


entity IF_ID_Register is
    port(
        -- inputs
            --Data - for registers
        Instruction_in : in std_logic_vector(31 downto 0);
        PC_value_in    : in std_logic_vector(31 downto 0);
        PC_plus_4_in   : in std_logic_vector(31 downto 0);
            --Control
        clock      : in std_logic;
        Reset      : in std_logic;

        -- outputs
        Instruction_out : out std_logic_vector(31 downto 0);
        PC_value_out    : out std_logic_vector(31 downto 0);
        PC_plus_4_out   : out std_logic_vector(31 downto 0)

    );


end entity IF_ID_Register;

--architecture Logic_1 of IF_ID_Register is

    -- begin 

        -- Here it was assumed that the input values will not change during the clock cycle
        -- Because this process needs to run several times in a clock cycle to update the output values
        -- process(clock, Instruction_in, PC_value_in, PC_plus_4_in)
        -- -- Registers
        -- variable Instruction_Reg : std_logic_vector(31 downto 0);
        -- variable PC_value_Reg    : std_logic_vector(31 downto 0);
        -- variable PC_plus_4_Reg   : std_logic_vector(31 downto 0);

        --     begin
        --         if rising_edge(clock) then
        --             if Reset = '1' then
        --                 Instruction_Reg := (others => '0');
        --                 PC_value_Reg    := (others => '0');
        --                 PC_plus_4_Reg   := (others => '0');
        --             else
        --                 Instruction_Reg := Instruction_in;
        --                 PC_value_Reg    := PC_value_in;
        --                 PC_plus_4_Reg   := PC_plus_4_in;
        --             end if;

        --         end if;

        --         Instruction_out <= Instruction_Reg;
        --         PC_value_out    <= PC_value_Reg;
        --         PC_plus_4_out   <= PC_plus_4_Reg;

        -- end process;
--end architecture Logic_1;

architecture Logic_2 of IF_ID_Register is

        -- Internal registers to store values
    signal Instruction_Reg : std_logic_vector(31 downto 0) := (others => '0');
    signal PC_value_Reg    : std_logic_vector(31 downto 0) := (others => '0');
    signal PC_plus_4_Reg   : std_logic_vector(31 downto 0) := (others => '0');

    begin
        process(clock, Instruction_in, PC_value_in, PC_plus_4_in)
        begin
            if rising_edge(clock) then
                if Reset = '1' then
                    -- Reset the registers
                    Instruction_Reg <= (others => '0');
                    PC_value_Reg    <= (others => '0');
                    PC_plus_4_Reg   <= (others => '0');
                else
                    -- Update the registers with input values
                    Instruction_Reg <= Instruction_in;
                    PC_value_Reg    <= PC_value_in;
                    PC_plus_4_Reg   <= PC_plus_4_in;
                end if;
            end if;
        end process;

    -- Outputs directly connected to the registers
    Instruction_out <= Instruction_Reg;
    PC_value_out    <= PC_value_Reg;
    PC_plus_4_out   <= PC_plus_4_Reg;

end architecture Logic_2;


        