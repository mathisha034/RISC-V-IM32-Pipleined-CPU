library ieee;
use ieee.std_logic_1164.all;

entity MEM_WB_Register_TB is
    -- No ports in a test bench
end entity MEM_WB_Register_TB;

architecture Behavioral of MEM_WB_Register_TB is

    -- Component Declaration
    component MEM_WB_Register
        port(
            -- Inputs
            RD_in          : in std_logic_vector(31 downto 0);
            MemResult_in   : in std_logic_vector(31 downto 0);
            ALU_result_in  : in std_logic_vector(31 downto 0);
            RegWrite_in    : in std_logic;
            Mux_3_IR_type_in : in std_logic;
            Clock          : in std_logic;
            Reset          : in std_logic;

            -- Outputs
            RD_out          : out std_logic_vector(31 downto 0);
            MemResult_out   : out std_logic_vector(31 downto 0);
            ALU_result_out  : out std_logic_vector(31 downto 0);
            RegWrite_out    : out std_logic;
            Mux_3_IR_type_out : out std_logic
        );
    end component;

    -- Signals to connect to the component
    signal RD_in          : std_logic_vector(31 downto 0) := (others => '0');
    signal MemResult_in   : std_logic_vector(31 downto 0) := (others => '0');
    signal ALU_result_in  : std_logic_vector(31 downto 0) := (others => '0');
    signal RegWrite_in    : std_logic := '0';
    signal Mux_3_IR_type_in : std_logic := '0';
    signal Clock          : std_logic := '0';
    signal Reset          : std_logic := '0';

    signal RD_out         : std_logic_vector(31 downto 0);
    signal MemResult_out  : std_logic_vector(31 downto 0);
    signal ALU_result_out : std_logic_vector(31 downto 0);
    signal RegWrite_out   : std_logic;
    signal Mux_3_IR_type_out : std_logic;

    -- Clock period constant
    constant Clock_Period : time := 10 ps;

begin

    -- Instantiate the Unit Under Test (UUT)
    MEM_WB_IMPL: MEM_WB_Register
        port map(
            RD_in          => RD_in,
            MemResult_in   => MemResult_in,
            ALU_result_in  => ALU_result_in,
            RegWrite_in    => RegWrite_in,
            Mux_3_IR_type_in => Mux_3_IR_type_in,
            Clock          => Clock,
            Reset          => Reset,
            RD_out         => RD_out,
            MemResult_out  => MemResult_out,
            ALU_result_out => ALU_result_out,
            RegWrite_out   => RegWrite_out,
            Mux_3_IR_type_out => Mux_3_IR_type_out
        );

    -- Clock generation
    Clock_Process: process
    begin
        Clock <= '0';
        wait for Clock_Period / 2;
        Clock <= '1';
        wait for Clock_Period / 2;
    end process;

    -- Stimulus process
    Stimulus_Process: process
    begin
        -- Reset the circuit
        Reset <= '1';
        wait for Clock_Period;
        Reset <= '0';
        wait for Clock_Period;

        -- Apply test inputs
        RD_in <= x"00000001";
        MemResult_in <= x"AAAAAAAA";
        ALU_result_in <= x"55555555";
        RegWrite_in <= '1';
        Mux_3_IR_type_in <= '1';
        wait for Clock_Period;

        -- Change inputs
        RD_in <= x"00000002";
        MemResult_in <= x"BBBBBBBB";
        ALU_result_in <= x"CCCCCCCC";
        RegWrite_in <= '0';
        Mux_3_IR_type_in <= '0';
        wait for Clock_Period;

        -- Apply reset during operation
        Reset <= '1';
        wait for Clock_Period;
        Reset <= '0';
        wait for Clock_Period;

        -- Finish simulation
        wait;
    end process;

end architecture Behavioral;
