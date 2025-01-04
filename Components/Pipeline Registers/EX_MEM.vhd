library ieee;
use ieee.std_logic_1164.all;


entity EX_MEM_Register is
    port(
        -- inputs
            --Data - for registers
        RD_in          : in std_logic_vector(31 downto 0);
        Func3_in       : in std_logic_vector(2 downto 0);
        MemData_in     : in std_logic_vector(31 downto 0);
        ALU_result_in  : in std_logic_vector(31 downto 0);

            --Control unit inputs
        RegWrite_in   : in std_logic;
        MemRead_in    : in std_logic;
        MemWrite_in   : in std_logic;
        Mux_2_I_type_in : in std_logic;
        Mux_3_IR_type_in : in std_logic;
        Mux_4_I_type_in : in std_logic;

        -- Control signals
        Clock      : in std_logic;
        Reset      : in std_logic;

        -- outputs
        RD_out          : out std_logic_vector(31 downto 0);
        Func3_out       : out std_logic_vector(2 downto 0);
        MemData_out     : out std_logic_vector(31 downto 0);
        ALU_result_out  : out std_logic_vector(31 downto 0);

            --Control unit outputs
        RegWrite_out   : out std_logic;
        MemRead_out    : out std_logic;
        MemWrite_out   : out std_logic;
        Mux_2_I_type_out : out std_logic;
        Mux_3_IR_type_out : out std_logic;
        Mux_4_I_type_out : out std_logic
    );

end entity EX_MEM_Register;

architecture Logic_2 of EX_MEM_Register is

    --Registers
    signal RD_Reg          : std_logic_vector(31 downto 0);
    signal Func3_Reg       : std_logic_vector(2 downto 0);
    signal MemData_Reg     : std_logic_vector(31 downto 0);
    signal ALU_result_Reg  : std_logic_vector(31 downto 0);

    signal RegWrite_Reg   : std_logic;
    signal MemRead_Reg    : std_logic;
    signal MemWrite_Reg   : std_logic;
    signal Mux_2_I_type_Reg : std_logic;
    signal Mux_3_IR_type_Reg : std_logic;
    signal Mux_4_I_type_Reg : std_logic;

    begin

        process(Clock , RD_in, Func3_in, MemData_in, ALU_result_in, RegWrite_in, MemRead_in, MemWrite_in, Mux_2_I_type_in, Mux_3_IR_type_in, Mux_4_I_type_in)
            begin
                if rising_edge(Clock) then
                    if Reset = '1' then
                        RD_Reg          <= (others => '0');
                        Func3_Reg       <= (others => '0');
                        MemData_Reg     <= (others => '0');
                        ALU_result_Reg  <= (others => '0');

                        RegWrite_Reg   <= '0';
                        MemRead_Reg    <= '0';
                        MemWrite_Reg   <= '0';
                        Mux_2_I_type_Reg <= '0';
                        Mux_3_IR_type_Reg <= '0';
                        Mux_4_I_type_Reg <= '0';
                    else
                        RD_Reg          <= RD_in;
                        Func3_Reg       <= Func3_in;
                        MemData_Reg     <= MemData_in;
                        ALU_result_Reg  <= ALU_result_in;

                        RegWrite_Reg   <= RegWrite_in;
                        MemRead_Reg    <= MemRead_in;
                        MemWrite_Reg   <= MemWrite_in;
                        Mux_2_I_type_Reg <= Mux_2_I_type_in;
                        Mux_3_IR_type_Reg <= Mux_3_IR_type_in;
                        Mux_4_I_type_Reg <= Mux_4_I_type_in;
                    end if;
                end if;

                RD_out          <= RD_Reg;
                Func3_out       <= Func3_Reg;
                MemData_out     <= MemData_Reg;
                ALU_result_out  <= ALU_result_Reg;
                
                RegWrite_out   <= RegWrite_Reg;
                MemRead_out    <= MemRead_Reg;
                MemWrite_out   <= MemWrite_Reg;
                Mux_2_I_type_out <= Mux_2_I_type_Reg;
                Mux_3_IR_type_out <= Mux_3_IR_type_Reg;
                Mux_4_I_type_out <= Mux_4_I_type_Reg;
            end process;

end Logic_2;


        

