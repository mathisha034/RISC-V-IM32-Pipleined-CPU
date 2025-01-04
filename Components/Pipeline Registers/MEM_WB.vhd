library ieee;
use ieee.std_logic_1164.all;

entity MEM_WB_Register is
    port(
        -- inputs
            --Data - for registers
        RD_in          : in std_logic_vector(31 downto 0);
        MemResult_in   : in std_logic_vector(31 downto 0);
        ALU_result_in  : in std_logic_vector(31 downto 0);

            --Control unit inputs
        RegWrite_in   : in std_logic;
        Mux_3_IR_type_in : in std_logic;

        -- Control signals
        Clock      : in std_logic;
        Reset      : in std_logic;

        -- outputs
        RD_out          : out std_logic_vector(31 downto 0);
        MemResult_out   : out std_logic_vector(31 downto 0);
        ALU_result_out  : out std_logic_vector(31 downto 0);

            --Control unit outputs
        RegWrite_out   : out std_logic;
        Mux_3_IR_type_out : out std_logic

    );

end entity MEM_WB_Register;

architecture Logic_02 of MEM_WB_Register is

    --Registers
    signal RD_Reg          : std_logic_vector(31 downto 0);
    signal MemResult_Reg   : std_logic_vector(31 downto 0);
    signal ALU_result_Reg  : std_logic_vector(31 downto 0);

    signal RegWrite_Reg   : std_logic;
    signal Mux_3_IR_type_Reg : std_logic;

    begin

        process(Clock, RD_in, MemResult_in, ALU_result_in, RegWrite_in, Mux_3_IR_type_in)
        begin
            if rising_edge(Clock) then
                if(Reset = '1') then
                    RD_Reg <= (others => '0');
                    MemResult_Reg <= (others => '0');
                    ALU_result_Reg <= (others => '0');
                    RegWrite_Reg <= '0';
                    Mux_3_IR_type_Reg <= '0';
                else
                    RD_Reg <= RD_in;
                    MemResult_Reg <= MemResult_in;
                    ALU_result_Reg <= ALU_result_in;
                    RegWrite_Reg <= RegWrite_in;
                    Mux_3_IR_type_Reg <= Mux_3_IR_type_in;
                end if;
            end if;
        end process;

        RD_out <= RD_Reg;
        MemResult_out <= MemResult_Reg;
        ALU_result_out <= ALU_result_Reg;

        RegWrite_out <= RegWrite_Reg;
        Mux_3_IR_type_out <= Mux_3_IR_type_Reg;

end architecture Logic_02;