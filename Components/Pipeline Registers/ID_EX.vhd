library ieee;
use ieee.std_logic_1164.all;

entity ID_EX_Register is
    port(
        -- inputs
            --Data - for registers
        RD_in          : in std_logic_vector(31 downto 0);
        Func3_in       : in std_logic_vector(2 downto 0);
        PC_value_in   : in std_logic_vector(31 downto 0);
        PC_plus_4_in  : in std_logic_vector(31 downto 0);
        Imm_value_in  : in std_logic_vector(31 downto 0);
        RS_1_in       : in std_logic_vector(31 downto 0);
        RS_2_in       : in std_logic_vector(31 downto 0);

            --Control unit inputs
        RegWrite_in   : in std_logic;
        MemRead_in    : in std_logic;
        MemWrite_in   : in std_logic;
        ALUOP_in      : in std_logic_vector(3 downto 0);
        Jump_in       : in std_logic;
        Branch_in     : in std_logic;
        Mux_1_I_type_in : in std_logic;
        Mux_2_I_type_in : in std_logic;
        Mux_3_IR_type_in : in std_logic;
        Mux_4_I_type_in : in std_logic;
        Mux_5_U_type_in : in std_logic;

        -- Control signals
        Clock      : in std_logic;
        Reset      : in std_logic;

        -- outputs
        RD_out          : out std_logic_vector(31 downto 0);
        Func3_out       : out std_logic_vector(2 downto 0);
        PC_value_out   : out std_logic_vector(31 downto 0);
        PC_plus_4_out  : out std_logic_vector(31 downto 0);
        Imm_value_out  : out std_logic_vector(31 downto 0);
        RS_1_out       : out std_logic_vector(31 downto 0);
        RS_2_out       : out std_logic_vector(31 downto 0);

            --Control unit outputs
        RegWrite_out   : out std_logic;
        MemRead_out    : out std_logic;
        MemWrite_out   : out std_logic;
        ALUOP_out      : out std_logic_vector(3 downto 0);
        Jump_out       : out std_logic;
        Branch_out     : out std_logic;
        Mux_1_I_type_out : out std_logic;
        Mux_2_I_type_out : out std_logic;
        Mux_3_IR_type_out : out std_logic;
        Mux_4_I_type_out : out std_logic;
        Mux_5_U_type_out : out std_logic
    );
end entity ID_EX_Register;



architecture Logic_2 of ID_EX_Register is

    --Registers
    signal RD_Reg          : std_logic_vector(31 downto 0);
    signal Func3_Reg       : std_logic_vector(2 downto 0);
    signal PC_value_Reg   : std_logic_vector(31 downto 0);
    signal PC_plus_4_Reg  : std_logic_vector(31 downto 0);
    signal Imm_value_Reg  : std_logic_vector(31 downto 0);
    signal RS_1_Reg       : std_logic_vector(31 downto 0);
    signal RS_2_Reg       : std_logic_vector(31 downto 0);
    
    signal RegWrite_Reg   : std_logic;
    signal MemRead_Reg    : std_logic;
    signal MemWrite_Reg   : std_logic;
    signal ALUOP_Reg      : std_logic_vector(3 downto 0);
    signal Jump_Reg       : std_logic;
    signal Branch_Reg     : std_logic;
    signal Mux_1_I_type_Reg : std_logic;
    signal Mux_2_I_type_Reg : std_logic;
    signal Mux_3_IR_type_Reg : std_logic;
    signal Mux_4_I_type_Reg : std_logic;
    signal Mux_5_U_type_Reg : std_logic;


    begin
        process(Clock, RD_in, Func3_in, PC_value_in, PC_plus_4_in, Imm_value_in, RS_1_in, RS_2_in, RegWrite_in, MemRead_in, MemWrite_in, ALUOP_in, Jump_in, Branch_in, Mux_1_I_type_in, Mux_2_I_type_in, Mux_3_IR_type_in, Mux_4_I_type_in, Mux_5_U_type_in)
        begin
            if rising_edge(Clock) then

                if Reset = '1' then
                    RD_Reg          <= (others => '0');
                    Func3_Reg       <= (others => '0');
                    PC_value_Reg   <= (others => '0');
                    PC_plus_4_Reg  <= (others => '0');
                    Imm_value_Reg  <= (others => '0');
                    RS_1_Reg       <= (others => '0');
                    RS_2_Reg       <= (others => '0');
                    RegWrite_Reg   <= '0';
                    MemRead_Reg    <= '0';
                    MemWrite_Reg   <= '0';
                    ALUOP_Reg      <= (others => '0');
                    Jump_Reg       <= '0';
                    Branch_Reg     <= '0';
                    Mux_1_I_type_Reg <= '0';
                    Mux_2_I_type_Reg <= '0';
                    Mux_3_IR_type_Reg <= '0';
                    Mux_4_I_type_Reg <= '0';
                    Mux_5_U_type_Reg <= '0';
                else
                    RD_Reg          <= RD_in;
                    Func3_Reg       <= Func3_in;
                    PC_value_Reg   <= PC_value_in;
                    PC_plus_4_Reg  <= PC_plus_4_in;
                    Imm_value_Reg  <= Imm_value_in;
                    RS_1_Reg       <= RS_1_in;
                    RS_2_Reg       <= RS_2_in;
                    RegWrite_Reg   <= RegWrite_in;
                    MemRead_Reg    <= MemRead_in;
                    MemWrite_Reg   <= MemWrite_in;
                    ALUOP_Reg      <= ALUOP_in;
                    Jump_Reg       <= Jump_in;
                    Branch_Reg     <= Branch_in;
                    Mux_1_I_type_Reg <= Mux_1_I_type_in;
                    Mux_2_I_type_Reg <= Mux_2_I_type_in;
                    Mux_3_IR_type_Reg <= Mux_3_IR_type_in;
                    Mux_4_I_type_Reg <= Mux_4_I_type_in;
                    Mux_5_U_type_Reg <= Mux_5_U_type_in;
                end if;
            end if;

        end process;

    -- Outputs directly connected to the registers
    RD_out          <= RD_Reg;
    Func3_out       <= Func3_Reg;
    PC_value_out   <= PC_value_Reg;
    PC_plus_4_out  <= PC_plus_4_Reg;
    Imm_value_out  <= Imm_value_Reg;
    RS_1_out       <= RS_1_Reg;
    RS_2_out       <= RS_2_Reg;

    RegWrite_out   <= RegWrite_Reg;
    MemRead_out    <= MemRead_Reg;
    MemWrite_out   <= MemWrite_Reg;
    ALUOP_out      <= ALUOP_Reg;
    Jump_out       <= Jump_Reg;
    Branch_out     <= Branch_Reg;
    Mux_1_I_type_out <= Mux_1_I_type_Reg;
    Mux_2_I_type_out <= Mux_2_I_type_Reg;
    Mux_3_IR_type_out <= Mux_3_IR_type_Reg;
    Mux_4_I_type_out <= Mux_4_I_type_Reg;
    Mux_5_U_type_out <= Mux_5_U_type_Reg;
    
end Logic_2;

    