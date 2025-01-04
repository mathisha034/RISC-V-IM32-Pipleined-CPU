-- Register File
-- Consits of 
-- 1.General purpose registers - only implemented in this file
-- 2.Floating point registers - not implemented
-- 3.Vector registers - not implemented


library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Reg_File is
    port(
        ReadRegister_1 : in std_logic_vector (31 downto 0);
        ReadRegister_2 : in std_logic_vector (31 downto 0);
        WriteRegister  : in std_logic_vector (31 downto 0);
        WriteData      : in std_logic_vector (31 downto 0);
        ReadData_1     : out std_logic_vector (31 downto 0);
        ReadData_2     : out std_logic_vector (31 downto 0);
        
        Clock, Reset, WriteEnable : in std_logic
    );
end Reg_File; 


architecture Logic_01 of Reg_File is    
    
    component General_Purpose_Mem_Module is
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
    end component;
    
begin

    -- Instantiate the General Purpose Memory Module
    General_Purpose_Mem_Module_IMPL : General_Purpose_Mem_Module
        port map(
            ReadRegister1 => ReadRegister_1,
            ReadRegister2 => ReadRegister_2,
            WriteAddress  => WriteRegister,
            WriteData     => WriteData,
            ReadData_1    => ReadData_1,
            ReadData_2    => ReadData_2,
            Clock         => Clock,
            Reset         => Reset,
            WriteEnable   => WriteEnable
        );

end Logic_01;